Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8F8241C3E
	for <oe-kbuild@lists.linux.dev>; Thu, 30 Mar 2023 11:24:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1680175494; x=1711711494;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=8Kqr17pvog1BJnfLCEGRNY1dy8BFK77CtMnIYuErOmE=;
  b=mTDeN7cgBakQZCKeVnpP7km1QTunMKb1J/X870vV7hhf5vU7Js0lwKmd
   Jwx4O5e0pnV/fZLoljTrIgiS/NJ9PDJH3xqzeM+9hxByvn1RTRskeQ+2z
   pqIy5zCI0SCsM3gqA+rpa/YYNA1QsvHvMrCw7d+okh0zXRHHR6aY+m/+g
   tyqCz5IItkK7nn3ubznwa9qL9bkVKMVKEiLQ1kFsT059vhgBn83d63KN+
   XDmQVLlqWj3Fvz5Dn17KOXfS3Sz8HRNdWCc0et4ykYG7UNDVi1Uxjyh9q
   /UPhXGhcgBqR9qcSftFZ+7OrVIWT+Pil7NI7j09yu9Yj3Dydvj2XNSDGQ
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10664"; a="338638363"
X-IronPort-AV: E=Sophos;i="5.98,303,1673942400"; 
   d="scan'208";a="338638363"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
  by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Mar 2023 04:24:53 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10664"; a="717277829"
X-IronPort-AV: E=Sophos;i="5.98,303,1673942400"; 
   d="scan'208";a="717277829"
Received: from lkp-server01.sh.intel.com (HELO b613635ddfff) ([10.239.97.150])
  by orsmga001.jf.intel.com with ESMTP; 30 Mar 2023 04:24:51 -0700
Received: from kbuild by b613635ddfff with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1phqOg-000Knw-38;
	Thu, 30 Mar 2023 11:24:51 +0000
Date: Thu, 30 Mar 2023 19:24:23 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Julia Lawall <julia.lawall@inria.fr>
Subject: Re: [PATCH] ACPI: utils: Make acpi_handle_list dynamically allocated
Message-ID: <202303301909.2VD4kFxK-lkp@intel.com>
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
In-Reply-To: <20230330030446.2469338-1-vi@endrift.com>
References: <20230330030446.2469338-1-vi@endrift.com>
TO: Vicki Pfau <vi@endrift.com>
TO: linux-acpi@vger.kernel.org
TO: Len Brown <lenb@kernel.org>
CC: Vicki Pfau <vi@endrift.com>

Hi Vicki,

Thank you for the patch! Perhaps something to improve:

[auto build test WARNING on linus/master]
[also build test WARNING on v6.3-rc4 next-20230330]
[cannot apply to rafael-pm/linux-next]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Vicki-Pfau/ACPI-utils-Make-acpi_handle_list-dynamically-allocated/20230330-111547
patch link:    https://lore.kernel.org/r/20230330030446.2469338-1-vi%40endrift.com
patch subject: [PATCH] ACPI: utils: Make acpi_handle_list dynamically allocated
:::::: branch date: 8 hours ago
:::::: commit date: 8 hours ago
config: x86_64-randconfig-c022 (https://download.01.org/0day-ci/archive/20230330/202303301909.2VD4kFxK-lkp@intel.com/config)
compiler: gcc-11 (Debian 11.3.0-8) 11.3.0

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Julia Lawall <julia.lawall@inria.fr>
| Link: https://lore.kernel.org/r/202303301909.2VD4kFxK-lkp@intel.com/

cocci warnings: (new ones prefixed by >>)
>> drivers/acpi/utils.c:410:8-12: ERROR: reference preceded by free on line 406

vim +410 drivers/acpi/utils.c

93064e15c8a3a83 Stefan Binding    2022-07-07  331  
^1da177e4c3f415 Linus Torvalds    2005-04-16  332  acpi_status
4be44fcd3bf648b Len Brown         2005-08-05  333  acpi_evaluate_reference(acpi_handle handle,
^1da177e4c3f415 Linus Torvalds    2005-04-16  334  			acpi_string pathname,
^1da177e4c3f415 Linus Torvalds    2005-04-16  335  			struct acpi_object_list *arguments,
e6daaba7bc853db Vicki Pfau        2023-03-29  336  			struct acpi_handle_list **out)
^1da177e4c3f415 Linus Torvalds    2005-04-16  337  {
^1da177e4c3f415 Linus Torvalds    2005-04-16  338  	acpi_status status = AE_OK;
e6daaba7bc853db Vicki Pfau        2023-03-29  339  	struct acpi_handle_list *list = NULL;
^1da177e4c3f415 Linus Torvalds    2005-04-16  340  	union acpi_object *package = NULL;
^1da177e4c3f415 Linus Torvalds    2005-04-16  341  	union acpi_object *element = NULL;
^1da177e4c3f415 Linus Torvalds    2005-04-16  342  	struct acpi_buffer buffer = { ACPI_ALLOCATE_BUFFER, NULL };
^1da177e4c3f415 Linus Torvalds    2005-04-16  343  	u32 i = 0;
^1da177e4c3f415 Linus Torvalds    2005-04-16  344  
^1da177e4c3f415 Linus Torvalds    2005-04-16  345  
e6daaba7bc853db Vicki Pfau        2023-03-29  346  	if (!out) {
d550d98d3317378 Patrick Mochel    2006-06-27  347  		return AE_BAD_PARAMETER;
^1da177e4c3f415 Linus Torvalds    2005-04-16  348  	}
^1da177e4c3f415 Linus Torvalds    2005-04-16  349  
^1da177e4c3f415 Linus Torvalds    2005-04-16  350  	/* Evaluate object. */
^1da177e4c3f415 Linus Torvalds    2005-04-16  351  
^1da177e4c3f415 Linus Torvalds    2005-04-16  352  	status = acpi_evaluate_object(handle, pathname, arguments, &buffer);
^1da177e4c3f415 Linus Torvalds    2005-04-16  353  	if (ACPI_FAILURE(status))
^1da177e4c3f415 Linus Torvalds    2005-04-16  354  		goto end;
^1da177e4c3f415 Linus Torvalds    2005-04-16  355  
50dd096973f1d95 Jan Engelhardt    2006-10-01  356  	package = buffer.pointer;
^1da177e4c3f415 Linus Torvalds    2005-04-16  357  
^1da177e4c3f415 Linus Torvalds    2005-04-16  358  	if ((buffer.length == 0) || !package) {
^1da177e4c3f415 Linus Torvalds    2005-04-16  359  		status = AE_BAD_DATA;
^1da177e4c3f415 Linus Torvalds    2005-04-16  360  		acpi_util_eval_error(handle, pathname, status);
^1da177e4c3f415 Linus Torvalds    2005-04-16  361  		goto end;
^1da177e4c3f415 Linus Torvalds    2005-04-16  362  	}
^1da177e4c3f415 Linus Torvalds    2005-04-16  363  	if (package->type != ACPI_TYPE_PACKAGE) {
^1da177e4c3f415 Linus Torvalds    2005-04-16  364  		status = AE_BAD_DATA;
^1da177e4c3f415 Linus Torvalds    2005-04-16  365  		acpi_util_eval_error(handle, pathname, status);
^1da177e4c3f415 Linus Torvalds    2005-04-16  366  		goto end;
^1da177e4c3f415 Linus Torvalds    2005-04-16  367  	}
^1da177e4c3f415 Linus Torvalds    2005-04-16  368  	if (!package->package.count) {
^1da177e4c3f415 Linus Torvalds    2005-04-16  369  		status = AE_BAD_DATA;
^1da177e4c3f415 Linus Torvalds    2005-04-16  370  		acpi_util_eval_error(handle, pathname, status);
^1da177e4c3f415 Linus Torvalds    2005-04-16  371  		goto end;
^1da177e4c3f415 Linus Torvalds    2005-04-16  372  	}
^1da177e4c3f415 Linus Torvalds    2005-04-16  373  
e6daaba7bc853db Vicki Pfau        2023-03-29  374  	list = kmalloc(package->package.count * sizeof(list->handles[0]) + sizeof(*list), GFP_KERNEL);
e6daaba7bc853db Vicki Pfau        2023-03-29  375  	if (!list) {
09e15086936e01d Xiongfeng Wang    2017-11-09  376  		kfree(package);
d550d98d3317378 Patrick Mochel    2006-06-27  377  		return AE_NO_MEMORY;
^1da177e4c3f415 Linus Torvalds    2005-04-16  378  	}
^1da177e4c3f415 Linus Torvalds    2005-04-16  379  	list->count = package->package.count;
^1da177e4c3f415 Linus Torvalds    2005-04-16  380  
^1da177e4c3f415 Linus Torvalds    2005-04-16  381  	/* Extract package data. */
^1da177e4c3f415 Linus Torvalds    2005-04-16  382  
^1da177e4c3f415 Linus Torvalds    2005-04-16  383  	for (i = 0; i < list->count; i++) {
^1da177e4c3f415 Linus Torvalds    2005-04-16  384  
^1da177e4c3f415 Linus Torvalds    2005-04-16  385  		element = &(package->package.elements[i]);
^1da177e4c3f415 Linus Torvalds    2005-04-16  386  
cd0b2248241f414 Bob Moore         2008-04-10  387  		if (element->type != ACPI_TYPE_LOCAL_REFERENCE) {
^1da177e4c3f415 Linus Torvalds    2005-04-16  388  			status = AE_BAD_DATA;
^1da177e4c3f415 Linus Torvalds    2005-04-16  389  			acpi_util_eval_error(handle, pathname, status);
^1da177e4c3f415 Linus Torvalds    2005-04-16  390  			break;
^1da177e4c3f415 Linus Torvalds    2005-04-16  391  		}
^1da177e4c3f415 Linus Torvalds    2005-04-16  392  
b6a163875935ce8 Thomas Renninger  2008-03-12  393  		if (!element->reference.handle) {
b6a163875935ce8 Thomas Renninger  2008-03-12  394  			status = AE_NULL_ENTRY;
c48cf1b9dd8f013 Rafael J. Wysocki 2014-12-12  395  			acpi_util_eval_error(handle, pathname, status);
b6a163875935ce8 Thomas Renninger  2008-03-12  396  			break;
b6a163875935ce8 Thomas Renninger  2008-03-12  397  		}
^1da177e4c3f415 Linus Torvalds    2005-04-16  398  		/* Get the  acpi_handle. */
^1da177e4c3f415 Linus Torvalds    2005-04-16  399  
^1da177e4c3f415 Linus Torvalds    2005-04-16  400  		list->handles[i] = element->reference.handle;
fba2ae30fe8cd13 Rafael J. Wysocki 2021-01-20  401  		acpi_handle_debug(list->handles[i], "Found in reference list\n");
^1da177e4c3f415 Linus Torvalds    2005-04-16  402  	}
^1da177e4c3f415 Linus Torvalds    2005-04-16  403  
^1da177e4c3f415 Linus Torvalds    2005-04-16  404        end:
e6daaba7bc853db Vicki Pfau        2023-03-29  405  	if (ACPI_FAILURE(status) && list) {
e6daaba7bc853db Vicki Pfau        2023-03-29 @406  		kfree(list);
^1da177e4c3f415 Linus Torvalds    2005-04-16  407  	}
^1da177e4c3f415 Linus Torvalds    2005-04-16  408  
02438d8771ae6a4 Len Brown         2006-06-30  409  	kfree(buffer.pointer);
e6daaba7bc853db Vicki Pfau        2023-03-29 @410  	*out = list;
^1da177e4c3f415 Linus Torvalds    2005-04-16  411  
d550d98d3317378 Patrick Mochel    2006-06-27  412  	return status;
^1da177e4c3f415 Linus Torvalds    2005-04-16  413  }
^1da177e4c3f415 Linus Torvalds    2005-04-16  414  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
