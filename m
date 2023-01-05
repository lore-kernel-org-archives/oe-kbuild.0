Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BE2ABA2C;
	Thu,  5 Jan 2023 08:26:35 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 750191063;
	Thu,  5 Jan 2023 00:27:16 -0800 (PST)
Received: from e120937-lin (unknown [172.31.20.19])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id DF2EF3F71A;
	Thu,  5 Jan 2023 00:26:33 -0800 (PST)
Date: Thu, 5 Jan 2023 08:26:30 +0000
From: Cristian Marussi <cristian.marussi@arm.com>
To: Dan Carpenter <error27@gmail.com>
Cc: oe-kbuild@lists.linux.dev, lkp@intel.com, oe-kbuild-all@lists.linux.dev,
	Sudeep Holla <sudeep.holla@arm.com>
Subject: Re: [sudeep-holla:for-next/scmi 23/30]
 drivers/firmware/arm_scmi/driver.c:2531 scmi_debugfs_common_setup() error:
 uninitialized symbol 'c_ptr'.
Message-ID: <Y7aJtuRuT9dyoH5G@e120937-lin>
References: <202301050721.xSWIWpwP-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <202301050721.xSWIWpwP-lkp@intel.com>

On Thu, Jan 05, 2023 at 07:32:40AM +0300, Dan Carpenter wrote:
> tree:   https://git.kernel.org/pub/scm/linux/kernel/git/sudeep.holla/linux.git for-next/scmi
> head:   0b4d8ff8d58dc9cd19bae9c109b313830263c928
> commit: 0868ff68bdf60d4fd3ea542ca568ecf40697a2b5 [23/30] firmware: arm_scmi: Populate a common SCMI debugsfs root
> config: parisc-randconfig-m041-20230102
> compiler: hppa-linux-gcc (GCC) 12.1.0
> 
> If you fix the issue, kindly add following tag where applicable
> | Reported-by: kernel test robot <lkp@intel.com>
> | Reported-by: Dan Carpenter <error27@gmail.com>
> 
> New smatch warnings:
> drivers/firmware/arm_scmi/driver.c:2531 scmi_debugfs_common_setup() error: uninitialized symbol 'c_ptr'.
> 

Hi Dan,

> vim +/c_ptr +2531 drivers/firmware/arm_scmi/driver.c
> 
> 0868ff68bdf60d Cristian Marussi 2022-12-29  2512  static struct scmi_debug_info *scmi_debugfs_common_setup(struct scmi_info *info)
> 0868ff68bdf60d Cristian Marussi 2022-12-29  2513  {
> 0868ff68bdf60d Cristian Marussi 2022-12-29  2514  	int ret;
> 0868ff68bdf60d Cristian Marussi 2022-12-29  2515  	const char *c_ptr;
> 0868ff68bdf60d Cristian Marussi 2022-12-29  2516  	char top_dir[16];
> 0868ff68bdf60d Cristian Marussi 2022-12-29  2517  	struct dentry *trans, *top_dentry;
> 0868ff68bdf60d Cristian Marussi 2022-12-29  2518  	struct scmi_debug_info *dbg;
> 0868ff68bdf60d Cristian Marussi 2022-12-29  2519  
> 0868ff68bdf60d Cristian Marussi 2022-12-29  2520  	dbg = devm_kzalloc(info->dev, sizeof(*dbg), GFP_KERNEL);
> 0868ff68bdf60d Cristian Marussi 2022-12-29  2521  	if (!dbg)
> 0868ff68bdf60d Cristian Marussi 2022-12-29  2522  		return NULL;
> 0868ff68bdf60d Cristian Marussi 2022-12-29  2523  
> 0868ff68bdf60d Cristian Marussi 2022-12-29  2524  	dbg->name = kstrdup(of_node_full_name(info->dev->of_node), GFP_KERNEL);
> 0868ff68bdf60d Cristian Marussi 2022-12-29  2525  	if (!dbg->name) {
> 0868ff68bdf60d Cristian Marussi 2022-12-29  2526  		devm_kfree(info->dev, dbg);
> 0868ff68bdf60d Cristian Marussi 2022-12-29  2527  		return ERR_PTR(-ENOMEM);
> 0868ff68bdf60d Cristian Marussi 2022-12-29  2528  	}
> 0868ff68bdf60d Cristian Marussi 2022-12-29  2529  
> 0868ff68bdf60d Cristian Marussi 2022-12-29  2530  	of_property_read_string(info->dev->of_node, "compatible", &c_ptr);
> 0868ff68bdf60d Cristian Marussi 2022-12-29 @2531  	dbg->type = kstrdup(c_ptr, GFP_KERNEL);
> 
> My instinct is to agree with the checker on this and say that it does
> feel like we should check if of_property_read_string() read something.
> 

Well I could have, but I avoided it because this .compatible is related
to the device node attached to info->dev which is the platform device
itself which is being probed by this driver and from it is exactly from
that probe path, indeed, that this same function is called here: so the
property cannot be empty or non-existent here since it is the very
reason we are in this code path.

... but, for peace of mind, I could add simply 'c_ptr = NULL;' upfront
and let kstrdup trigger the fail path when called with a NULL
c_ptr...this indeed has basically no cost and it is more future-proof
probably...

Thoughts ?

Thanks,
Cristian
