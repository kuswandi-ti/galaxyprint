
<div class="page-content-wrapper ">
    <div class="content ">
        <div class=" container-fluid   container-fixed-lg bg-white">
            <div class="card card-transparent">
                <div class="card-header ">
                    <div class="card-title"><h1><?php echo lang('index_heading');?></h1></div>
                    <div class="clearfix"></div>
                    <div class="card-body">
                        <div class="col-xs-12">
							<p><?php echo lang('index_subheading');?></p>

							<div id="infoMessage"><?php echo $message;?></div>
							<a href="<?=base_url('Auth/Create_user')?>" class="btn btn-primary"><i class="fa fa-plus"></i> Create User</a>
							<a href="<?=base_url('Auth/Create_group')?>" class="btn btn-success"><i class="fa fa-plus"></i> Create Group</a>
							<table cellpadding=0 cellspacing=10 class="table table-condensed table-bordered">
								<tr>
									<th><?php echo lang('index_fname_th');?></th>
									<th><?php echo lang('index_lname_th');?></th>
									<th><?php echo lang('index_email_th');?></th>
									<th><?php echo lang('index_groups_th');?></th>
									<th><?php echo lang('index_status_th');?></th>
									<th><?php echo lang('index_action_th');?></th>
								</tr>
								<?php foreach ($users as $user):?>
									<tr>
							            <td><?php echo htmlspecialchars($user->first_name,ENT_QUOTES,'UTF-8');?></td>
							            <td><?php echo htmlspecialchars($user->last_name,ENT_QUOTES,'UTF-8');?></td>
							            <td><?php echo htmlspecialchars($user->email,ENT_QUOTES,'UTF-8');?></td>
										<td>
											<?php foreach ($user->groups as $group):?>
												<?php echo anchor("auth/edit_group/".$group->id, htmlspecialchars($group->name,ENT_QUOTES,'UTF-8')) ;?><br />
							                <?php endforeach?>
										</td>
										<td><?php echo ($user->active) ? anchor("auth/deactivate/".$user->id, lang('index_active_link')) : anchor("auth/activate/". $user->id, lang('index_inactive_link'));?></td>
										<td><?php echo anchor("auth/edit_user/".$user->id, 'Edit') ;?></td>
									</tr>
								<?php endforeach;?>
							</table>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>