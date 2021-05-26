<aside class="main-sidebar">
    <!-- sidebar: style can be found in sidebar.less -->
    <section class="sidebar">
      <!-- Sidebar user panel -->
      <div class="user-panel">
        <div class="pull-left image">
          <img src="<?php echo (!empty($user['photo'])) ? '../images/'.$user['photo'] : '../images/profile.jpg'; ?>" class="img-circle" alt="User Image">
        </div>
        <div class="pull-left info">
          <p><?php echo $user['firstname'].' '.$user['lastname']; ?></p>
          <a><i class="fa fa-circle text-success"></i> Online</a>
        </div>
      </div>
      <!-- sidebar menu: : style can be found in sidebar.less -->
      <ul class="sidebar-menu" data-widget="tree">
        <li class="header">REPORTS</li>
        <li class=""><a href="home.php"><i class="fa fa-dashboard"></i> <span>Dashboard</span></a></li>
        <li class="header">MANAGE</li>
        
        <li><a href="attendance.php"><i class="fa fa-calendar"></i> <span>Attendance</span></a></li>
        <li class="treeview">
          <a href="#">
            <i class="fa fa-users"></i>
            <span>Employees</span>
            <span class="pull-right-container">
              <i class="fa fa-angle-left pull-right"></i>
            </span>
          </a>
          <ul class="treeview-menu">
            <li><a href="employee.php"><i class="fa fa-circle-o"></i> Employee List</a></li>
            <!-- <li><a href="overtime.php"><i class="fa fa-circle-o"></i> Overtime</a></li>
            <li><a href="cashadvance.php"><i class="fa fa-circle-o"></i> Cash Advance</a></li>
            <li><a href="schedule.php"><i class="fa fa-circle-o"></i> Schedules</a></li> -->
          </ul>
        </li>
        <!-- <li><a href="deduction.php"><i class="fa fa-file-text"></i> Deductions</a></li> -->
        <!--<li><a href="position.php"><i class="fa fa-suitcase"></i> Positions</a></li>
        <li class="header">PRINTABLES</li>
        <li><a href="payroll.php"><i class="fa fa-files-o"></i> <span>Payroll</span></a></li>
        <li><a href="schedule_employee.php"><i class="fa fa-clock-o"></i> <span>Schedule</span></a></li>!-->
        <!-- <li><a href="addlocation.php"><i class="fa fa-map-marker"></i> Add Location</a></li> -->
        <li><a href="http://b7c29ad760cd.ngrok.io/"><i class="fa fa-square"></i> Object Detection</a></li>
        <li><a href="live.php"><i class="fa fa-camera"></i> Realtime Monitoring</a></li>
		<li><a href="https://www.google.com/maps/d/u/0/edit?mid=1_5oYuj1XbOxaTwl1CRDy_oin6OgW_XH4&ll=19.188861151628245%2C72.95693217235639&z=12"><i class="fa fa-map-marker"></i>View Map</a></li>
		<li><a href="chat.php"><i class="fa fa-comment"></i>Chat Now</a></li>
      </ul>
    </section>
    <!-- /.sidebar -->
  </aside>