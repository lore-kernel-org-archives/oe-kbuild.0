Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1F55E6111
	for <oe-kbuild@lists.linux.dev>; Wed, 15 Mar 2023 19:13:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1678907593; x=1710443593;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=8kWLk1NrgRN+K9CIS2AYNOTL2BHbZ9CCAc0OlJ+tsjs=;
  b=jn3wTHIpqKEaUNcfukRYqOpWhgLa4pqHc9EHhDxrwOoI2wuDFfUOf5HJ
   5HovWt0nxO0TzVUxhPR7ChRf7EhUEkmTGahRAqjqm3aiWePRmsH45lSj8
   oQa6xED8rfXNm/zN7lPaZ8ouhJU7qr3SMN2pxVJy8cMqlBjP52r6yDXug
   cnn/ja7Yu6rowBxlwAY7IfEr2w00StXQMxXFGIq3IOA4Sd6yOa8y9v2s8
   nNqMWDMJ9y7ZS16Zz82mQAlfqLxGicgignqEGxJik1pZNO+dNxq5+VgRL
   nJbSVX7MxIf9roQprgAYafFP08FzjRhpjEdSYMfThKo3UIaE+BFiOR9Dw
   w==;
X-IronPort-AV: E=McAfee;i="6500,9779,10650"; a="402672153"
X-IronPort-AV: E=Sophos;i="5.98,262,1673942400"; 
   d="scan'208";a="402672153"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
  by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Mar 2023 12:13:04 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10650"; a="629571067"
X-IronPort-AV: E=Sophos;i="5.98,262,1673942400"; 
   d="scan'208";a="629571067"
Received: from lkp-server01.sh.intel.com (HELO b613635ddfff) ([10.239.97.150])
  by orsmga003.jf.intel.com with ESMTP; 15 Mar 2023 12:13:03 -0700
Received: from kbuild by b613635ddfff with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pcWYY-0007yZ-2c;
	Wed, 15 Mar 2023 19:13:02 +0000
Date: Thu, 16 Mar 2023 03:12:06 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: Re: [PATCH] tty: serdev: serdev-ttyport: add devt for ctrl->dev
Message-ID: <202303160201.bnmM2caW-lkp@intel.com>
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
In-Reply-To: <20230315105400.23426-1-sherry.sun@nxp.com>
References: <20230315105400.23426-1-sherry.sun@nxp.com>
TO: Sherry Sun <sherry.sun@nxp.com>
TO: gregkh@linuxfoundation.org
TO: jirislaby@kernel.org
TO: robh@kernel.org
CC: linux-serial@vger.kernel.org
CC: linux-kernel@vger.kernel.org
CC: linux-imx@nxp.com

Hi Sherry,

Thank you for the patch! Perhaps something to improve:

[auto build test WARNING on tty/tty-testing]
[also build test WARNING on tty/tty-next tty/tty-linus linus/master v6.3-rc2 next-20230315]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Sherry-Sun/tty-serdev-serdev-ttyport-add-devt-for-ctrl-dev/20230315-185913
base:   https://git.kernel.org/pub/scm/linux/kernel/git/gregkh/tty.git tty-testing
patch link:    https://lore.kernel.org/r/20230315105400.23426-1-sherry.sun%40nxp.com
patch subject: [PATCH] tty: serdev: serdev-ttyport: add devt for ctrl->dev
:::::: branch date: 8 hours ago
:::::: commit date: 8 hours ago
config: x86_64-randconfig-m001 (https://download.01.org/0day-ci/archive/20230316/202303160201.bnmM2caW-lkp@intel.com/config)
compiler: gcc-11 (Debian 11.3.0-8) 11.3.0

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Link: https://lore.kernel.org/r/202303160201.bnmM2caW-lkp@intel.com/

smatch warnings:
drivers/tty/serdev/serdev-ttyport.c:273 serdev_tty_port_register() warn: variable dereferenced before check 'drv' (see line 270)

vim +/drv +273 drivers/tty/serdev/serdev-ttyport.c

bed35c6dfa6a36 Rob Herring  2017-02-02  263  
bed35c6dfa6a36 Rob Herring  2017-02-02  264  struct device *serdev_tty_port_register(struct tty_port *port,
bed35c6dfa6a36 Rob Herring  2017-02-02  265  					struct device *parent,
bed35c6dfa6a36 Rob Herring  2017-02-02  266  					struct tty_driver *drv, int idx)
bed35c6dfa6a36 Rob Herring  2017-02-02  267  {
bed35c6dfa6a36 Rob Herring  2017-02-02  268  	struct serdev_controller *ctrl;
bed35c6dfa6a36 Rob Herring  2017-02-02  269  	struct serport *serport;
225acc66b125b9 Sherry Sun   2023-03-15 @270  	dev_t devt = MKDEV(drv->major, drv->minor_start) + idx;
bed35c6dfa6a36 Rob Herring  2017-02-02  271  	int ret;
bed35c6dfa6a36 Rob Herring  2017-02-02  272  
bed35c6dfa6a36 Rob Herring  2017-02-02 @273  	if (!port || !drv || !parent)
bed35c6dfa6a36 Rob Herring  2017-02-02  274  		return ERR_PTR(-ENODEV);
bed35c6dfa6a36 Rob Herring  2017-02-02  275  
bed35c6dfa6a36 Rob Herring  2017-02-02  276  	ctrl = serdev_controller_alloc(parent, sizeof(struct serport));
bed35c6dfa6a36 Rob Herring  2017-02-02  277  	if (!ctrl)
bed35c6dfa6a36 Rob Herring  2017-02-02  278  		return ERR_PTR(-ENOMEM);
bed35c6dfa6a36 Rob Herring  2017-02-02  279  	serport = serdev_controller_get_drvdata(ctrl);
bed35c6dfa6a36 Rob Herring  2017-02-02  280  
bed35c6dfa6a36 Rob Herring  2017-02-02  281  	serport->port = port;
bed35c6dfa6a36 Rob Herring  2017-02-02  282  	serport->tty_idx = idx;
bed35c6dfa6a36 Rob Herring  2017-02-02  283  	serport->tty_drv = drv;
bed35c6dfa6a36 Rob Herring  2017-02-02  284  
225acc66b125b9 Sherry Sun   2023-03-15  285  	ctrl->dev.devt = devt;
bed35c6dfa6a36 Rob Herring  2017-02-02  286  	ctrl->ops = &ctrl_ops;
bed35c6dfa6a36 Rob Herring  2017-02-02  287  
aee5da7838787f Johan Hovold 2017-04-11  288  	port->client_ops = &client_ops;
aee5da7838787f Johan Hovold 2017-04-11  289  	port->client_data = ctrl;
aee5da7838787f Johan Hovold 2017-04-11  290  
bed35c6dfa6a36 Rob Herring  2017-02-02  291  	ret = serdev_controller_add(ctrl);
bed35c6dfa6a36 Rob Herring  2017-02-02  292  	if (ret)
aee5da7838787f Johan Hovold 2017-04-11  293  		goto err_reset_data;
bed35c6dfa6a36 Rob Herring  2017-02-02  294  
bed35c6dfa6a36 Rob Herring  2017-02-02  295  	dev_info(&ctrl->dev, "tty port %s%d registered\n", drv->name, idx);
bed35c6dfa6a36 Rob Herring  2017-02-02  296  	return &ctrl->dev;
bed35c6dfa6a36 Rob Herring  2017-02-02  297  
aee5da7838787f Johan Hovold 2017-04-11  298  err_reset_data:
aee5da7838787f Johan Hovold 2017-04-11  299  	port->client_data = NULL;
0c5aae59270fb1 Johan Hovold 2020-02-10  300  	port->client_ops = &tty_port_default_client_ops;
bed35c6dfa6a36 Rob Herring  2017-02-02  301  	serdev_controller_put(ctrl);
aee5da7838787f Johan Hovold 2017-04-11  302  
bed35c6dfa6a36 Rob Herring  2017-02-02  303  	return ERR_PTR(ret);
bed35c6dfa6a36 Rob Herring  2017-02-02  304  }
bed35c6dfa6a36 Rob Herring  2017-02-02  305  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
