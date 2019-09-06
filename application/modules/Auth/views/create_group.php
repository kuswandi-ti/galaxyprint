
<div class="page-content-wrapper ">
    <div class="content ">
        <div class=" container-fluid   container-fixed-lg bg-white">
            <div class="card card-transparent">
                <div class="card-header ">
                    <div class="card-title"><h1><?php echo lang('create_group_heading');?></h1></div>
                    <div class="clearfix"></div>
                    <div class="card-body">
                      <div class="col-xs-12">

                        <p><?php echo lang('create_group_subheading');?></p>

                        <div id="infoMessage"><?php echo $message;?></div>

                        <?php echo form_open("auth/create_group");?>

						      <p>
						            <?php echo lang('create_group_name_label', 'group_name');?> <br />
						            <?php echo form_input($group_name);?>
						      </p>

						      <p>
						            <?php echo lang('create_group_desc_label', 'description');?> <br />
						            <?php echo form_input($description);?>
						      </p>

						      <p><?php echo form_submit('submit', lang('create_group_submit_btn'));?></p>

						<?php echo form_close();?>

                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>