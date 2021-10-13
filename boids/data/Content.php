<p>Les commentaires sont utilisés pour spécifier ou expliquer certaines portions de codes.</p>
<p>En HTML la syntaxe est la suivante : <code style='opacity: 0.6;'>&lt;!-- CONTENU ICI --&gt;</code></p>
<table id='table-comment-type'>
	<caption>Test</caption>
	<tr>
		<th>Inline</td>
		<th>Multiline</td>
		<th>Entre les lignes de codes</td>
	</tr>
	<tr style='height: 150px;'>
		<td><code class='code-style'>&lt;!-- CONTENU ICI --&gt;</code></th>
		<td><code class='code-style'>&lt;!-- <br/>CONTENU<br/>ICI<br/>OU<br/>LÀ --&gt;</code></th>
		<td><code class='code-style'>&lt;!-- CONTENU ICI --&gt;</code></th>
	</tr>
</table>
 <input type="range" min="0" max="2" value="1" id="slider" step='0.01'>

<script type='text/javascript'>
	let boids;
	let obstacles;
	let slider = document.getElementById('slider');
	
	function hslToRgb(h, s, l) {
	  var r, g, b;

	  if (s == 0) {
	    r = g = b = l; // achromatic
	  } else {
	    function hue2rgb(p, q, t) {
	      if (t < 0) t += 1;
	      if (t > 1) t -= 1;
	      if (t < 1/6) return p + (q - p) * 6 * t;
	      if (t < 1/2) return q;
	      if (t < 2/3) return p + (q - p) * (2/3 - t) * 6;
	      return p;
	    }

	    var q = l < 0.5 ? l * (1 + s) : l + s - l * s;
	    var p = 2 * l - q;

	    r = hue2rgb(p, q, h + 1/3);
	    g = hue2rgb(p, q, h);
	    b = hue2rgb(p, q, h - 1/3);
	  }

	  return [ r * 255, g * 255, b * 255 ];
	}

	class Boid {
		constructor(){
			this.position = createVector(floor(random(0,width)),floor(random(0,height)));
			this.detectionRadius = 40;
			this.velocity = p5.Vector.random2D();
			this.acceleration = createVector();
			this.speed = random(2,5);
		}

		edges(){
			if(this.position.x < 0) this.position.x = width - 2;
			if(this.position.x > width) this.position.x = 2;
			if(this.position.y < 0) this.position.y = height - 2;
			if(this.position.y > height) this.position.y = 2;
		}

		flock(boids){
			let separate = createVector();
			let cohesion = createVector();
			let alignment = createVector();
			let b_size = boids.length;
			for(let i = 0;i < b_size;i++){
				let current = boids[i];
				separate.add(p5.Vector.sub(this.position,current.position).setMag(2 / dist(this.position.x,this.position.y,current.position.x,current.position.y)));
				cohesion.add(current.position);
				alignment.add(current.velocity);
			}
			this.acceleration.add(separate.div(b_size).setMag(random(2,4)).limit(1));
			this.acceleration.add(alignment.div(b_size).sub(this.velocity));
			this.acceleration.add(cohesion.div(b_size).sub(this.position).limit(0.9));
		}

		render(){
			let angle = atan(this.velocity.y/this.velocity.x);
			let color = hslToRgb(2/(this.velocity.x*this.velocity.x+this.velocity.y*this.velocity.y),1,0.5); 
			if(this.velocity.x < 0) angle -= PI;

			noStroke();
			push();
			fill(color[0],color[1],color[2]);
			translate(this.position.x,this.position.y);
			rotate(angle);
			beginShape();
			vertex(-4,-2);
			vertex(4,0);
			vertex(-4,2);
			endShape();
			pop();
		}

		update(){
			let filtered = boids.filter(element => element != this && dist(this.position.x, this.position.y, element.position.x, element.position.y) < this.detectionRadius);

			this.edges();
			this.position.add(this.velocity);
			this.velocity.add(this.acceleration);
			this.acceleration.mult(0);
			this.flock(filtered);
			this.velocity.setMag(this.speed);
			//this.velocity.mult(0.99);
		}
	}

	class Obstacle {
		constructor(position,radius,radiusRepulsion){
			this.position = position;
			this.radiusRepulsion = radiusRepulsion;
		}

		render(){
			stroke(255,0,0);
			noFill();
			ellipse(this.position.x,this.position.y,this.radiusRepulsion*2,this.radiusRepulsion*2);
		}

		update(boids){
			for(let i = 0;i < boids.length;i++)
				if(dist(boids[i].position.x,boids[i].position.y,this.position.x,this.position.y) < this.radiusRepulsion)
					boids[i].acceleration.add(p5.Vector.sub(boids[i].position,this.position).limit(2.5));
		}
	}

	class Polygon {
		constructor(points){
			this.points = points;
		}

		render(){
			stroke(0);
			beginShape();
			for(let i = 0;i < this.points.length;i++){
				let next = (i == this.points.length - 1) ? 0 : i+1;
				strokeWeight(5);
				point(this.points[i]);
				strokeWeight(1);
				line(this.points[i].x,this.points[i].y,this.points[next].x,this.points[next].y);

			}
			endShape();
		}
	}

	let poly;

	function setup(){
		let canvas = createCanvas(900,400);
		canvas.parent('content');
		boids = [];
		obstacles = [];
		obstacles.push(new Obstacle(createVector(0,0),5,50));
		obstacles.push(new Obstacle(createVector(0,height),5,50));
		obstacles.push(new Obstacle(createVector(width/4,height/2),5,50));
		obstacles.push(new Obstacle(createVector(width/2,height/2),5,150));
		obstacles.push(new Obstacle(createVector(width - width/4,height/2),5,50));
		obstacles.push(new Obstacle(createVector(width,0),5,50));
		obstacles.push(new Obstacle(createVector(width,height),5,50));
		
		poly = new Polygon([createVector(40,40),createVector(80,40),createVector(80,80),createVector(80,160),createVector(40,80)]);

		for(let i = 0;i < 325;i++){
			boids.push(new Boid());
		}
		frameRate(120);
	}

	function draw() {
		background(0);
		//poly.render();
		stroke(255);
		//print(frameRate,0,10);

		strokeWeight(2);
		for(let i = 0;i < boids.length;i++){
			boids[i].update();
			boids[i].render();
		}

		for(let i = 0;i < obstacles.length;i++){
			obstacles[i].update(boids);
			obstacles[i].render();
		}
	}
</script>