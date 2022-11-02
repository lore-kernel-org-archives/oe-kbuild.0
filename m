Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CB6047ED
	for <oe-kbuild@lists.linux.dev>; Wed,  2 Nov 2022 10:11:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1667383914; x=1698919914;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=rg+tWhFIuOXVBoWB0rgUROkKPS9JETyrqP3boiGoH/c=;
  b=fHgBb28N7aObV0S72lKQQYaTidv8zHbbf1FIgc4DukifKOEOHgvd6SQ8
   x1wmH4jpuFmn+ts/E5PYcv7qdxukjSiJTClUSvI3hETFdqmookD2AAX1b
   Tr1vg1f9XAwGvy1AA/6KueglpvtZZ537lQnM/nJs4h4kY47lpRaD0bwXr
   QZ8wvU7QhqcQxsgRh+R8g1Z3hpl5cHTLNyQlke+v9ZnpWkTE140TXiDoA
   WZk0Rthm3b5mIzWG5Qa/hhG/Btuea3RdQb7DpHlFmlFOZXC9/Bveg9REv
   4KG/mX7O0SEfC16XfVp9F+75iLQ84N6Qqph+TMB7P7PnwP5WSLAJXAVi0
   w==;
X-IronPort-AV: E=McAfee;i="6500,9779,10518"; a="311085662"
X-IronPort-AV: E=Sophos;i="5.95,232,1661842800"; 
   d="scan'208";a="311085662"
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
  by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Nov 2022 03:11:53 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10518"; a="703214480"
X-IronPort-AV: E=Sophos;i="5.95,232,1661842800"; 
   d="scan'208";a="703214480"
Received: from lkp-server02.sh.intel.com (HELO b6d29c1a0365) ([10.239.97.151])
  by fmsmga004.fm.intel.com with ESMTP; 02 Nov 2022 03:11:52 -0700
Received: from kbuild by b6d29c1a0365 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1oqAit-000Eft-2Q;
	Wed, 02 Nov 2022 10:11:51 +0000
Date: Wed, 2 Nov 2022 18:11:05 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: drivers/platform/x86/wmi.c:1316:13: warning: Uninitialized variable:
 iter->acpi_device [uninitvar]
Message-ID: <202211021821.JDRbzuUo-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit

:::::: 
:::::: Manual check reason: "low confidence static check warning: drivers/platform/x86/wmi.c:1316:13: warning: Uninitialized variable: iter->acpi_device [uninitvar]"
:::::: 

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
CC: linux-kernel@vger.kernel.org
TO: Jakob Koschel <jakobkoschel@gmail.com>
CC: Hans de Goede <hdegoede@redhat.com>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   8f71a2b3f435f29b787537d1abedaa7d8ebe6647
commit: 264e8de27baab1c64e30b962888650032834b52a platform/x86: wmi: replace usage of found with dedicated list iterator variable
date:   7 months ago
:::::: branch date: 12 hours ago
:::::: commit date: 7 months ago
compiler: gcc-11 (Debian 11.3.0-8) 11.3.0
reproduce (cppcheck warning):
        # apt-get install cppcheck
        git checkout 264e8de27baab1c64e30b962888650032834b52a
        cppcheck --quiet --enable=style,performance,portability --template=gcc FILE

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>


cppcheck possible warnings: (new ones prefixed by >>, may not real problems)

   drivers/platform/x86/wmi.c:590:30: warning: Redundant condition: wmi_status==AE_OK. 'A || (!A && B)' is equivalent to 'A || B' [redundantCondition]
      if ((wmi_status != AE_OK) ||
                                ^
   drivers/platform/x86/wmi.c:633:31: warning: Redundant condition: wmi_status==AE_OK. 'A || (!A && B)' is equivalent to 'A || B' [redundantCondition]
       if ((wmi_status != AE_OK) ||
                                 ^
   drivers/platform/x86/wmi.c:1144:50: warning: Parameter 'device' can be declared as pointer to const [constParameter]
   static void wmi_free_devices(struct acpi_device *device)
                                                    ^
   drivers/platform/x86/wmi.c:178:27: warning: Uninitialized variable: &dummy_info [uninitvar]
    info_ptr = info ? info : &dummy_info;
                             ^
   drivers/platform/x86/wmi.c:660:16: warning: Uninitialized variable: gblock->flags [uninitvar]
     if ((gblock->flags & ACPI_WMI_EVENT) && gblock->notify_id == event)
                  ^
   drivers/platform/x86/wmi.c:658:31: note: Assignment 'gblock=&wblock->gblock', assigned value is <Uninit>
     struct guid_block *gblock = &wblock->gblock;
                                 ^
   drivers/platform/x86/wmi.c:660:16: note: Uninitialized variable: gblock->flags
     if ((gblock->flags & ACPI_WMI_EVENT) && gblock->notify_id == event)
                  ^
   drivers/platform/x86/wmi.c:661:26: warning: Uninitialized variables: wblock.dev, wblock.list, wblock.gblock, wblock.char_dev, wblock.char_mutex, wblock.acpi_device, wblock.handler, wblock.handler_data, wblock.req_buf_size, wblock.flags [uninitvar]
      return get_event_data(wblock, out);
                            ^
   drivers/platform/x86/wmi.c:861:16: warning: Uninitialized variable: wblock->dev [uninitvar]
     if (!wblock->dev.dev.driver)
                  ^
   drivers/platform/x86/wmi.c:1150:15: warning: Uninitialized variable: wblock->acpi_device [uninitvar]
     if (wblock->acpi_device == device) {
                 ^
>> drivers/platform/x86/wmi.c:1316:13: warning: Uninitialized variable: iter->acpi_device [uninitvar]
     if (iter->acpi_device->handle == handle &&
               ^
   drivers/platform/x86/wmi.c:1317:15: warning: Uninitialized variable: block->flags [uninitvar]
         (block->flags & ACPI_WMI_EVENT) &&
                 ^
   drivers/platform/x86/wmi.c:1314:30: note: Assignment 'block=&iter->gblock', assigned value is <Uninit>
     struct guid_block *block = &iter->gblock;
                                ^
   drivers/platform/x86/wmi.c:1317:15: note: Uninitialized variable: block->flags
         (block->flags & ACPI_WMI_EVENT) &&
                 ^

vim +1316 drivers/platform/x86/wmi.c

bff431e49ff531 drivers/acpi/wmi.c         Carlos Corbacho 2008-02-05  1307  
1686f5444546c3 drivers/platform/x86/wmi.c Andy Lutomirski 2015-11-25  1308  static void acpi_wmi_notify_handler(acpi_handle handle, u32 event,
1686f5444546c3 drivers/platform/x86/wmi.c Andy Lutomirski 2015-11-25  1309  				    void *context)
bff431e49ff531 drivers/acpi/wmi.c         Carlos Corbacho 2008-02-05  1310  {
264e8de27baab1 drivers/platform/x86/wmi.c Jakob Koschel   2022-03-24  1311  	struct wmi_block *wblock = NULL, *iter;
bff431e49ff531 drivers/acpi/wmi.c         Carlos Corbacho 2008-02-05  1312  
264e8de27baab1 drivers/platform/x86/wmi.c Jakob Koschel   2022-03-24  1313  	list_for_each_entry(iter, &wmi_block_list, list) {
264e8de27baab1 drivers/platform/x86/wmi.c Jakob Koschel   2022-03-24  1314  		struct guid_block *block = &iter->gblock;
bff431e49ff531 drivers/acpi/wmi.c         Carlos Corbacho 2008-02-05  1315  
264e8de27baab1 drivers/platform/x86/wmi.c Jakob Koschel   2022-03-24 @1316  		if (iter->acpi_device->handle == handle &&
b0e86302973d9e drivers/platform/x86/wmi.c Andy Lutomirski 2015-11-24  1317  		    (block->flags & ACPI_WMI_EVENT) &&
3ecace310f4dfd drivers/platform/x86/wmi.c Barnabás Pőcze  2021-09-04  1318  		    (block->notify_id == event)) {
264e8de27baab1 drivers/platform/x86/wmi.c Jakob Koschel   2022-03-24  1319  			wblock = iter;
1686f5444546c3 drivers/platform/x86/wmi.c Andy Lutomirski 2015-11-25  1320  			break;
1686f5444546c3 drivers/platform/x86/wmi.c Andy Lutomirski 2015-11-25  1321  		}
1686f5444546c3 drivers/platform/x86/wmi.c Andy Lutomirski 2015-11-25  1322  	}
1686f5444546c3 drivers/platform/x86/wmi.c Andy Lutomirski 2015-11-25  1323  
264e8de27baab1 drivers/platform/x86/wmi.c Jakob Koschel   2022-03-24  1324  	if (!wblock)
1686f5444546c3 drivers/platform/x86/wmi.c Andy Lutomirski 2015-11-25  1325  		return;
1686f5444546c3 drivers/platform/x86/wmi.c Andy Lutomirski 2015-11-25  1326  
1686f5444546c3 drivers/platform/x86/wmi.c Andy Lutomirski 2015-11-25  1327  	/* If a driver is bound, then notify the driver. */
9918878676a5f9 drivers/platform/x86/wmi.c Hans de Goede   2021-11-28  1328  	if (test_bit(WMI_PROBED, &wblock->flags) && wblock->dev.dev.driver) {
e7b2e33449e22f drivers/platform/x86/wmi.c Barnabás Pőcze  2021-09-04  1329  		struct wmi_driver *driver = drv_to_wdrv(wblock->dev.dev.driver);
1686f5444546c3 drivers/platform/x86/wmi.c Andy Lutomirski 2015-11-25  1330  		struct acpi_buffer evdata = { ACPI_ALLOCATE_BUFFER, NULL };
1686f5444546c3 drivers/platform/x86/wmi.c Andy Lutomirski 2015-11-25  1331  		acpi_status status;
1686f5444546c3 drivers/platform/x86/wmi.c Andy Lutomirski 2015-11-25  1332  
8c33915d77a565 drivers/platform/x86/wmi.c Hans de Goede   2021-11-28  1333  		if (!driver->no_notify_data) {
25be44f6e2fc9d drivers/platform/x86/wmi.c Barnabás Pőcze  2021-09-04  1334  			status = get_event_data(wblock, &evdata);
1686f5444546c3 drivers/platform/x86/wmi.c Andy Lutomirski 2015-11-25  1335  			if (ACPI_FAILURE(status)) {
25be44f6e2fc9d drivers/platform/x86/wmi.c Barnabás Pőcze  2021-09-04  1336  				dev_warn(&wblock->dev.dev, "failed to get event data\n");
1686f5444546c3 drivers/platform/x86/wmi.c Andy Lutomirski 2015-11-25  1337  				return;
1686f5444546c3 drivers/platform/x86/wmi.c Andy Lutomirski 2015-11-25  1338  			}
8c33915d77a565 drivers/platform/x86/wmi.c Hans de Goede   2021-11-28  1339  		}
1686f5444546c3 drivers/platform/x86/wmi.c Andy Lutomirski 2015-11-25  1340  
1686f5444546c3 drivers/platform/x86/wmi.c Andy Lutomirski 2015-11-25  1341  		if (driver->notify)
c06a2fde798206 drivers/platform/x86/wmi.c Barnabás Pőcze  2021-09-04  1342  			driver->notify(&wblock->dev, evdata.pointer);
1686f5444546c3 drivers/platform/x86/wmi.c Andy Lutomirski 2015-11-25  1343  
1686f5444546c3 drivers/platform/x86/wmi.c Andy Lutomirski 2015-11-25  1344  		kfree(evdata.pointer);
1686f5444546c3 drivers/platform/x86/wmi.c Andy Lutomirski 2015-11-25  1345  	} else if (wblock->handler) {
1686f5444546c3 drivers/platform/x86/wmi.c Andy Lutomirski 2015-11-25  1346  		/* Legacy handler */
bff431e49ff531 drivers/acpi/wmi.c         Carlos Corbacho 2008-02-05  1347  		wblock->handler(event, wblock->handler_data);
1686f5444546c3 drivers/platform/x86/wmi.c Andy Lutomirski 2015-11-25  1348  	}
1686f5444546c3 drivers/platform/x86/wmi.c Andy Lutomirski 2015-11-25  1349  
6701cc8f707108 drivers/platform/x86/wmi.c Andy Shevchenko 2020-04-23  1350  	if (debug_event)
1c23ab912810f7 drivers/platform/x86/wmi.c Barnabás Pőcze  2021-09-04  1351  		pr_info("DEBUG: GUID %pUL event 0x%02X\n", &wblock->gblock.guid, event);
bff431e49ff531 drivers/acpi/wmi.c         Carlos Corbacho 2008-02-05  1352  
bff431e49ff531 drivers/acpi/wmi.c         Carlos Corbacho 2008-02-05  1353  	acpi_bus_generate_netlink_event(
1686f5444546c3 drivers/platform/x86/wmi.c Andy Lutomirski 2015-11-25  1354  		wblock->acpi_device->pnp.device_class,
1686f5444546c3 drivers/platform/x86/wmi.c Andy Lutomirski 2015-11-25  1355  		dev_name(&wblock->dev.dev),
bff431e49ff531 drivers/acpi/wmi.c         Carlos Corbacho 2008-02-05  1356  		event, 0);
bff431e49ff531 drivers/acpi/wmi.c         Carlos Corbacho 2008-02-05  1357  }
bff431e49ff531 drivers/acpi/wmi.c         Carlos Corbacho 2008-02-05  1358  

-- 
0-DAY CI Kernel Test Service
https://01.org/lkp
