Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3AAD5122AD
	for <oe-kbuild@lists.linux.dev>; Mon,  7 Nov 2022 19:33:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1667849584; x=1699385584;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=Qr4DS67uvX+Gc/q0sVye8A7TTVKeB1jojwqRu1r9zRk=;
  b=GHQ1HquTG0FNp0m77pvB/yC8OB9XBKEMDNgZ72WhJpwtzOBl5rG5dM87
   cvDb7gUEptK55g6ybhSMQJYGqxOEw/eon3MdOy4rUHDgiwTdRSQvS0igu
   FKRbC4E0sQlzzVYDXxh2Y/JSJIX2t8MlokIVEc5iZZhC78Msi7NWdhsK2
   KqNC07+NkNkDakxCbttt99uZERkZK7mzF36+q76uEVLvnp0JJ6Xn3Ll9P
   XdKPsa42em98knk2YlwOWEPaA+DlJZL134vDVWTy0D7ZK0kkysM6btMOl
   zFteLNM/6KYe22tvOlMXc7eBVaK/EDw4PoXcXUb5R0eM1OqSc1EuU7J97
   w==;
X-IronPort-AV: E=McAfee;i="6500,9779,10524"; a="290892789"
X-IronPort-AV: E=Sophos;i="5.96,145,1665471600"; 
   d="scan'208";a="290892789"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
  by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Nov 2022 11:33:03 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10524"; a="965292294"
X-IronPort-AV: E=Sophos;i="5.96,145,1665471600"; 
   d="scan'208";a="965292294"
Received: from lkp-server01.sh.intel.com (HELO 462403710aa9) ([10.239.97.150])
  by fmsmga005.fm.intel.com with ESMTP; 07 Nov 2022 11:33:02 -0800
Received: from kbuild by 462403710aa9 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1os7ri-0000y8-12;
	Mon, 07 Nov 2022 19:33:02 +0000
Date: Tue, 8 Nov 2022 03:32:01 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: Re: [Intel-gfx] [PATCH v12 3/9] overflow: Introduce overflows_type()
 and __castable_to_type()
Message-ID: <202211080335.3svKwZff-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

:::::: 
:::::: Manual check reason: "low confidence bisect report"
:::::: 

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
In-Reply-To: <20220926153953.3836470-4-gwan-gyeong.mun@intel.com>
References: <20220926153953.3836470-4-gwan-gyeong.mun@intel.com>
TO: "Gwan-gyeong Mun" <gwan-gyeong.mun@intel.com>
TO: intel-gfx@lists.freedesktop.org
CC: gustavoars@kernel.org
CC: trix@redhat.com
CC: dlatypov@google.com
CC: llvm@lists.linux.dev
CC: linux@rasmusvillemoes.dk
CC: dri-devel@lists.freedesktop.org
CC: chris@chris-wilson.co.uk
CC: linux-hardening@vger.kernel.org
CC: andrzej.hajda@intel.com
CC: linux-sparse@vger.kernel.org
CC: matthew.auld@intel.com
CC: airlied@redhat.com
CC: thomas.hellstrom@linux.intel.com
CC: keescook@chromium.org
CC: jani.nikula@intel.com
CC: nathan@kernel.org
CC: mchehab@kernel.org
CC: ndesaulniers@google.com
CC: linux-kernel@vger.kernel.org
CC: daniel@ffwll.ch
CC: vitor@massaru.org
CC: luc.vanoostenryck@gmail.com
CC: nirmoy.das@intel.com

Hi Gwan-gyeong,

I love your patch! Perhaps something to improve:

[auto build test WARNING on drm-tip/drm-tip]
[cannot apply to drm-intel/for-linux-next kees/for-next/hardening linus/master v6.1-rc4 next-20221107]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Gwan-gyeong-Mun/Fixes-integer-overflow-or-integer-truncation-issues-in-page-lookups-ttm-place-configuration-and-scatterlist-creation/20220927-094859
base:   git://anongit.freedesktop.org/drm/drm-tip drm-tip
patch link:    https://lore.kernel.org/r/20220926153953.3836470-4-gwan-gyeong.mun%40intel.com
patch subject: [Intel-gfx] [PATCH v12 3/9] overflow: Introduce overflows_type() and __castable_to_type()
:::::: branch date: 6 weeks ago
:::::: commit date: 6 weeks ago
compiler: gcc-11 (Debian 11.3.0-5) 11.3.0

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>

includecheck warnings: (new ones prefixed by >>)
>> drivers/gpu/drm/i915/i915_utils.h: linux/overflow.h is included more than once.

-- 
0-DAY CI Kernel Test Service
https://01.org/lkp
