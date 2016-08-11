
//入口
defineClass('FFRootViewController',{
    clickPush: function(sender) {
        var tableViewController = FFTableViewController.alloc().init()
        self.navigationController().pushViewController_animated(tableViewController, YES)
    }
})

//实体
defineClass('FFTableViewController : UITableViewController <UIAlertViewDelegate>', {
            
    //数据源
    dataSource: function() {
        var data = self.getProp('data')
        if (data) return data;
        var data = [];
        for (var i = 0; i < 20; i ++) {
          data.push("cell from js " + i);
        }
        self.setProp_forKey(data, 'data')
        return data;
    },
            
    //UITableViewDataSource
    numberOfSectionsInTableView: function(tableView) {
        return 1;
    },
    tableView_numberOfRowsInSection: function(tableView, section) {
        return self.dataSource().count();
    },
    tableView_cellForRowAtIndexPath: function(tableView, indexPath) {
        var cell = tableView.dequeueReusableCellWithIdentifier("cell") 
        if (!cell) {
          cell = require('UITableViewCell').alloc().initWithStyle_reuseIdentifier(0, "cell")
        }
        cell.textLabel().setText(self.dataSource().objectAtIndex(indexPath.row()))
        return cell
    },
           
    //UITableViewDelegate
    tableView_heightForRowAtIndexPath: function(tableView, indexPath) {
        return 60
    },
    tableView_didSelectRowAtIndexPath: function(tableView, indexPath) {
         var alertView = require('UIAlertView').alloc().initWithTitle_message_delegate_cancelButtonTitle_otherButtonTitles("Alert",self.dataSource().objectAtIndex(indexPath.row()), self, "OK", null);
         alertView.show()
    },
            
    //UIAlertViewDelegate
    alertView_willDismissWithButtonIndex: function(alertView, idx) {
        console.log('click btn ' + alertView.buttonTitleAtIndex(idx).toJS())
    }
})

