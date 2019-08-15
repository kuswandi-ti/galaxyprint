<table id="dataTable2" class="text-center">
    <thead class="text-capitalize">
    <tr>
        <th>Name</th>
        <th>Position</th>
        <th>Office</th>
        <th>Age</th>
    </tr>
    </thead>
    <tbody>
      <?php foreach($users as $r){?>
        <tr>
            <td><?=$r->username?></td>
            <td><?=$r->fullname?></td>
            <td><?=$r->email?></td>
            <td><?=$r->role_id?></td>
        </tr>
      <?php } ?>
    </tbody>
</table>