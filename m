Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8F428179
	for <oe-kbuild@lists.linux.dev>; Sat,  3 Jun 2023 02:41:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1685760079; x=1717296079;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=Mh8hTdS58L1VvD0Jr5u5t0pl/AZPu++PUKcCQ8jmvgw=;
  b=VhvbQLO+1iGPNS+o3TDp45B8DCGFSWM92jljxq7O88ARQadZ4cX8xyTH
   v3b2aTPLCOrYiF3hTscsZVFEsAmsqF+w0RHHPSIsAm3Ct9wTgO0rHn3H7
   b5mg2XPPAmdn5d3BHmkFiSsi2c2VyAoQJylFzCAe1qgKr7hr6PZVWRm6f
   zHs4EoWOVvMv2krNBz62DOVkkQRNPfqvXfCqQ7r0mr0STw4zoXah6W7n3
   i40JZrjSgVr7MdnCU0WCES/VaVcaCF9f9dgVMo9kUgedDNmYlHcLP6969
   i3RsfvPW3CFuaWRvTLf1r4TOBtmZXakOXvXtbooLFKiyFVkxezXDqtKuv
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10729"; a="336385078"
X-IronPort-AV: E=Sophos;i="6.00,214,1681196400"; 
   d="scan'208";a="336385078"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
  by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Jun 2023 19:41:14 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10729"; a="773101849"
X-IronPort-AV: E=Sophos;i="6.00,214,1681196400"; 
   d="scan'208";a="773101849"
Received: from lkp-server01.sh.intel.com (HELO 15ab08e44a81) ([10.239.97.150])
  by fmsmga008.fm.intel.com with ESMTP; 02 Jun 2023 19:41:13 -0700
Received: from kbuild by 15ab08e44a81 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1q5HCa-0001C1-3C;
	Sat, 03 Jun 2023 02:41:12 +0000
Date: Sat, 3 Jun 2023 10:40:42 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: Re: [PATCH 1/3] USB: serial: return errors from break handling
Message-ID: <202306031014.qzAY3uQ6-lkp@intel.com>
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
In-Reply-To: <20230602124642.19076-2-johan@kernel.org>
References: <20230602124642.19076-2-johan@kernel.org>
TO: Johan Hovold <johan@kernel.org>
TO: Johan Hovold <johan@kernel.org>
CC: "Greg Kroah-Hartman" <gregkh@linuxfoundation.org>
CC: linux-usb@vger.kernel.org
CC: linux-kernel@vger.kernel.org
CC: Corey Minyard <minyard@acm.org>

Hi Johan,

kernel test robot noticed the following build warnings:

[auto build test WARNING on johan-usb-serial/usb-next]
[also build test WARNING on johan-usb-serial/usb-linus usb/usb-testing usb/usb-next usb/usb-linus tty/tty-testing tty/tty-next tty/tty-linus linus/master v6.4-rc4 next-20230602]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Johan-Hovold/USB-serial-return-errors-from-break-handling/20230602-204856
base:   https://git.kernel.org/pub/scm/linux/kernel/git/johan/usb-serial.git usb-next
patch link:    https://lore.kernel.org/r/20230602124642.19076-2-johan%40kernel.org
patch subject: [PATCH 1/3] USB: serial: return errors from break handling
:::::: branch date: 14 hours ago
:::::: commit date: 14 hours ago
config: i386-randconfig-m021-20230531 (https://download.01.org/0day-ci/archive/20230603/202306031014.qzAY3uQ6-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202306031014.qzAY3uQ6-lkp@intel.com/

New smatch warnings:
drivers/usb/serial/io_edgeport.c:1601 edge_break() error: uninitialized symbol 'status'.

Old smatch warnings:
drivers/usb/serial/io_edgeport.c:2357 change_port_settings() warn: inconsistent indenting

vim +/status +1601 drivers/usb/serial/io_edgeport.c

^1da177e4c3f41 Linus Torvalds     2005-04-16  1557  
^1da177e4c3f41 Linus Torvalds     2005-04-16  1558  
^1da177e4c3f41 Linus Torvalds     2005-04-16  1559  /*****************************************************************************
^1da177e4c3f41 Linus Torvalds     2005-04-16  1560   * SerialBreak
^1da177e4c3f41 Linus Torvalds     2005-04-16  1561   *	this function sends a break to the port
^1da177e4c3f41 Linus Torvalds     2005-04-16  1562   *****************************************************************************/
12992379710489 Johan Hovold       2023-06-02  1563  static int edge_break(struct tty_struct *tty, int break_state)
^1da177e4c3f41 Linus Torvalds     2005-04-16  1564  {
95da310e66ee80 Alan Cox           2008-07-22  1565  	struct usb_serial_port *port = tty->driver_data;
^1da177e4c3f41 Linus Torvalds     2005-04-16  1566  	struct edgeport_port *edge_port = usb_get_serial_port_data(port);
6e8cf7751f9fb9 Greg Kroah-Hartman 2007-01-18  1567  	struct edgeport_serial *edge_serial = usb_get_serial_data(port->serial);
^1da177e4c3f41 Linus Torvalds     2005-04-16  1568  	int status;
^1da177e4c3f41 Linus Torvalds     2005-04-16  1569  
232dce89b5b000 Geyslan G. Bem     2015-12-11  1570  	if (!edge_serial->is_epic ||
232dce89b5b000 Geyslan G. Bem     2015-12-11  1571  	    edge_serial->epic_descriptor.Supports.IOSPChase) {
^1da177e4c3f41 Linus Torvalds     2005-04-16  1572  		/* flush and chase */
cb8eaa8b2b9133 Richard Knutsson   2007-03-17  1573  		edge_port->chaseResponsePending = true;
^1da177e4c3f41 Linus Torvalds     2005-04-16  1574  
984f68683298ba Greg Kroah-Hartman 2012-09-18  1575  		dev_dbg(&port->dev, "%s - Sending IOSP_CMD_CHASE_PORT\n", __func__);
^1da177e4c3f41 Linus Torvalds     2005-04-16  1576  		status = send_iosp_ext_cmd(edge_port, IOSP_CMD_CHASE_PORT, 0);
^1da177e4c3f41 Linus Torvalds     2005-04-16  1577  		if (status == 0) {
03f0dbf74c7a11 Alan Cox           2008-07-22  1578  			/* block until chase finished */
^1da177e4c3f41 Linus Torvalds     2005-04-16  1579  			block_until_chase_response(edge_port);
^1da177e4c3f41 Linus Torvalds     2005-04-16  1580  		} else {
cb8eaa8b2b9133 Richard Knutsson   2007-03-17  1581  			edge_port->chaseResponsePending = false;
^1da177e4c3f41 Linus Torvalds     2005-04-16  1582  		}
6e8cf7751f9fb9 Greg Kroah-Hartman 2007-01-18  1583  	}
^1da177e4c3f41 Linus Torvalds     2005-04-16  1584  
232dce89b5b000 Geyslan G. Bem     2015-12-11  1585  	if (!edge_serial->is_epic ||
232dce89b5b000 Geyslan G. Bem     2015-12-11  1586  	    edge_serial->epic_descriptor.Supports.IOSPSetClrBreak) {
^1da177e4c3f41 Linus Torvalds     2005-04-16  1587  		if (break_state == -1) {
984f68683298ba Greg Kroah-Hartman 2012-09-18  1588  			dev_dbg(&port->dev, "%s - Sending IOSP_CMD_SET_BREAK\n", __func__);
03f0dbf74c7a11 Alan Cox           2008-07-22  1589  			status = send_iosp_ext_cmd(edge_port,
03f0dbf74c7a11 Alan Cox           2008-07-22  1590  						IOSP_CMD_SET_BREAK, 0);
^1da177e4c3f41 Linus Torvalds     2005-04-16  1591  		} else {
984f68683298ba Greg Kroah-Hartman 2012-09-18  1592  			dev_dbg(&port->dev, "%s - Sending IOSP_CMD_CLEAR_BREAK\n", __func__);
03f0dbf74c7a11 Alan Cox           2008-07-22  1593  			status = send_iosp_ext_cmd(edge_port,
03f0dbf74c7a11 Alan Cox           2008-07-22  1594  						IOSP_CMD_CLEAR_BREAK, 0);
^1da177e4c3f41 Linus Torvalds     2005-04-16  1595  		}
03f0dbf74c7a11 Alan Cox           2008-07-22  1596  		if (status)
984f68683298ba Greg Kroah-Hartman 2012-09-18  1597  			dev_dbg(&port->dev, "%s - error sending break set/clear command.\n",
03f0dbf74c7a11 Alan Cox           2008-07-22  1598  				__func__);
6e8cf7751f9fb9 Greg Kroah-Hartman 2007-01-18  1599  	}
12992379710489 Johan Hovold       2023-06-02  1600  
12992379710489 Johan Hovold       2023-06-02 @1601  	return status;
^1da177e4c3f41 Linus Torvalds     2005-04-16  1602  }
^1da177e4c3f41 Linus Torvalds     2005-04-16  1603  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
