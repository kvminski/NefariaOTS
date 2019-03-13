			</div>
		</div>
		</div>
		</div>
		<div class="footer" style="text-align: center;">
				<p>&copy;<?php echo $config['site_title'];?>.
<?php 
	$time = microtime();
	$time = explode(' ', $time);
	$time = $time[1] + $time[0];
	$finish = $time;
	$total_time = round(($finish - $start), 4);
	echo 'Server date and clock is: '. getClock(false, true) .' Page generated in '. $total_time .' seconds.'
?><br/><b>Based on theme by:</b> <a href="https://otland.net/members/webo.192791/">Webo</a>, <b>edited by:</b> <a href="https://otland.net/members/alvanea.160820/">Alvanea</a>. <b>Engine:</b> <a href="https://github.com/Znote/ZnoteAAC">Znote AAC</a></p>
		</div>
		<script src="layout/js/bootstrap.min.js"></script>
		<script src="layout/js/jquery.countdown.min.js"></script>
	</body>
</html>
