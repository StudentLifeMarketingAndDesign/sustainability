<style type="text/css">
	section {border-bottom: 1px solid #ccc;margin-bottom: 100px;padding-bottom: 100px;}
	.show-grid {margin-bottom: 15px;}
	.show-grid [class^="col-"] {
		padding-top: 10px;
		padding-bottom: 10px;
		background-color: #ddd;
		border: 1px solid #ccc;
	}
</style>
<div class="container">
	<h1>H1. This is a very large header.</h1>
	<p>The first paragraph after an H1 has an increased font-size. Nullam id dolor id nibh ultricies vehicula ut id elit.</p>
	<p>Lorem ipsum dolor sit amet, consectetur adipiscing elit.</p>
	<h2>H2. This is a large header.</h2>
	<p>Nullam id dolor id nibh ultricies vehicula ut id elit. Cum sociis natoque penatibus et magnis dis parturient montes.</p>
	<h3>H3. This is a medium header.</h3>
	<p>Fusce dapibus, tellus ac cursus commodo, tortor mauris condimentum nibh, ut fermentum massa justo sit amet risus.</p>
	<h4>H4. This is a moderate header.</h4>
	<p>Aenean lacinia bibendum nulla sed consectetur. Praesent commodo cursus magna, vel scelerisque nisl consectetur et.</p>
	<h5>H5. This is small header.</h5>
	<p>Cum sociis natoque penatibus magnis parturient montes, nascetur ridiculus mus. Sed consectetur est at lobortis.</p>
	<h6>H6. This is very small header.</h6>
	<p>Donec id elit non mi porta gravida at eget metus. Curabitur blandit tempus porttitor.</p>

	<h2>Lede Paragraph</h2>
	<p class="lede">Add a class of <code>.lede</code> to to the opening paragraph to increase the font-size. Praesent commodo cursus magna, vel scelerisque nisl consectetur et. Aenean lacinia bibendum nulla sed consectetur.</p>
	<p>Vestibulum id ligula porta felis euismod semper. Cras mattis consectetur purus sit amet fermentum. Aenean lacinia bibendum nulla sed consectetur. Sed posuere consectetur est at lobortis. Duis mollis, est non commodo luctus, nisi erat porttitor ligula, eget lacinia odio sem nec elit.</p>
	<h3>Link Styles</h3>
	<p>Etiam porta sem malesuada <a href="#">magna mollis euismod</a>. Nullam id dolor id nibh ultricies vehicula ut id elit. Vestibulum id ligula porta felis euismod semper. Donec ullamcorper nulla non metus auctor fringilla. Vestibulum id ligula porta felis euismod semper. Nulla vitae elit libero, a pharetra augue.</p>
	<p>Cum sociis natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus. Nulla vitae elit <a href="#">libero a pharetra augue</a>. Cras mattis consectetur purus sit amet fermentum. Lorem ipsum dolor sit amet, consectetur adipiscing elit.</p>
	<h3>Unordered List</h3>
	<p>A list of items in which the order does not explicitly matter.</p>
	<ul>
		<li>List item with a much longer description or more content.</li>
		<li>List item</li>
		<li>List item
			<ul>
				<li>Nested List Item</li>
				<li>Nested List Item</li>
				<li>Nested List Item</li>
			</ul>
		</li>
		<li>List item</li>
		<li>List item</li>
		<li>List item</li>
	</ul>
	<h3>Ordered List</h3>
	<p>A list of items in which the order does explicitly matter.</p>
	<ol>
		<li>List item with a much longer description or more content.</li>
		<li>List item</li>
		<li>List item
			<ol>
				<li>Nested List Item</li>
				<li>Nested List Item</li>
				<li>Nested List Item</li>
			</ol>
		</li>
		<li>List item</li>
		<li>List item</li>
		<li>List item</li>
	</ol>
	<h3>Unstyled List</h3>
	<p>A list of items with a class <code>.unstyled</code>.</p>
	<ul class="unstyled">
		<li>List item</li>
		<li>List item</li>
		<li>List item</li>
		<li>List item</li>
		<li>List item</li>
		<li>List item</li>
	</ul>
	<section>
		<h1>Blockquotes</h1>
		<p>Morbi leo risus, porta ac consectetur ac, vestibulum at eros. Nullam id dolor id nibh ultricies vehicula ut id elit. Morbi leo risus, porta ac consectetur ac, vestibulum at eros.</p>
		<blockquote>
			<p>I do not fear computers. I fear the lack of them.</p>
			<small>Isaac Asimov</small>
		</blockquote>

		<h4>Pull-Right</h4>
		<p>Use <code>.pull-right</code> for a floated, right-aligned blockquote. Morbi leo risus, porta ac</p>
		<blockquote class="pull-right">
			<p>This blockquote is using a class of "pull-right"</p>
			<small>Isaac Asimov</small>
		</blockquote>
		<p>Vestibulum at eros. Aenean eu leo quam. Pellentesque ornare sem lacinia quam venenatis vestibulum. Vivamus sagittis lacus vel augue laoreet rutrum faucibus dolor auctor. Etiam porta sem malesuada magna mollis euismod. Cras mattis consectetur purus sit amet fermentum. Aenean lacinia bibendum nulla sed consectetur. Morbi leo risus, porta ac consectetur ac vestibulum eros.</p>
	</section>
	<section>
		<h1>Tables</h1>
		<h4>Default styles</h4>
		<p>For basic styling&mdash;light padding and only horizontal dividers&mdash;add the base class <code>.table</code> to any <code>&lt;table&gt;</code>.</p>
		<table class="table">
			<thead>
				<tr>
					<th>#</th>
					<th>First Name</th>
					<th>Last Name</th>
					<th>Username</th>
				</tr>
			</thead>
			<tbody>
				<tr>
					<td>1</td>
					<td>Mark</td>
					<td>Otto</td>
					<td>@mdo</td>
				</tr>
				<tr>
					<td>2</td>
					<td>Jacob</td>
					<td>Thornton</td>
					<td>@fat</td>
				</tr>
				<tr>
					<td>3</td>
					<td>Larry</td>
					<td>the Bird</td>
					<td>@twitter</td>
				</tr>
			</tbody>
		</table>

		<h3>Optional classes</h3>
		<h4><code>.table-striped</code></h4>
		<p>Adds zebra-striping to any table row within the <code>&lt;tbody&gt;</code> via the <code>:nth-child</code> CSS selector (not available in IE7-IE8).</p>
		<table class="table table-striped">
			<thead>
				<tr>
					<th>#</th>
					<th>First Name</th>
					<th>Last Name</th>
					<th>Username</th>
				</tr>
			</thead>
			<tbody>
				<tr>
					<td>1</td>
					<td>Mark</td>
					<td>Otto</td>
					<td>@mdo</td>
				</tr>
				<tr>
					<td>2</td>
					<td>Jacob</td>
					<td>Thornton</td>
					<td>@fat</td>
				</tr>
				<tr>
					<td>3</td>
					<td>Larry</td>
					<td>the Bird</td>
					<td>@twitter</td>
				</tr>
			</tbody>
		</table>

		<h4><code>.table-bordered</code></h4>
		<p>Add borders and rounded corners to the table.</p>
		<table class="table table-bordered">
			<thead>
				<tr>
					<th>#</th>
					<th>First Name</th>
					<th>Last Name</th>
					<th>Username</th>
				</tr>
			</thead>
			<tbody>
				<tr>
					<td rowspan="2">1</td>
					<td>Mark</td>
					<td>Otto</td>
					<td>@mdo</td>
				</tr>
				<tr>
					<td>Mark</td>
					<td>Otto</td>
					<td>@TwBootstrap</td>
				</tr>
				<tr>
					<td>2</td>
					<td>Jacob</td>
					<td>Thornton</td>
					<td>@fat</td>
				</tr>
				<tr>
					<td>3</td>
					<td colspan="2">Larry the Bird</td>
					<td>@twitter</td>
				</tr>
			</tbody>
		</table>

		<h4><code>.table-hover</code></h4>
		<p>Enable a hover state on table rows within a <code>&lt;tbody&gt;</code>.</p>
		<table class="table table-hover">
			<thead>
				<tr>
					<th>#</th>
					<th>First Name</th>
					<th>Last Name</th>
					<th>Username</th>
				</tr>
			</thead>
			<tbody>
				<tr>
					<td>1</td>
					<td>Mark</td>
					<td>Otto</td>
					<td>@mdo</td>
				</tr>
				<tr>
					<td>2</td>
					<td>Jacob</td>
					<td>Thornton</td>
					<td>@fat</td>
				</tr>
				<tr>
					<td>3</td>
					<td colspan="2">Larry the Bird</td>
					<td>@twitter</td>
				</tr>
			</tbody>
		</table>

		<h4><code>.table-condensed</code></h4>
		<p>Makes tables more compact by cutting cell padding in half.</p>
		<table class="table table-condensed">
			<thead>
				<tr>
					<th>#</th>
					<th>First Name</th>
					<th>Last Name</th>
					<th>Username</th>
				</tr>
			</thead>
			<tbody>
				<tr>
					<td>1</td>
					<td>Mark</td>
					<td>Otto</td>
					<td>@mdo</td>
				</tr>
				<tr>
					<td>2</td>
					<td>Jacob</td>
					<td>Thornton</td>
					<td>@fat</td>
				</tr>
				<tr>
					<td>3</td>
					<td colspan="2">Larry the Bird</td>
					<td>@twitter</td>
				</tr>
			</tbody>
		</table>
		<h2 id="tables-responsive">Responsive tables</h2>
		<p>Create responsive tables by wrapping any <code>.table</code> in <code>.table-responsive</code> to make them scroll horizontally up to small devices (under 768px). When viewing on anything larger than 768px wide, you will not see any difference in these tables.</p>
		<div class="table-responsive">
			<table class="table">
			  <thead>
				<tr>
				  <th>#</th>
				  <th>Table heading</th>
				  <th>Table heading</th>
				  <th>Table heading</th>
				  <th>Table heading</th>
				  <th>Table heading</th>
				  <th>Table heading</th>
				</tr>
			  </thead>
			  <tbody>
				<tr>
				  <td>1</td>
				  <td>Table cell</td>
				  <td>Table cell</td>
				  <td>Table cell</td>
				  <td>Table cell</td>
				  <td>Table cell</td>
				  <td>Table cell</td>
				</tr>
				<tr>
				  <td>2</td>
				  <td>Table cell</td>
				  <td>Table cell</td>
				  <td>Table cell</td>
				  <td>Table cell</td>
				  <td>Table cell</td>
				  <td>Table cell</td>
				</tr>
				<tr>
				  <td>3</td>
				  <td>Table cell</td>
				  <td>Table cell</td>
				  <td>Table cell</td>
				  <td>Table cell</td>
				  <td>Table cell</td>
				  <td>Table cell</td>
				</tr>
			  </tbody>
			</table>
		</div><!-- /.table-responsive -->
	</section>
	<section>
		<h1>Carousels</h1>
		<div class="row">
			<div class="col-sm-6">
				<h3>Flexslider</h3>
				<h5>CSS</h5>
				<p>import the following scss file in site.scss</p>
				<textarea rows="1" style="width:100%;">
	@import "imports/flexslider.scss";
				</textarea>
				<h5>HTML</h5>
				<textarea rows="10" style="width:100%;">
	<div class="flexslider">
	<ul class="slides">
	<li><img src="images/flexslider/slide1.jpg" alt="" /></li>
	<li>
	<img src="images/flexslider/slide2.jpg" alt="" />
	<p class="flex-caption">Caption Goes Here.</p>
	</li>
	<li><img src="images/flexslider/slide3.jpg" alt="" /></li>
	</ul>
	</div>
				</textarea>
				<h5>Javascript</h5>
				<textarea rows="3" style="width:100%">
	$('.flexslider').flexslider({
	slideshow: false
	});
				</textarea>
			</div>
			<div class="col-sm-6">
				<div class="flexslider">
					<ul class="slides">
						<li>
							<img src="images/flexslider/slide1.jpg" alt="" />
						</li>
						<li>
							<img src="images/flexslider/slide2.jpg" alt="" />
							<p class="flex-caption">Caption Goes Here.</p>
						</li>
						<li>
							<img src="images/flexslider/slide3.jpg" alt="" />
						</li>
					</ul>
				</div>
				<p>Advanced settings can be found <a href="http://www.woothemes.com/flexslider/">here</a></p>
			</div>
		</div>
	</section>
	<section>
		<h1>Forms</h1>
		<form role="form">
		  <div class="form-group">
			<label for="exampleInputEmail1">Email address</label>
			<input type="email" class="form-control" id="exampleInputEmail1" placeholder="Enter email">
		  </div>
		  <div class="form-group">
			<label for="exampleInputPassword1">Password</label>
			<input type="password" class="form-control" id="exampleInputPassword1" placeholder="Password">
		  </div>
		  <div class="row form-group">
			  <div class="col-md-2">
				<input type="text" class="form-control" placeholder=".col-md-2">
			  </div>
			  <div class="col-md-3">
				<input type="text" class="form-control" placeholder=".col-md-3">
			  </div>
			  <div class="col-md-4">
				<input type="text" class="form-control" placeholder=".col-md-4">
			  </div>
		  </div>
		  <div class="form-group">
			<label for="exampleinputlg">Large input</label>
			<input class="form-control input-lg" type="text" id="exampleinputlg" placeholder=".input-lg">
		  </div>
		  <div class="form-group">
			<label for="exampleinputsm">Small input</label>
			<input class="form-control input-sm" type="text" id="exampleinputsm" placeholder=".input-sm">
		  </div>
		  <div class="form-group">
			<label for="exampleInputFile">File input</label>
			<input type="file" id="exampleInputFile">
			<p class="help-block">Example block-level help text here.</p>
		  </div>
			<div class="checkbox">
				<label>
					<input type="checkbox" value="">
					Option one is this and that&mdash;be sure to include why it's great
				</label>
			</div>
			<div class="radio">
				<label>
				<input type="radio" name="optionsRadios" id="optionsRadios1" value="option1" checked>
				Option one is this and that&mdash;be sure to include why it's great
				</label>
			</div>
			<div class="radio">
				<label>
				<input type="radio" name="optionsRadios" id="optionsRadios2" value="option2">
				Option two can be something else and selecting it will deselect option one
				</label>
			</div>
		  <button type="submit" class="btn btn-default">Submit</button>
		</form>

		<hr>

		<h3>Inline form</h3>
		<p>Add <code>.form-inline</code> for left-aligned labels and inline-block controls for a compact layout.</p>
		<form class="form-inline" role="form">
		  <div class="form-group">
			<label class="sr-only" for="exampleInputEmail2">Email address</label>
			<input type="email" class="form-control" id="exampleInputEmail2" placeholder="Enter email">
		  </div>
		  <div class="form-group">
			<label class="sr-only" for="exampleInputPassword2">Password</label>
			<input type="password" class="form-control" id="exampleInputPassword2" placeholder="Password">
		  </div>
		  <div class="checkbox">
			<label>
			  <input type="checkbox"> Remember me
			</label>
		  </div>
		  <button type="submit" class="btn btn-default">Sign in</button>
		</form>
	</section>

	<section>
		<h1>Buttons</h1>
		<p>Button styles can be applied to anything with the <code>.btn</code> class applied. However, typically you'll want to apply these to only <code>&lt;a&gt;</code> and <code>&lt;button&gt;</code> elements for the best rendering.</p>
		<table class="table table-bordered table-striped">
			<thead>
				<tr>
					<th>Button</th>
					<th>class=""</th>
				</tr>
			</thead>
			<tbody>
				<tr>
					<td><button type="button" class="btn btn-default">Default</button></td>
					<td><code>btn btn-default</code></td>
				</tr>
				<tr>
					<td><button type="button" class="btn btn-primary">Primary</button></td>
					<td><code>btn btn-primary</code></td>
				</tr>
				<tr>
					<td><button type="button" class="btn btn-success">success</button></td>
					<td><code>btn btn-success</code></td>
				</tr>
				<tr>
					<td><button type="button" class="btn btn-info">info</button></td>
					<td><code>btn btn-info</code></td>
				</tr>
				<tr>
					<td><button type="button" class="btn btn-warning">warning</button></td>
					<td><code>btn btn-warning</code></td>
				</tr>
				<tr>
					<td><button type="button" class="btn btn-danger">danger</button></td>
					<td><code>btn btn-danger</code></td>
				</tr>
				<tr>
					<td><button type="button" class="btn btn-link">link</button></td>
					<td><code>btn btn-link</code></td>
				</tr>
			</tbody>
		</table>

		<h3>Button sizes</h3>
		<p>Fancy larger or smaller buttons? Add <code>.btn-lg</code>, <code>.btn-sm</code>, or <code>.btn-xs</code> for additional sizes.</p>
		<p><button type="button" class="btn btn-lg btn-default">Large button</button></p>
		<p><button type="button" class="btn btn-default">Default button</button></p>
		<p><button type="button" class="btn btn-sm btn-default">Small button</button></p>
		<p><button type="button" class="btn btn-xs btn-default">Mini button</button></p>

	</section>

	<section>
		<h1>Grid</h1>
		<div class="row show-grid">
			<div class="col-xs-12 col-md-4">
				<span>.col-xs-12 .col-md-4</span>
			</div>
			<div class="col-xs-6 col-md-4">
				<span>.col-xs-6 .col-md-4</span>
			</div>
			<div class="col-xs-6 col-md-4">
				<span>.col-xs-6 .col-md-4</span>
			</div>
		</div>

		<div class="row show-grid">
			<div class="col-md-3 col-lg-6">
				<span>.col-md-3  .col-lg-6</span>
			</div>
			<div class="col-md-3 col-lg-6">
				<span>.col-md-3  .col-lg-6</span>
			</div>
			<div class="col-md-3 col-lg-6">
				<span>.col-md-3  .col-lg-6</span>
			</div>
			<div class="col-md-3 col-lg-6">
				<span>.col-md-3  .col-lg-6</span>
			</div>
		</div>

		<div class="row show-grid">
			<div class="col-md-8">
				<span>.col-md-8</span>
			</div>
			<div class="col-md-4">
				<span>.col-md-4</span>
			</div>
		</div>

		<div class="row show-grid">
			<div class="col-md-2">
				<span>.col-md-2</span>
			</div>
			<div class="col-md-2">
				<span>.col-md-2</span>
			</div>
			<div class="col-md-2">
				<span>.col-md-2</span>
			</div>
			<div class="col-md-2">
				<span>.col-md-2</span>
			</div>
			<div class="col-md-2">
				<span>.col-md-2</span>
			</div>
			<div class="col-md-2">
				<span>.col-md-2</span>
			</div>
		</div>

	</section>
</div>