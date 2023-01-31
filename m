Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B1F8065C
	for <oe-kbuild@lists.linux.dev>; Tue, 31 Jan 2023 07:09:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1675148984; x=1706684984;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=jLOxeaT0aZJ7m8ZTMrzdO3gVW0+qoqqJRcsbsV2x/Wg=;
  b=jt/sWza/ciAW4hhow04x82ivfxVx9N2W0SEETFzpfmiSj1uRs0lspxRS
   XC4rZGbnmCAYnA/Zeq4wjlTrVXg4Vq28d3q+ULv7DLGcyx7D3HutAV/1r
   6SNosIOjwUQoKh1kH3g/5QYZgtLe7ooGy1xbCsFBoUzUtn937NEUjE0HQ
   L5GwfdwSdFcClt6dyCSYMBEOVhRpwUeKIAi3qE2GM3kteB7JjjNiYM61M
   zcRMTfDQOnaS04+zBmLA7q9KJEufMRmy/bo2hatfoJsomG9JL3K7oaQ6Q
   4MC1sbt8wjlizPOffUYi6O2UIj7Yk6Jiw97CKupEdpC6ZLRxspZz4RfhJ
   Q==;
X-IronPort-AV: E=McAfee;i="6500,9779,10606"; a="311392438"
X-IronPort-AV: E=Sophos;i="5.97,259,1669104000"; 
   d="scan'208";a="311392438"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
  by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Jan 2023 23:09:42 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10606"; a="806998883"
X-IronPort-AV: E=Sophos;i="5.97,259,1669104000"; 
   d="scan'208";a="806998883"
Received: from lkp-server01.sh.intel.com (HELO ffa7f14d1d0f) ([10.239.97.150])
  by fmsmga001.fm.intel.com with ESMTP; 30 Jan 2023 23:09:41 -0800
Received: from kbuild by ffa7f14d1d0f with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pMklw-0004GC-2D;
	Tue, 31 Jan 2023 07:09:40 +0000
Date: Tue, 31 Jan 2023 15:09:10 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: Re: [PATCH v3 07/11] usb: gadget: configfs: Attach arbitrary strings
 to cdev
Message-ID: <202301311446.AqdvqXkI-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
In-Reply-To: <20230130093443.25644-8-dan.scally@ideasonboard.com>
References: <20230130093443.25644-8-dan.scally@ideasonboard.com>
TO: Daniel Scally <dan.scally@ideasonboard.com>
TO: linux-usb@vger.kernel.org
TO: gregkh@linuxfoundation.org
TO: laurent.pinchart@ideasonboard.com
CC: mgr@pengutronix.de
CC: balbi@kernel.org
CC: kieran.bingham@ideasonboard.com
CC: torleiv@huddly.com
CC: stern@rowland.harvard.edu
CC: Daniel Scally <dan.scally@ideasonboard.com>

Hi Daniel,

I love your patch! Perhaps something to improve:

[auto build test WARNING on usb/usb-linus]
[also build test WARNING on westeri-thunderbolt/next linus/master v6.2-rc6 next-20230130]
[cannot apply to usb/usb-testing usb/usb-next]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Daniel-Scally/usb-gadget-uvc-Make-bSourceID-read-write/20230130-174215
base:   https://git.kernel.org/pub/scm/linux/kernel/git/gregkh/usb.git usb-linus
patch link:    https://lore.kernel.org/r/20230130093443.25644-8-dan.scally%40ideasonboard.com
patch subject: [PATCH v3 07/11] usb: gadget: configfs: Attach arbitrary strings to cdev
:::::: branch date: 21 hours ago
:::::: commit date: 21 hours ago
config: x86_64-randconfig-m001 (https://download.01.org/0day-ci/archive/20230131/202301311446.AqdvqXkI-lkp@intel.com/config)
compiler: gcc-11 (Debian 11.3.0-8) 11.3.0

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>

New smatch warnings:
drivers/usb/gadget/configfs.c:1563 configfs_composite_bind() warn: passing zero to 'PTR_ERR'

Old smatch warnings:
drivers/usb/gadget/configfs.c:985 os_desc_b_vendor_code_show() warn: argument 3 to %02x specifier has type 'char'

vim +/PTR_ERR +1563 drivers/usb/gadget/configfs.c

0c252735443756 Daniel Scally             2023-01-30  1517  
88af8bbe4ef781 Sebastian Andrzej Siewior 2012-12-23  1518  static int configfs_composite_bind(struct usb_gadget *gadget,
88af8bbe4ef781 Sebastian Andrzej Siewior 2012-12-23  1519  		struct usb_gadget_driver *gdriver)
88af8bbe4ef781 Sebastian Andrzej Siewior 2012-12-23  1520  {
88af8bbe4ef781 Sebastian Andrzej Siewior 2012-12-23  1521  	struct usb_composite_driver     *composite = to_cdriver(gdriver);
88af8bbe4ef781 Sebastian Andrzej Siewior 2012-12-23  1522  	struct gadget_info		*gi = container_of(composite,
88af8bbe4ef781 Sebastian Andrzej Siewior 2012-12-23  1523  						struct gadget_info, composite);
88af8bbe4ef781 Sebastian Andrzej Siewior 2012-12-23  1524  	struct usb_composite_dev	*cdev = &gi->cdev;
88af8bbe4ef781 Sebastian Andrzej Siewior 2012-12-23  1525  	struct usb_configuration	*c;
88af8bbe4ef781 Sebastian Andrzej Siewior 2012-12-23  1526  	struct usb_string		*s;
88af8bbe4ef781 Sebastian Andrzej Siewior 2012-12-23  1527  	unsigned			i;
88af8bbe4ef781 Sebastian Andrzej Siewior 2012-12-23  1528  	int				ret;
88af8bbe4ef781 Sebastian Andrzej Siewior 2012-12-23  1529  
88af8bbe4ef781 Sebastian Andrzej Siewior 2012-12-23  1530  	/* the gi->lock is hold by the caller */
1a1c851bbd706e Peter Chen                2019-08-26  1531  	gi->unbind = 0;
88af8bbe4ef781 Sebastian Andrzej Siewior 2012-12-23  1532  	cdev->gadget = gadget;
88af8bbe4ef781 Sebastian Andrzej Siewior 2012-12-23  1533  	set_gadget_data(gadget, cdev);
88af8bbe4ef781 Sebastian Andrzej Siewior 2012-12-23  1534  	ret = composite_dev_prepare(composite, cdev);
88af8bbe4ef781 Sebastian Andrzej Siewior 2012-12-23  1535  	if (ret)
88af8bbe4ef781 Sebastian Andrzej Siewior 2012-12-23  1536  		return ret;
88af8bbe4ef781 Sebastian Andrzej Siewior 2012-12-23  1537  	/* and now the gadget bind */
88af8bbe4ef781 Sebastian Andrzej Siewior 2012-12-23  1538  	ret = -EINVAL;
88af8bbe4ef781 Sebastian Andrzej Siewior 2012-12-23  1539  
88af8bbe4ef781 Sebastian Andrzej Siewior 2012-12-23  1540  	if (list_empty(&gi->cdev.configs)) {
88af8bbe4ef781 Sebastian Andrzej Siewior 2012-12-23  1541  		pr_err("Need at least one configuration in %s.\n",
88af8bbe4ef781 Sebastian Andrzej Siewior 2012-12-23  1542  				gi->composite.name);
88af8bbe4ef781 Sebastian Andrzej Siewior 2012-12-23  1543  		goto err_comp_cleanup;
88af8bbe4ef781 Sebastian Andrzej Siewior 2012-12-23  1544  	}
88af8bbe4ef781 Sebastian Andrzej Siewior 2012-12-23  1545  
88af8bbe4ef781 Sebastian Andrzej Siewior 2012-12-23  1546  
88af8bbe4ef781 Sebastian Andrzej Siewior 2012-12-23  1547  	list_for_each_entry(c, &gi->cdev.configs, list) {
88af8bbe4ef781 Sebastian Andrzej Siewior 2012-12-23  1548  		struct config_usb_cfg *cfg;
88af8bbe4ef781 Sebastian Andrzej Siewior 2012-12-23  1549  
88af8bbe4ef781 Sebastian Andrzej Siewior 2012-12-23  1550  		cfg = container_of(c, struct config_usb_cfg, c);
88af8bbe4ef781 Sebastian Andrzej Siewior 2012-12-23  1551  		if (list_empty(&cfg->func_list)) {
88af8bbe4ef781 Sebastian Andrzej Siewior 2012-12-23  1552  			pr_err("Config %s/%d of %s needs at least one function.\n",
88af8bbe4ef781 Sebastian Andrzej Siewior 2012-12-23  1553  			      c->label, c->bConfigurationValue,
88af8bbe4ef781 Sebastian Andrzej Siewior 2012-12-23  1554  			      gi->composite.name);
88af8bbe4ef781 Sebastian Andrzej Siewior 2012-12-23  1555  			goto err_comp_cleanup;
88af8bbe4ef781 Sebastian Andrzej Siewior 2012-12-23  1556  		}
88af8bbe4ef781 Sebastian Andrzej Siewior 2012-12-23  1557  	}
88af8bbe4ef781 Sebastian Andrzej Siewior 2012-12-23  1558  
88af8bbe4ef781 Sebastian Andrzej Siewior 2012-12-23  1559  	/* init all strings */
88af8bbe4ef781 Sebastian Andrzej Siewior 2012-12-23  1560  	if (!list_empty(&gi->string_list)) {
0c252735443756 Daniel Scally             2023-01-30  1561  		s = configfs_attach_gadget_strings(gi);
0c252735443756 Daniel Scally             2023-01-30  1562  		if (IS_ERR_OR_NULL(s)) {
fea77077d1623c Wei Yongjun               2013-05-07 @1563  			ret = PTR_ERR(s);
88af8bbe4ef781 Sebastian Andrzej Siewior 2012-12-23  1564  			goto err_comp_cleanup;
fea77077d1623c Wei Yongjun               2013-05-07  1565  		}
88af8bbe4ef781 Sebastian Andrzej Siewior 2012-12-23  1566  
88af8bbe4ef781 Sebastian Andrzej Siewior 2012-12-23  1567  		gi->cdev.desc.iManufacturer = s[USB_GADGET_MANUFACTURER_IDX].id;
88af8bbe4ef781 Sebastian Andrzej Siewior 2012-12-23  1568  		gi->cdev.desc.iProduct = s[USB_GADGET_PRODUCT_IDX].id;
88af8bbe4ef781 Sebastian Andrzej Siewior 2012-12-23  1569  		gi->cdev.desc.iSerialNumber = s[USB_GADGET_SERIAL_IDX].id;
0c252735443756 Daniel Scally             2023-01-30  1570  
0c252735443756 Daniel Scally             2023-01-30  1571  		gi->cdev.usb_strings = s;
88af8bbe4ef781 Sebastian Andrzej Siewior 2012-12-23  1572  	}
88af8bbe4ef781 Sebastian Andrzej Siewior 2012-12-23  1573  
87213d388e927a Andrzej Pietrasiewicz     2014-05-08  1574  	if (gi->use_os_desc) {
87213d388e927a Andrzej Pietrasiewicz     2014-05-08  1575  		cdev->use_os_string = true;
87213d388e927a Andrzej Pietrasiewicz     2014-05-08  1576  		cdev->b_vendor_code = gi->b_vendor_code;
87213d388e927a Andrzej Pietrasiewicz     2014-05-08  1577  		memcpy(cdev->qw_sign, gi->qw_sign, OS_STRING_QW_SIGN_LEN);
87213d388e927a Andrzej Pietrasiewicz     2014-05-08  1578  	}
87213d388e927a Andrzej Pietrasiewicz     2014-05-08  1579  
41ce84c86d0a04 Li Jun                    2015-07-09  1580  	if (gadget_is_otg(gadget) && !otg_desc[0]) {
41ce84c86d0a04 Li Jun                    2015-07-09  1581  		struct usb_descriptor_header *usb_desc;
41ce84c86d0a04 Li Jun                    2015-07-09  1582  
41ce84c86d0a04 Li Jun                    2015-07-09  1583  		usb_desc = usb_otg_descriptor_alloc(gadget);
41ce84c86d0a04 Li Jun                    2015-07-09  1584  		if (!usb_desc) {
41ce84c86d0a04 Li Jun                    2015-07-09  1585  			ret = -ENOMEM;
41ce84c86d0a04 Li Jun                    2015-07-09  1586  			goto err_comp_cleanup;
41ce84c86d0a04 Li Jun                    2015-07-09  1587  		}
41ce84c86d0a04 Li Jun                    2015-07-09  1588  		usb_otg_descriptor_init(gadget, usb_desc);
41ce84c86d0a04 Li Jun                    2015-07-09  1589  		otg_desc[0] = usb_desc;
41ce84c86d0a04 Li Jun                    2015-07-09  1590  		otg_desc[1] = NULL;
41ce84c86d0a04 Li Jun                    2015-07-09  1591  	}
41ce84c86d0a04 Li Jun                    2015-07-09  1592  
88af8bbe4ef781 Sebastian Andrzej Siewior 2012-12-23  1593  	/* Go through all configs, attach all functions */
88af8bbe4ef781 Sebastian Andrzej Siewior 2012-12-23  1594  	list_for_each_entry(c, &gi->cdev.configs, list) {
88af8bbe4ef781 Sebastian Andrzej Siewior 2012-12-23  1595  		struct config_usb_cfg *cfg;
88af8bbe4ef781 Sebastian Andrzej Siewior 2012-12-23  1596  		struct usb_function *f;
88af8bbe4ef781 Sebastian Andrzej Siewior 2012-12-23  1597  		struct usb_function *tmp;
88af8bbe4ef781 Sebastian Andrzej Siewior 2012-12-23  1598  		struct gadget_config_name *cn;
88af8bbe4ef781 Sebastian Andrzej Siewior 2012-12-23  1599  
41ce84c86d0a04 Li Jun                    2015-07-09  1600  		if (gadget_is_otg(gadget))
41ce84c86d0a04 Li Jun                    2015-07-09  1601  			c->descriptors = otg_desc;
41ce84c86d0a04 Li Jun                    2015-07-09  1602  
88af8bbe4ef781 Sebastian Andrzej Siewior 2012-12-23  1603  		cfg = container_of(c, struct config_usb_cfg, c);
88af8bbe4ef781 Sebastian Andrzej Siewior 2012-12-23  1604  		if (!list_empty(&cfg->string_list)) {
88af8bbe4ef781 Sebastian Andrzej Siewior 2012-12-23  1605  			i = 0;
88af8bbe4ef781 Sebastian Andrzej Siewior 2012-12-23  1606  			list_for_each_entry(cn, &cfg->string_list, list) {
88af8bbe4ef781 Sebastian Andrzej Siewior 2012-12-23  1607  				cfg->gstrings[i] = &cn->stringtab_dev;
88af8bbe4ef781 Sebastian Andrzej Siewior 2012-12-23  1608  				cn->stringtab_dev.strings = &cn->strings;
88af8bbe4ef781 Sebastian Andrzej Siewior 2012-12-23  1609  				cn->strings.s = cn->configuration;
88af8bbe4ef781 Sebastian Andrzej Siewior 2012-12-23  1610  				i++;
88af8bbe4ef781 Sebastian Andrzej Siewior 2012-12-23  1611  			}
88af8bbe4ef781 Sebastian Andrzej Siewior 2012-12-23  1612  			cfg->gstrings[i] = NULL;
88af8bbe4ef781 Sebastian Andrzej Siewior 2012-12-23  1613  			s = usb_gstrings_attach(&gi->cdev, cfg->gstrings, 1);
fea77077d1623c Wei Yongjun               2013-05-07  1614  			if (IS_ERR(s)) {
fea77077d1623c Wei Yongjun               2013-05-07  1615  				ret = PTR_ERR(s);
88af8bbe4ef781 Sebastian Andrzej Siewior 2012-12-23  1616  				goto err_comp_cleanup;
fea77077d1623c Wei Yongjun               2013-05-07  1617  			}
88af8bbe4ef781 Sebastian Andrzej Siewior 2012-12-23  1618  			c->iConfiguration = s[0].id;
88af8bbe4ef781 Sebastian Andrzej Siewior 2012-12-23  1619  		}
88af8bbe4ef781 Sebastian Andrzej Siewior 2012-12-23  1620  
88af8bbe4ef781 Sebastian Andrzej Siewior 2012-12-23  1621  		list_for_each_entry_safe(f, tmp, &cfg->func_list, list) {
88af8bbe4ef781 Sebastian Andrzej Siewior 2012-12-23  1622  			list_del(&f->list);
88af8bbe4ef781 Sebastian Andrzej Siewior 2012-12-23  1623  			ret = usb_add_function(c, f);
5a68e9b57b1c19 Andrzej Pietrasiewicz     2013-08-08  1624  			if (ret) {
5a68e9b57b1c19 Andrzej Pietrasiewicz     2013-08-08  1625  				list_add(&f->list, &cfg->func_list);
88af8bbe4ef781 Sebastian Andrzej Siewior 2012-12-23  1626  				goto err_purge_funcs;
88af8bbe4ef781 Sebastian Andrzej Siewior 2012-12-23  1627  			}
5a68e9b57b1c19 Andrzej Pietrasiewicz     2013-08-08  1628  		}
7adf9e3adc398e Wesley Cheng              2021-07-10  1629  		ret = usb_gadget_check_config(cdev->gadget);
7adf9e3adc398e Wesley Cheng              2021-07-10  1630  		if (ret)
7adf9e3adc398e Wesley Cheng              2021-07-10  1631  			goto err_purge_funcs;
7adf9e3adc398e Wesley Cheng              2021-07-10  1632  
88af8bbe4ef781 Sebastian Andrzej Siewior 2012-12-23  1633  		usb_ep_autoconfig_reset(cdev->gadget);
88af8bbe4ef781 Sebastian Andrzej Siewior 2012-12-23  1634  	}
da4243145fb197 Andrzej Pietrasiewicz     2014-05-08  1635  	if (cdev->use_os_string) {
da4243145fb197 Andrzej Pietrasiewicz     2014-05-08  1636  		ret = composite_os_desc_req_prepare(cdev, gadget->ep0);
da4243145fb197 Andrzej Pietrasiewicz     2014-05-08  1637  		if (ret)
da4243145fb197 Andrzej Pietrasiewicz     2014-05-08  1638  			goto err_purge_funcs;
da4243145fb197 Andrzej Pietrasiewicz     2014-05-08  1639  	}
da4243145fb197 Andrzej Pietrasiewicz     2014-05-08  1640  
88af8bbe4ef781 Sebastian Andrzej Siewior 2012-12-23  1641  	usb_ep_autoconfig_reset(cdev->gadget);
88af8bbe4ef781 Sebastian Andrzej Siewior 2012-12-23  1642  	return 0;
88af8bbe4ef781 Sebastian Andrzej Siewior 2012-12-23  1643  
88af8bbe4ef781 Sebastian Andrzej Siewior 2012-12-23  1644  err_purge_funcs:
88af8bbe4ef781 Sebastian Andrzej Siewior 2012-12-23  1645  	purge_configs_funcs(gi);
88af8bbe4ef781 Sebastian Andrzej Siewior 2012-12-23  1646  err_comp_cleanup:
88af8bbe4ef781 Sebastian Andrzej Siewior 2012-12-23  1647  	composite_dev_cleanup(cdev);
88af8bbe4ef781 Sebastian Andrzej Siewior 2012-12-23  1648  	return ret;
88af8bbe4ef781 Sebastian Andrzej Siewior 2012-12-23  1649  }
88af8bbe4ef781 Sebastian Andrzej Siewior 2012-12-23  1650  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
