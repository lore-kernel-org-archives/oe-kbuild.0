Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 654F5179
	for <oe-kbuild@lists.linux.dev>; Sun, 27 Nov 2022 06:39:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1669531165; x=1701067165;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=UE2Hkl+xLPM+KPDh1q8Wo6l05BkvVMD7PMjzvJm7g50=;
  b=m5QX+9btqheIhID1IyGus2w3tHLrQJxa6QEwywS5ZWYO3LsgKxBeRv3O
   jzOiy9IAf/NyAmDmCJDyuI2Oov4fegibiLqBgJCgxYWPr2D/4Nx+75M8v
   +XK4kvueAj/7zBI/veZXystnTz96ABN7TvtEomPAo9EBUCk8YYZ2Z1eWT
   pBNUt71ilcP2S2dsOz9pGQWkyWtxzejZe0N92Mkrb5pKemkAOtXEgspl1
   0kYpthEhbsoNmwkSkSfjO+TUWG/BdwF1SJ9XqY9/KSuBt0N4/2F0STvk4
   LYOdnqbwl7AMU1AYjaRh3fT28o+JK/d71CUspqzJt+IgN2Atp19XGcfCr
   g==;
X-IronPort-AV: E=McAfee;i="6500,9779,10543"; a="316473548"
X-IronPort-AV: E=Sophos;i="5.96,197,1665471600"; 
   d="scan'208";a="316473548"
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
  by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Nov 2022 22:39:24 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10543"; a="888048534"
X-IronPort-AV: E=Sophos;i="5.96,197,1665471600"; 
   d="scan'208";a="888048534"
Received: from lkp-server01.sh.intel.com (HELO 64a2d449c951) ([10.239.97.150])
  by fmsmga006.fm.intel.com with ESMTP; 26 Nov 2022 22:39:22 -0800
Received: from kbuild by 64a2d449c951 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1ozBJy-0006pl-0s;
	Sun, 27 Nov 2022 06:39:22 +0000
Date: Sun, 27 Nov 2022 14:38:28 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: [chrome-os:chromeos-5.15 21/58] drivers/thunderbolt/ctl.c:165:22:
 warning: Uninitialized variables: iter.kref, iter.ctl, iter.request,
 iter.request_size, iter.request_type, iter.response, iter.response_size,
 iter.response_type, iter.npackets, iter.match, iter.copy, iter.callback,
 iter.c...
Message-ID: <202211271442.6lGZ8fuv-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

:::::: 
:::::: Manual check reason: "low confidence static check warning: drivers/thunderbolt/ctl.c:165:22: warning: Uninitialized variables: iter.kref, iter.ctl, iter.request, iter.request_size, iter.request_type, iter.response, iter.response_size, iter.response_type, iter.npackets, iter.match, iter.copy, iter.callback, iter.callback_data, iter.flags, iter.work, iter.result, iter.list [uninitvar]"
:::::: 

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
TO: cros-kernel-buildreports@googlegroups.com
TO: Guenter Roeck <groeck@google.com>

tree:   https://chromium.googlesource.com/chromiumos/third_party/kernel chromeos-5.15
head:   09eeb75bf6b178e4d1263e53e4726b8ce027a596
commit: efc6f20079bd5596c6dcc4211fdbd91f57904742 [21/58] UPSTREAM: thunderbolt: Replace usage of found with dedicated list iterator variable
:::::: branch date: 31 hours ago
:::::: commit date: 3 days ago
compiler: riscv64-linux-gcc (GCC) 12.1.0
reproduce (cppcheck warning):
        # apt-get install cppcheck
        git checkout efc6f20079bd5596c6dcc4211fdbd91f57904742
        cppcheck --quiet --enable=style,performance,portability --template=gcc FILE

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>


cppcheck possible warnings: (new ones prefixed by >>, may not real problems)

>> drivers/thunderbolt/eeprom.c:200:23: warning: Parameter 'data' can be declared as pointer to const [constParameter]
   static u8 tb_crc8(u8 *data, int len)
                         ^
--
>> drivers/thunderbolt/ctl.c:165:22: warning: Uninitialized variables: iter.kref, iter.ctl, iter.request, iter.request_size, iter.request_type, iter.response, iter.response_size, iter.response_type, iter.npackets, iter.match, iter.copy, iter.callback, iter.callback_data, iter.flags, iter.work, iter.result, iter.list [uninitvar]
     tb_cfg_request_get(iter);
                        ^

vim +165 drivers/thunderbolt/ctl.c

d7f781bfdbf4eb Mika Westerberg 2017-06-06  157  
d7f781bfdbf4eb Mika Westerberg 2017-06-06  158  static struct tb_cfg_request *
d7f781bfdbf4eb Mika Westerberg 2017-06-06  159  tb_cfg_request_find(struct tb_ctl *ctl, struct ctl_pkg *pkg)
d7f781bfdbf4eb Mika Westerberg 2017-06-06  160  {
efc6f20079bd55 Jakob Koschel   2022-03-24  161  	struct tb_cfg_request *req = NULL, *iter;
d7f781bfdbf4eb Mika Westerberg 2017-06-06  162  
d7f781bfdbf4eb Mika Westerberg 2017-06-06  163  	mutex_lock(&pkg->ctl->request_queue_lock);
efc6f20079bd55 Jakob Koschel   2022-03-24  164  	list_for_each_entry(iter, &pkg->ctl->request_queue, list) {
efc6f20079bd55 Jakob Koschel   2022-03-24 @165  		tb_cfg_request_get(iter);
efc6f20079bd55 Jakob Koschel   2022-03-24  166  		if (iter->match(iter, pkg)) {
efc6f20079bd55 Jakob Koschel   2022-03-24  167  			req = iter;
d7f781bfdbf4eb Mika Westerberg 2017-06-06  168  			break;
d7f781bfdbf4eb Mika Westerberg 2017-06-06  169  		}
efc6f20079bd55 Jakob Koschel   2022-03-24  170  		tb_cfg_request_put(iter);
d7f781bfdbf4eb Mika Westerberg 2017-06-06  171  	}
d7f781bfdbf4eb Mika Westerberg 2017-06-06  172  	mutex_unlock(&pkg->ctl->request_queue_lock);
d7f781bfdbf4eb Mika Westerberg 2017-06-06  173  
efc6f20079bd55 Jakob Koschel   2022-03-24  174  	return req;
d7f781bfdbf4eb Mika Westerberg 2017-06-06  175  }
d7f781bfdbf4eb Mika Westerberg 2017-06-06  176  

-- 
0-DAY CI Kernel Test Service
https://01.org/lkp
