<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<c:import url="/WEB-INF/jsp/headerLinks.jsp" />
<c:import url="/WEB-INF/jsp/header.jsp" />

<!-- TODO: Build tool for choosing the next book based on:
1. Different genre than last time
2. Inspirational/Interesting
3. Getaway
4. How long it's been on the list
5. Sounds good at the moment -->

<div class="container-fluid bg-1 text-center">
	<div class="mid-page bg-2">
	    <div class="row">
	        <div class="col-md-12"><h1>Book Recommendations</h1></div>
	    </div>
	    <div class="row">
	        <div class="col-md-12">
	        <p>I've read a ton of great stuff. Please consider purchasing through this site. 
	        It helps me improve the list. Click <a href="mailto:drew.sullivan.dma@gmail.com">here</a> to contact me</p>
	        </div>
	    </div>
	    <div class="row">
	        <div class="col-md-12">
	            <div class="dropdown">
	                <form action="bookRecommendations.jsp" method="POST">
	                    <select disabled name="myselect" id="myselect" onchange="this.form.submit()">
	                        <option selected="selected" disabled="disabled" value="1">Filter By...</option>
	                        <option value="all">The Whole List</option>
	                        <option value="nonFiction">Non-Fiction</option>
	                        <option value="fiction">Fiction</option>
	                    </select>
	                </form>
	            </div>
	        </div>
    	</div>
	    <div class="row">
	        <div class="col-md-12 section-title"><h2>Non-Fiction</h2></div>
	    </div>
	    <div class="row">
	        <div class="col-md-12 section-content">
	            <a href="#" data-toggle="modal" data-target="#largeModalIsaccson">
	                Steve Jobs</a> &mdash; Walter Isaccson
	            <div class="modal fade" id="largeModalIsaccson" tabindex="-1" role="dialog" aria-labelledby="largeModal" aria-hidden="true">
	                <div class="modal-dialog modal-lg">
	                    <div class="modal-content">
	                        <div class="modal-header">
	                            <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
	                            <h3 class="modal-title" id="myModalLabel">(At least) One Takeaway</h3>
	                        </div>
	                        <div class="modal-body">
	                            <ul>
	                            	<li>Learn to develop a concept of what you're looking for, then work towards that ideal</li>
									<li>Explore topics and opportunities out of left field</li>
									<li>Test to make sure the easy things work before you dive into anything sophisticated</li>
	                            </ul>
	                        </div>
	                    </div>
	                </div>
	            </div>
	            <div class="pull-right icon-list">
	                <a href="#"><i class="fa fa-book" aria-hidden="true"></i></a>
	                <a href="#"><i class="fa fa-book" aria-hidden="true"></i></a>
	                <a href="#"><i class="fa fa-book" aria-hidden="true"></i></a>
	            </div>
	        </div>
	    </div> <!-- row -->
	    <div class="row">
	        <div class="col-md-12 section-content">
	            <a href="#" data-toggle="modal" data-target="#largeModalVance">
	                Elon Musk</a> &mdash; Ashley Vance
	            <div class="modal fade" id="largeModalVance" tabindex="-1" role="dialog" aria-labelledby="largeModal" aria-hidden="true">
	                <div class="modal-dialog modal-lg">
	                    <div class="modal-content">
	                        <div class="modal-header">
	                            <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
	                            <h3 class="modal-title" id="myModalLabel">(At least) One Takeaway</h3>
	                        </div>
	                        <div class="modal-body">
	                            <ul>
	                            	<li>Dream as big as humanly possible</li>
									<li>You can make the world a better place through making cool products</li>
									<li>Learn and keep learning</li>
	                            </ul>
	                        </div>
	                    </div>
	                </div>
	            </div>
	            <div class="pull-right icon-list">
	                <a href="#"><i class="fa fa-book" aria-hidden="true"></i></a>
	                <a href="#"><i class="fa fa-book" aria-hidden="true"></i></a>
	                <a href="#"><i class="fa fa-book" aria-hidden="true"></i></a>
	            </div>
	        </div>
	    </div> <!-- row -->
	    <div class="row">
	        <div class="col-md-12 section-content">
	            <a href="#" data-toggle="modal" data-target="#largeModalCarnegie">
	                How to Win Friends and Influence People
	            </a> &mdash; Dale Carnegie
	            <div class="modal fade" id="largeModalCarnegie" tabindex="-1" role="dialog" aria-labelledby="largeModal" aria-hidden="true">
	                <div class="modal-dialog modal-lg">
	                    <div class="modal-content">
	                        <div class="modal-header">
	                            <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
	                            <h3 class="modal-title" id="myModalLabel">(At least) One Takeaway</h3>
	                        </div>
	                        <div class="modal-body">
	                            <ul>
	                            	<li>'And,' not 'but,' or else no one will believe you</li>
									<li>Don't criticize, condemn or complain</li>
									<li>If you disagree with someone, try to see the situation from their perspective. Given their experiences and circumstance, you'd probably make the same decisions they've made</li>
	                            </ul>
	                        </div>
	                    </div>
	                </div>
	            </div>
	            <div class="pull-right icon-list">
	                <a href="#"><i class="fa fa-book" aria-hidden="true"></i></a>
	                <a href="#"><i class="fa fa-book" aria-hidden="true"></i></a>
	                <a href="#"><i class="fa fa-book" aria-hidden="true"></i></a>
	            </div>
	        </div>
	    </div> <!-- row -->
	    <div class="row">
	        <div class="col-md-12 section-content">
	            <a href="#" data-toggle="modal" data-target="#largeModalEricsson">
	                Peak
	            </a> &mdash; Anders Ericsson
	            <div class="modal fade" id="largeModalEricsson" tabindex="-1" role="dialog" aria-labelledby="largeModal" aria-hidden="true">
	                <div class="modal-dialog modal-lg">
	                    <div class="modal-content">
	                        <div class="modal-header">
	                            <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
	                            <h3 class="modal-title" id="myModalLabel">(At least) One Takeaway</h3>
	                        </div>
	                        <div class="modal-body">
	                            <ul>
	                            	<li>Anything can be learned by anyone. It just may take some of us a little longer than others</li>
									<li>There is a magic period for learning in children's lives where they experience a 'fast-lane' of learning. It's before they get to about 12 years old</li>
									<li>How to practice deliberately - the book is worth it for this alone</li>
	                            </ul>
	                        </div>
	                    </div>
	                </div>
	            </div>
	            <div class="pull-right icon-list">
	                <a href="#"><i class="fa fa-book" aria-hidden="true"></i></a>
	                <a href="#"><i class="fa fa-book" aria-hidden="true"></i></a>
	                <a href="#"><i class="fa fa-book" aria-hidden="true"></i></a>
	            </div>
	        </div>
	    </div> <!-- row -->
	    <div class="row">
	        <div class="col-md-12 section-content">
	            <a href="#" data-toggle="modal" data-target="#largeModalBrown">
	                Make It Stick
	            </a> &mdash; Peter C. Brown, et al
	            <div class="modal fade" id="largeModalBrown" tabindex="-1" role="dialog" aria-labelledby="largeModal" aria-hidden="true">
	                <div class="modal-dialog modal-lg">
	                    <div class="modal-content">
	                        <div class="modal-header">
	                            <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
	                            <h3 class="modal-title" id="myModalLabel">(At least) One Takeaway</h3>
	                        </div>
	                        <div class="modal-body">
	                            <ul>
	                            	<li>Interleaved practice/study produces 214% greater learning speed and retention</li>
									<li>Massed practice - 'repeat this 10x' - gives the idea that you're learning, but you aren't getting much done after the first couple reps</li>
									<li>To learn more, recall more. Put the book away and try to summarize what you've learned. Then go back and fill in the gaps. I did this for my doctoral exit exams, and I was able to reproduce about 12 pages of material for the written portion because I understood the material so well.</li>
	                            </ul>
	                        </div>
	                    </div>
	                </div>
	            </div>
	            <div class="pull-right icon-list">
	                <a href="#"><i class="fa fa-book" aria-hidden="true"></i></a>
	                <a href="#"><i class="fa fa-book" aria-hidden="true"></i></a>
	                <a href="#"><i class="fa fa-book" aria-hidden="true"></i></a>
	            </div>
	        </div>
	    </div> <!-- row -->
	    <div class="row">
	        <div class="col-md-12 section-content">
	            <a href="#" data-toggle="modal" data-target="#largeModalKaufman">
	                The Personal MBA
	            </a> &mdash; Josh Kaufman
	            <div class="modal fade" id="largeModalKaufman" tabindex="-1" role="dialog" aria-labelledby="largeModal" aria-hidden="true">
	                <div class="modal-dialog modal-lg">
	                    <div class="modal-content">
	                        <div class="modal-header">
	                            <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
	                            <h3 class="modal-title" id="myModalLabel">(At least) One Takeaway</h3>
	                        </div>
	                        <div class="modal-body">
	                            <ul>
	                            	<li>Why spend $150K to go to business school when the information is all in books? Connections? I hope those connections and that interview are worth that much</li>
									<li>A great primer on all the functional areas of business. This allows you to zero-in on the areas you might be interested in, if you're thinking of switching careers, and sample them out. I explored accounting, consulting, design, finance, and marketing before diving into software development</li>
	                            </ul>
	                        </div>
	                    </div>
	                </div>
	            </div>
	            <div class="pull-right icon-list">
	                <a href="#"><i class="fa fa-book" aria-hidden="true"></i></a>
	                <a href="#"><i class="fa fa-book" aria-hidden="true"></i></a>
	                <a href="#"><i class="fa fa-book" aria-hidden="true"></i></a>
	            </div>
	        </div>
	    </div> <!-- row -->
	    <div class="row">
	        <div class="col-md-12 section-content">
	            <a href="#" data-toggle="modal" data-target="#largeModalIsaacson2">
	                Benjamin Franklin: An American Life
	            </a> &mdash; Walter Isaacson
	            <div class="modal fade" id="largeModalIsaacson2" tabindex="-1" role="dialog" aria-labelledby="largeModal" aria-hidden="true">
	                <div class="modal-dialog modal-lg">
	                    <div class="modal-content">
	                        <div class="modal-header">
	                            <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
	                            <h3 class="modal-title" id="myModalLabel">(At least) One Takeaway</h3>
	                        </div>
	                        <div class="modal-body">
	                            <ul>
	                            	<li>You can teach yourself to get better at anything you do</li>
	                                <li>Maintain curiosity throughout your entire life</li>
	                                <li>Look for the practical in everything you do</li>
	                                <li>In some circumstances, it makes sense to look busy. In others, it's more profitable to make everything seem easy. Learn to figure out which situation you're in quickly</li>
	                            </ul>
	                        </div>
	                    </div>
	                </div>
	            </div>
	            <div class="pull-right icon-list">
	                <a href="#"><i class="fa fa-book" aria-hidden="true"></i></a>
	                <a href="#"><i class="fa fa-book" aria-hidden="true"></i></a>
	                <a href="#"><i class="fa fa-book" aria-hidden="true"></i></a>
	            </div>
	        </div>
	    </div> <!-- row -->
	    <div class="row">
	        <div class="col-md-12 section-title"><h2>Fiction</h2></div>
	    </div>
	    <div class="row">
	        <div class="col-md-12 section-content">
	            <a href="#" data-toggle="modal" data-target="#largeModalClarke">
	                2001: A Space Odyssey
	            </a> &mdash; Arthur C. Clarke
	            <div class="modal fade" id="largeModalClarke" tabindex="-1" role="dialog" aria-labelledby="largeModal" aria-hidden="true">
	                <div class="modal-dialog modal-lg">
	                    <div class="modal-content">
	                        <div class="modal-header">
	                            <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
	                            <h3 class="modal-title" id="myModalLabel">(At least) One Takeaway</h3>
	                        </div>
	                        <div class="modal-body">
	                            <ul>
	                            	<li><i>"But please remember: this is only a work of fiction. The truth, as always, will be far stranger."</i></li>
									<li><i>"The only way of discovering the limits of the possible is to venture a little way past them into the impossible."</i></li>
									<li>An unanswered question is far more intriguing than one to which you know all the answers</li>
	                            </ul>
	                        </div>
	                    </div>
	                </div>
	            </div>
	            <div class="pull-right icon-list">
	                <a href="#"><i class="fa fa-book" aria-hidden="true"></i></a>
	                <a href="#"><i class="fa fa-book" aria-hidden="true"></i></a>
	                <a href="#"><i class="fa fa-book" aria-hidden="true"></i></a>
	            </div>
	        </div>
	    </div> <!-- row -->
	    <div class="row">
	        <div class="col-md-12 section-content">
	            <a href="#" data-toggle="modal" data-target="#largeModalMartin">
	                Game of Thrones
	            </a> &mdash; George R.R. Martin
	            <div class="modal fade" id="largeModalMartin" tabindex="-1" role="dialog" aria-labelledby="largeModal" aria-hidden="true">
	                <div class="modal-dialog modal-lg">
	                    <div class="modal-content">
	                        <div class="modal-header">
	                            <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
	                            <h3 class="modal-title" id="myModalLabel">(At least) One Takeaway</h3>
	                        </div>
	                        <div class="modal-body">
	                            <ul>
	                            	<li>It's just a big soap opera, but it's very good, and meticulously investigated by the author</li>
									<li>Lots of fun to read</li>
									<li>An intellectual break from more tasking reading/studying</li>
	                            </ul>
	                        </div>
	                    </div>
	                </div>
	            </div>
	            <div class="pull-right icon-list">
	                <a href="#"><i class="fa fa-book" aria-hidden="true"></i></a>
	                <a href="#"><i class="fa fa-book" aria-hidden="true"></i></a>
	                <a href="#"><i class="fa fa-book" aria-hidden="true"></i></a>
	            </div>
	        </div>
	    </div> <!-- row -->
	    <div class="row">
	        <div class="col-md-12 section-content">
	            <a href="#" data-toggle="modal" data-target="#largeModalClarke2">
	                Rendezvous with Rama
	            </a> &mdash; Arthur C. Clarke
	            <div class="modal fade" id="largeModalClarke2" tabindex="-1" role="dialog" aria-labelledby="largeModal" aria-hidden="true">
	                <div class="modal-dialog modal-lg">
	                    <div class="modal-content">
	                        <div class="modal-header">
	                            <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
	                            <h3 class="modal-title" id="myModalLabel">(At least) One Takeaway</h3>
	                        </div>
	                        <div class="modal-body">
	                            <ul>
	                            	<li>My favorite sci-fi book</li>
									<li>The author reveals just enough to intrigue but not enough to ruin the exploration, dragging the reader into the expedition. You know as much as the astronauts</li>
									<li>It may sound silly, but this book is where I learned to respect other cultures' traditions, even if they might seem crazy to me</li>
	                            </ul>
	                        </div>
	                    </div>
	                </div>
	            </div>
	            <div class="pull-right icon-list">
	                <a href="#"><i class="fa fa-book" aria-hidden="true"></i></a>
	                <a href="#"><i class="fa fa-book" aria-hidden="true"></i></a>
	                <a href="#"><i class="fa fa-book" aria-hidden="true"></i></a>
	            </div>
	        </div>
	    </div> <!-- row -->
	    <div class="row">
	        <div class="col-md-12 section-title"><h2>More to Come!</h2></div>
	    </div>
    </div>
</div> <!-- container -->

<c:import url="/WEB-INF/jsp/footer.jsp" />