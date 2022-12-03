Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EB6482F56
	for <oe-kbuild@lists.linux.dev>; Sat,  3 Dec 2022 16:20:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1670084447; x=1701620447;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=Xof6+dnQxlf3GuuskzJgNV1tLJwhFc7RY1ldP/fjMHc=;
  b=RjNLSzsdFYnX3Fp7Bq3sT4xsxltRTS5jyxkiiR1oONsyDeUgZSKzi/uU
   I3m1D1xLblMhMN9WpheIpivNJ9x1Amh0hXmnS2hMXf75ZkXwxN4bcnvjK
   Oa26DGoBwAyRx8lQS+nAgauA/grfTiUJLC//XUJfBYrKkc1XLT8COn3yV
   uVoyJ6KTQQnveMEHbMk+ssACnNEpa3qDBXClZ6llBLba5hJP4jaEu3qFl
   FG3rCGboScJqrl7RjukE+6fDPtAYYfEffiuEnZqP9wqQh+zwQxj+IDO6C
   QSckeY8UOKNZl1LNLy4mnKksSU6rbVi4XaUHboyWZ/cK1tpI/XgXfR0al
   g==;
X-IronPort-AV: E=McAfee;i="6500,9779,10549"; a="343108991"
X-IronPort-AV: E=Sophos;i="5.96,214,1665471600"; 
   d="scan'208";a="343108991"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
  by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Dec 2022 08:20:46 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10549"; a="645349925"
X-IronPort-AV: E=Sophos;i="5.96,214,1665471600"; 
   d="scan'208";a="645349925"
Received: from lkp-server01.sh.intel.com (HELO 4d912534d779) ([10.239.97.150])
  by orsmga002.jf.intel.com with ESMTP; 03 Dec 2022 08:20:44 -0800
Received: from kbuild by 4d912534d779 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1p1VFr-0000DT-2J;
	Sat, 03 Dec 2022 16:20:43 +0000
Date: Sun, 4 Dec 2022 00:20:11 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: [jsarha:backport/cros-v4.14-intel-audio 6046/9999]
 drivers/gpu/drm/amd/amdgpu/amdgpu_debugfs.c:119:21: sparse: sparse:
 incorrect type in argument 2 (different address spaces)
Message-ID: <202212040027.SKlgpZV2-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="QOsuMNdzeW434NVn"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit


--QOsuMNdzeW434NVn
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit

:::::: 
:::::: Manual check reason: "low confidence bisect report"
:::::: 

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
TO: Alex Deucher <alexander.deucher@amd.com>
CC: Daniel Kurtz <djkurtz@chromium.org>
CC: Dominik Behr <dbehr@chromium.org>
CC: "Stéphane Marchesin" <marcheu@chromium.org>

tree:   https://github.com/jsarha/linux backport/cros-v4.14-intel-audio
head:   ed5b3159902598be61b23ef22a235d9b1eaa9ad8
commit: 2376c1da325e9a929b5689798220160cbe6008f1 [6046/9999] UPSTREAM: drm/amdgpu: move debugfs functions to their own file
:::::: branch date: 4 years, 1 month ago
:::::: commit date: 4 years, 4 months ago
config: s390-randconfig-s043-20221201
compiler: s390-linux-gcc (GCC) 7.5.0
reproduce:
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # apt-get install sparse
        # sparse version: v0.6.4-39-gce1a6720-dirty
        # https://github.com/jsarha/linux/commit/2376c1da325e9a929b5689798220160cbe6008f1
        git remote add jsarha https://github.com/jsarha/linux
        git fetch --no-tags jsarha backport/cros-v4.14-intel-audio
        git checkout 2376c1da325e9a929b5689798220160cbe6008f1
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-7.5.0 make.cross C=1 CF='-fdiagnostic-prefix -D__CHECK_ENDIAN__' O=build_dir ARCH=s390 SHELL=/bin/bash drivers/gpu/drm/amd/amdgpu/ mm/

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>

sparse warnings: (new ones prefixed by >>)
   drivers/gpu/drm/amd/amdgpu/amdgpu_debugfs.c:119:21: sparse: sparse: cast removes address space '<asn:1>' of expression
   drivers/gpu/drm/amd/amdgpu/amdgpu_debugfs.c:119:21: sparse: sparse: cast removes address space '<asn:1>' of expression
   drivers/gpu/drm/amd/amdgpu/amdgpu_debugfs.c:119:21: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void const volatile [noderef] <asn:1> * @@     got unsigned int [usertype] * @@
   drivers/gpu/drm/amd/amdgpu/amdgpu_debugfs.c:119:21: sparse:     expected void const volatile [noderef] <asn:1> *
   drivers/gpu/drm/amd/amdgpu/amdgpu_debugfs.c:119:21: sparse:     got unsigned int [usertype] *
   drivers/gpu/drm/amd/amdgpu/amdgpu_debugfs.c:119:21: sparse: sparse: cast removes address space '<asn:1>' of expression
   drivers/gpu/drm/amd/amdgpu/amdgpu_debugfs.c:119:21: sparse: sparse: cast removes address space '<asn:1>' of expression
>> drivers/gpu/drm/amd/amdgpu/amdgpu_debugfs.c:119:21: sparse: sparse: incorrect type in argument 2 (different address spaces) @@     expected void [noderef] <asn:1> *ptr @@     got unsigned int [usertype] * @@
   drivers/gpu/drm/amd/amdgpu/amdgpu_debugfs.c:119:21: sparse:     expected void [noderef] <asn:1> *ptr
   drivers/gpu/drm/amd/amdgpu/amdgpu_debugfs.c:119:21: sparse:     got unsigned int [usertype] *
   drivers/gpu/drm/amd/amdgpu/amdgpu_debugfs.c:119:21: sparse: sparse: cast removes address space '<asn:1>' of expression
   drivers/gpu/drm/amd/amdgpu/amdgpu_debugfs.c:194:21: sparse: sparse: cast removes address space '<asn:1>' of expression
   drivers/gpu/drm/amd/amdgpu/amdgpu_debugfs.c:194:21: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void const volatile [noderef] <asn:1> * @@     got unsigned int [usertype] * @@
   drivers/gpu/drm/amd/amdgpu/amdgpu_debugfs.c:194:21: sparse:     expected void const volatile [noderef] <asn:1> *
   drivers/gpu/drm/amd/amdgpu/amdgpu_debugfs.c:194:21: sparse:     got unsigned int [usertype] *
   drivers/gpu/drm/amd/amdgpu/amdgpu_debugfs.c:194:21: sparse: sparse: cast removes address space '<asn:1>' of expression
   drivers/gpu/drm/amd/amdgpu/amdgpu_debugfs.c:194:21: sparse: sparse: cast removes address space '<asn:1>' of expression
>> drivers/gpu/drm/amd/amdgpu/amdgpu_debugfs.c:194:21: sparse: sparse: incorrect type in argument 2 (different address spaces) @@     expected void const [noderef] <asn:1> *ptr @@     got unsigned int [usertype] * @@
   drivers/gpu/drm/amd/amdgpu/amdgpu_debugfs.c:194:21: sparse:     expected void const [noderef] <asn:1> *ptr
   drivers/gpu/drm/amd/amdgpu/amdgpu_debugfs.c:194:21: sparse:     got unsigned int [usertype] *
   drivers/gpu/drm/amd/amdgpu/amdgpu_debugfs.c:194:21: sparse: sparse: cast removes address space '<asn:1>' of expression
   drivers/gpu/drm/amd/amdgpu/amdgpu_debugfs.c:194:21: sparse: sparse: cast removes address space '<asn:1>' of expression
   drivers/gpu/drm/amd/amdgpu/amdgpu_debugfs.c:194:21: sparse: sparse: cast removes address space '<asn:1>' of expression
>> drivers/gpu/drm/amd/amdgpu/amdgpu_debugfs.c:194:21: sparse: sparse: incorrect type in argument 2 (different address spaces) @@     expected void const [noderef] <asn:1> *ptr @@     got unsigned int [usertype] * @@
   drivers/gpu/drm/amd/amdgpu/amdgpu_debugfs.c:194:21: sparse:     expected void const [noderef] <asn:1> *ptr
   drivers/gpu/drm/amd/amdgpu/amdgpu_debugfs.c:194:21: sparse:     got unsigned int [usertype] *
   drivers/gpu/drm/amd/amdgpu/amdgpu_debugfs.c:194:21: sparse: sparse: cast removes address space '<asn:1>' of expression
   drivers/gpu/drm/amd/amdgpu/amdgpu_debugfs.c:194:21: sparse: sparse: cast removes address space '<asn:1>' of expression
   drivers/gpu/drm/amd/amdgpu/amdgpu_debugfs.c:194:21: sparse: sparse: cast removes address space '<asn:1>' of expression
>> drivers/gpu/drm/amd/amdgpu/amdgpu_debugfs.c:194:21: sparse: sparse: incorrect type in argument 2 (different address spaces) @@     expected void const [noderef] <asn:1> *ptr @@     got unsigned int [usertype] * @@
   drivers/gpu/drm/amd/amdgpu/amdgpu_debugfs.c:194:21: sparse:     expected void const [noderef] <asn:1> *ptr
   drivers/gpu/drm/amd/amdgpu/amdgpu_debugfs.c:194:21: sparse:     got unsigned int [usertype] *
   drivers/gpu/drm/amd/amdgpu/amdgpu_debugfs.c:194:21: sparse: sparse: cast removes address space '<asn:1>' of expression
   drivers/gpu/drm/amd/amdgpu/amdgpu_debugfs.c:194:21: sparse: sparse: cast removes address space '<asn:1>' of expression
   drivers/gpu/drm/amd/amdgpu/amdgpu_debugfs.c:194:21: sparse: sparse: cast removes address space '<asn:1>' of expression
>> drivers/gpu/drm/amd/amdgpu/amdgpu_debugfs.c:194:21: sparse: sparse: incorrect type in argument 2 (different address spaces) @@     expected void const [noderef] <asn:1> *ptr @@     got unsigned int [usertype] * @@
   drivers/gpu/drm/amd/amdgpu/amdgpu_debugfs.c:194:21: sparse:     expected void const [noderef] <asn:1> *ptr
   drivers/gpu/drm/amd/amdgpu/amdgpu_debugfs.c:194:21: sparse:     got unsigned int [usertype] *
   drivers/gpu/drm/amd/amdgpu/amdgpu_debugfs.c:194:21: sparse: sparse: cast removes address space '<asn:1>' of expression
   drivers/gpu/drm/amd/amdgpu/amdgpu_debugfs.c:194:21: sparse: sparse: cast removes address space '<asn:1>' of expression
   drivers/gpu/drm/amd/amdgpu/amdgpu_debugfs.c:231:21: sparse: sparse: cast removes address space '<asn:1>' of expression
   drivers/gpu/drm/amd/amdgpu/amdgpu_debugfs.c:231:21: sparse: sparse: cast removes address space '<asn:1>' of expression
   drivers/gpu/drm/amd/amdgpu/amdgpu_debugfs.c:231:21: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void const volatile [noderef] <asn:1> * @@     got unsigned int [usertype] * @@
   drivers/gpu/drm/amd/amdgpu/amdgpu_debugfs.c:231:21: sparse:     expected void const volatile [noderef] <asn:1> *
   drivers/gpu/drm/amd/amdgpu/amdgpu_debugfs.c:231:21: sparse:     got unsigned int [usertype] *
   drivers/gpu/drm/amd/amdgpu/amdgpu_debugfs.c:231:21: sparse: sparse: cast removes address space '<asn:1>' of expression
   drivers/gpu/drm/amd/amdgpu/amdgpu_debugfs.c:231:21: sparse: sparse: cast removes address space '<asn:1>' of expression
   drivers/gpu/drm/amd/amdgpu/amdgpu_debugfs.c:231:21: sparse: sparse: incorrect type in argument 2 (different address spaces) @@     expected void [noderef] <asn:1> *ptr @@     got unsigned int [usertype] * @@
   drivers/gpu/drm/amd/amdgpu/amdgpu_debugfs.c:231:21: sparse:     expected void [noderef] <asn:1> *ptr
   drivers/gpu/drm/amd/amdgpu/amdgpu_debugfs.c:231:21: sparse:     got unsigned int [usertype] *
   drivers/gpu/drm/amd/amdgpu/amdgpu_debugfs.c:231:21: sparse: sparse: cast removes address space '<asn:1>' of expression
   drivers/gpu/drm/amd/amdgpu/amdgpu_debugfs.c:257:21: sparse: sparse: cast removes address space '<asn:1>' of expression
   drivers/gpu/drm/amd/amdgpu/amdgpu_debugfs.c:257:21: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void const volatile [noderef] <asn:1> * @@     got unsigned int [usertype] * @@
   drivers/gpu/drm/amd/amdgpu/amdgpu_debugfs.c:257:21: sparse:     expected void const volatile [noderef] <asn:1> *
   drivers/gpu/drm/amd/amdgpu/amdgpu_debugfs.c:257:21: sparse:     got unsigned int [usertype] *
   drivers/gpu/drm/amd/amdgpu/amdgpu_debugfs.c:257:21: sparse: sparse: cast removes address space '<asn:1>' of expression
   drivers/gpu/drm/amd/amdgpu/amdgpu_debugfs.c:257:21: sparse: sparse: cast removes address space '<asn:1>' of expression
   drivers/gpu/drm/amd/amdgpu/amdgpu_debugfs.c:257:21: sparse: sparse: incorrect type in argument 2 (different address spaces) @@     expected void const [noderef] <asn:1> *ptr @@     got unsigned int [usertype] * @@
   drivers/gpu/drm/amd/amdgpu/amdgpu_debugfs.c:257:21: sparse:     expected void const [noderef] <asn:1> *ptr
   drivers/gpu/drm/amd/amdgpu/amdgpu_debugfs.c:257:21: sparse:     got unsigned int [usertype] *
   drivers/gpu/drm/amd/amdgpu/amdgpu_debugfs.c:257:21: sparse: sparse: cast removes address space '<asn:1>' of expression
   drivers/gpu/drm/amd/amdgpu/amdgpu_debugfs.c:257:21: sparse: sparse: cast removes address space '<asn:1>' of expression
   drivers/gpu/drm/amd/amdgpu/amdgpu_debugfs.c:257:21: sparse: sparse: cast removes address space '<asn:1>' of expression
   drivers/gpu/drm/amd/amdgpu/amdgpu_debugfs.c:257:21: sparse: sparse: incorrect type in argument 2 (different address spaces) @@     expected void const [noderef] <asn:1> *ptr @@     got unsigned int [usertype] * @@
   drivers/gpu/drm/amd/amdgpu/amdgpu_debugfs.c:257:21: sparse:     expected void const [noderef] <asn:1> *ptr
   drivers/gpu/drm/amd/amdgpu/amdgpu_debugfs.c:257:21: sparse:     got unsigned int [usertype] *
   drivers/gpu/drm/amd/amdgpu/amdgpu_debugfs.c:257:21: sparse: sparse: cast removes address space '<asn:1>' of expression
   drivers/gpu/drm/amd/amdgpu/amdgpu_debugfs.c:257:21: sparse: sparse: cast removes address space '<asn:1>' of expression
   drivers/gpu/drm/amd/amdgpu/amdgpu_debugfs.c:257:21: sparse: sparse: cast removes address space '<asn:1>' of expression
   drivers/gpu/drm/amd/amdgpu/amdgpu_debugfs.c:257:21: sparse: sparse: incorrect type in argument 2 (different address spaces) @@     expected void const [noderef] <asn:1> *ptr @@     got unsigned int [usertype] * @@
   drivers/gpu/drm/amd/amdgpu/amdgpu_debugfs.c:257:21: sparse:     expected void const [noderef] <asn:1> *ptr
   drivers/gpu/drm/amd/amdgpu/amdgpu_debugfs.c:257:21: sparse:     got unsigned int [usertype] *
   drivers/gpu/drm/amd/amdgpu/amdgpu_debugfs.c:257:21: sparse: sparse: cast removes address space '<asn:1>' of expression
   drivers/gpu/drm/amd/amdgpu/amdgpu_debugfs.c:257:21: sparse: sparse: cast removes address space '<asn:1>' of expression
   drivers/gpu/drm/amd/amdgpu/amdgpu_debugfs.c:257:21: sparse: sparse: cast removes address space '<asn:1>' of expression
   drivers/gpu/drm/amd/amdgpu/amdgpu_debugfs.c:257:21: sparse: sparse: incorrect type in argument 2 (different address spaces) @@     expected void const [noderef] <asn:1> *ptr @@     got unsigned int [usertype] * @@
   drivers/gpu/drm/amd/amdgpu/amdgpu_debugfs.c:257:21: sparse:     expected void const [noderef] <asn:1> *ptr
   drivers/gpu/drm/amd/amdgpu/amdgpu_debugfs.c:257:21: sparse:     got unsigned int [usertype] *
   drivers/gpu/drm/amd/amdgpu/amdgpu_debugfs.c:257:21: sparse: sparse: cast removes address space '<asn:1>' of expression
   drivers/gpu/drm/amd/amdgpu/amdgpu_debugfs.c:257:21: sparse: sparse: cast removes address space '<asn:1>' of expression
   drivers/gpu/drm/amd/amdgpu/amdgpu_debugfs.c:286:21: sparse: sparse: cast removes address space '<asn:1>' of expression
   drivers/gpu/drm/amd/amdgpu/amdgpu_debugfs.c:286:21: sparse: sparse: cast removes address space '<asn:1>' of expression
   drivers/gpu/drm/amd/amdgpu/amdgpu_debugfs.c:286:21: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void const volatile [noderef] <asn:1> * @@     got unsigned int [usertype] * @@
   drivers/gpu/drm/amd/amdgpu/amdgpu_debugfs.c:286:21: sparse:     expected void const volatile [noderef] <asn:1> *
   drivers/gpu/drm/amd/amdgpu/amdgpu_debugfs.c:286:21: sparse:     got unsigned int [usertype] *
   drivers/gpu/drm/amd/amdgpu/amdgpu_debugfs.c:286:21: sparse: sparse: cast removes address space '<asn:1>' of expression
   drivers/gpu/drm/amd/amdgpu/amdgpu_debugfs.c:286:21: sparse: sparse: cast removes address space '<asn:1>' of expression
   drivers/gpu/drm/amd/amdgpu/amdgpu_debugfs.c:286:21: sparse: sparse: incorrect type in argument 2 (different address spaces) @@     expected void [noderef] <asn:1> *ptr @@     got unsigned int [usertype] * @@
   drivers/gpu/drm/amd/amdgpu/amdgpu_debugfs.c:286:21: sparse:     expected void [noderef] <asn:1> *ptr
   drivers/gpu/drm/amd/amdgpu/amdgpu_debugfs.c:286:21: sparse:     got unsigned int [usertype] *
   drivers/gpu/drm/amd/amdgpu/amdgpu_debugfs.c:286:21: sparse: sparse: cast removes address space '<asn:1>' of expression
   drivers/gpu/drm/amd/amdgpu/amdgpu_debugfs.c:312:21: sparse: sparse: cast removes address space '<asn:1>' of expression
   drivers/gpu/drm/amd/amdgpu/amdgpu_debugfs.c:312:21: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void const volatile [noderef] <asn:1> * @@     got unsigned int [usertype] * @@
   drivers/gpu/drm/amd/amdgpu/amdgpu_debugfs.c:312:21: sparse:     expected void const volatile [noderef] <asn:1> *
   drivers/gpu/drm/amd/amdgpu/amdgpu_debugfs.c:312:21: sparse:     got unsigned int [usertype] *
   drivers/gpu/drm/amd/amdgpu/amdgpu_debugfs.c:312:21: sparse: sparse: cast removes address space '<asn:1>' of expression
   drivers/gpu/drm/amd/amdgpu/amdgpu_debugfs.c:312:21: sparse: sparse: cast removes address space '<asn:1>' of expression
   drivers/gpu/drm/amd/amdgpu/amdgpu_debugfs.c:312:21: sparse: sparse: incorrect type in argument 2 (different address spaces) @@     expected void const [noderef] <asn:1> *ptr @@     got unsigned int [usertype] * @@
   drivers/gpu/drm/amd/amdgpu/amdgpu_debugfs.c:312:21: sparse:     expected void const [noderef] <asn:1> *ptr
   drivers/gpu/drm/amd/amdgpu/amdgpu_debugfs.c:312:21: sparse:     got unsigned int [usertype] *
   drivers/gpu/drm/amd/amdgpu/amdgpu_debugfs.c:312:21: sparse: sparse: cast removes address space '<asn:1>' of expression
   drivers/gpu/drm/amd/amdgpu/amdgpu_debugfs.c:312:21: sparse: sparse: cast removes address space '<asn:1>' of expression
   drivers/gpu/drm/amd/amdgpu/amdgpu_debugfs.c:312:21: sparse: sparse: cast removes address space '<asn:1>' of expression
   drivers/gpu/drm/amd/amdgpu/amdgpu_debugfs.c:312:21: sparse: sparse: incorrect type in argument 2 (different address spaces) @@     expected void const [noderef] <asn:1> *ptr @@     got unsigned int [usertype] * @@
   drivers/gpu/drm/amd/amdgpu/amdgpu_debugfs.c:312:21: sparse:     expected void const [noderef] <asn:1> *ptr
   drivers/gpu/drm/amd/amdgpu/amdgpu_debugfs.c:312:21: sparse:     got unsigned int [usertype] *
   drivers/gpu/drm/amd/amdgpu/amdgpu_debugfs.c:312:21: sparse: sparse: cast removes address space '<asn:1>' of expression
   drivers/gpu/drm/amd/amdgpu/amdgpu_debugfs.c:312:21: sparse: sparse: cast removes address space '<asn:1>' of expression
   drivers/gpu/drm/amd/amdgpu/amdgpu_debugfs.c:312:21: sparse: sparse: cast removes address space '<asn:1>' of expression
   drivers/gpu/drm/amd/amdgpu/amdgpu_debugfs.c:312:21: sparse: sparse: incorrect type in argument 2 (different address spaces) @@     expected void const [noderef] <asn:1> *ptr @@     got unsigned int [usertype] * @@
   drivers/gpu/drm/amd/amdgpu/amdgpu_debugfs.c:312:21: sparse:     expected void const [noderef] <asn:1> *ptr
   drivers/gpu/drm/amd/amdgpu/amdgpu_debugfs.c:312:21: sparse:     got unsigned int [usertype] *
   drivers/gpu/drm/amd/amdgpu/amdgpu_debugfs.c:312:21: sparse: sparse: cast removes address space '<asn:1>' of expression
   drivers/gpu/drm/amd/amdgpu/amdgpu_debugfs.c:312:21: sparse: sparse: cast removes address space '<asn:1>' of expression
   drivers/gpu/drm/amd/amdgpu/amdgpu_debugfs.c:312:21: sparse: sparse: cast removes address space '<asn:1>' of expression
   drivers/gpu/drm/amd/amdgpu/amdgpu_debugfs.c:312:21: sparse: sparse: incorrect type in argument 2 (different address spaces) @@     expected void const [noderef] <asn:1> *ptr @@     got unsigned int [usertype] * @@
   drivers/gpu/drm/amd/amdgpu/amdgpu_debugfs.c:312:21: sparse:     expected void const [noderef] <asn:1> *ptr
   drivers/gpu/drm/amd/amdgpu/amdgpu_debugfs.c:312:21: sparse:     got unsigned int [usertype] *
   drivers/gpu/drm/amd/amdgpu/amdgpu_debugfs.c:312:21: sparse: sparse: cast removes address space '<asn:1>' of expression
   drivers/gpu/drm/amd/amdgpu/amdgpu_debugfs.c:312:21: sparse: sparse: cast removes address space '<asn:1>' of expression
   drivers/gpu/drm/amd/amdgpu/amdgpu_debugfs.c:341:21: sparse: sparse: cast removes address space '<asn:1>' of expression
   drivers/gpu/drm/amd/amdgpu/amdgpu_debugfs.c:341:21: sparse: sparse: cast removes address space '<asn:1>' of expression
   drivers/gpu/drm/amd/amdgpu/amdgpu_debugfs.c:341:21: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void const volatile [noderef] <asn:1> * @@     got unsigned int [usertype] * @@
   drivers/gpu/drm/amd/amdgpu/amdgpu_debugfs.c:341:21: sparse:     expected void const volatile [noderef] <asn:1> *
   drivers/gpu/drm/amd/amdgpu/amdgpu_debugfs.c:341:21: sparse:     got unsigned int [usertype] *
   drivers/gpu/drm/amd/amdgpu/amdgpu_debugfs.c:341:21: sparse: sparse: cast removes address space '<asn:1>' of expression
   drivers/gpu/drm/amd/amdgpu/amdgpu_debugfs.c:341:21: sparse: sparse: cast removes address space '<asn:1>' of expression
   drivers/gpu/drm/amd/amdgpu/amdgpu_debugfs.c:341:21: sparse: sparse: incorrect type in argument 2 (different address spaces) @@     expected void [noderef] <asn:1> *ptr @@     got unsigned int [usertype] * @@
   drivers/gpu/drm/amd/amdgpu/amdgpu_debugfs.c:341:21: sparse:     expected void [noderef] <asn:1> *ptr
   drivers/gpu/drm/amd/amdgpu/amdgpu_debugfs.c:341:21: sparse:     got unsigned int [usertype] *
   drivers/gpu/drm/amd/amdgpu/amdgpu_debugfs.c:341:21: sparse: sparse: cast removes address space '<asn:1>' of expression
   drivers/gpu/drm/amd/amdgpu/amdgpu_debugfs.c:367:21: sparse: sparse: cast removes address space '<asn:1>' of expression
   drivers/gpu/drm/amd/amdgpu/amdgpu_debugfs.c:367:21: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void const volatile [noderef] <asn:1> * @@     got unsigned int [usertype] * @@
   drivers/gpu/drm/amd/amdgpu/amdgpu_debugfs.c:367:21: sparse:     expected void const volatile [noderef] <asn:1> *
   drivers/gpu/drm/amd/amdgpu/amdgpu_debugfs.c:367:21: sparse:     got unsigned int [usertype] *
   drivers/gpu/drm/amd/amdgpu/amdgpu_debugfs.c:367:21: sparse: sparse: cast removes address space '<asn:1>' of expression

vim +119 drivers/gpu/drm/amd/amdgpu/amdgpu_debugfs.c

2376c1da325e9a Alex Deucher 2017-12-14   66  
2376c1da325e9a Alex Deucher 2017-12-14   67  static ssize_t amdgpu_debugfs_regs_read(struct file *f, char __user *buf,
2376c1da325e9a Alex Deucher 2017-12-14   68  					size_t size, loff_t *pos)
2376c1da325e9a Alex Deucher 2017-12-14   69  {
2376c1da325e9a Alex Deucher 2017-12-14   70  	struct amdgpu_device *adev = file_inode(f)->i_private;
2376c1da325e9a Alex Deucher 2017-12-14   71  	ssize_t result = 0;
2376c1da325e9a Alex Deucher 2017-12-14   72  	int r;
2376c1da325e9a Alex Deucher 2017-12-14   73  	bool pm_pg_lock, use_bank;
2376c1da325e9a Alex Deucher 2017-12-14   74  	unsigned instance_bank, sh_bank, se_bank;
2376c1da325e9a Alex Deucher 2017-12-14   75  
2376c1da325e9a Alex Deucher 2017-12-14   76  	if (size & 0x3 || *pos & 0x3)
2376c1da325e9a Alex Deucher 2017-12-14   77  		return -EINVAL;
2376c1da325e9a Alex Deucher 2017-12-14   78  
2376c1da325e9a Alex Deucher 2017-12-14   79  	/* are we reading registers for which a PG lock is necessary? */
2376c1da325e9a Alex Deucher 2017-12-14   80  	pm_pg_lock = (*pos >> 23) & 1;
2376c1da325e9a Alex Deucher 2017-12-14   81  
2376c1da325e9a Alex Deucher 2017-12-14   82  	if (*pos & (1ULL << 62)) {
2376c1da325e9a Alex Deucher 2017-12-14   83  		se_bank = (*pos & GENMASK_ULL(33, 24)) >> 24;
2376c1da325e9a Alex Deucher 2017-12-14   84  		sh_bank = (*pos & GENMASK_ULL(43, 34)) >> 34;
2376c1da325e9a Alex Deucher 2017-12-14   85  		instance_bank = (*pos & GENMASK_ULL(53, 44)) >> 44;
2376c1da325e9a Alex Deucher 2017-12-14   86  
2376c1da325e9a Alex Deucher 2017-12-14   87  		if (se_bank == 0x3FF)
2376c1da325e9a Alex Deucher 2017-12-14   88  			se_bank = 0xFFFFFFFF;
2376c1da325e9a Alex Deucher 2017-12-14   89  		if (sh_bank == 0x3FF)
2376c1da325e9a Alex Deucher 2017-12-14   90  			sh_bank = 0xFFFFFFFF;
2376c1da325e9a Alex Deucher 2017-12-14   91  		if (instance_bank == 0x3FF)
2376c1da325e9a Alex Deucher 2017-12-14   92  			instance_bank = 0xFFFFFFFF;
2376c1da325e9a Alex Deucher 2017-12-14   93  		use_bank = 1;
2376c1da325e9a Alex Deucher 2017-12-14   94  	} else {
2376c1da325e9a Alex Deucher 2017-12-14   95  		use_bank = 0;
2376c1da325e9a Alex Deucher 2017-12-14   96  	}
2376c1da325e9a Alex Deucher 2017-12-14   97  
2376c1da325e9a Alex Deucher 2017-12-14   98  	*pos &= (1UL << 22) - 1;
2376c1da325e9a Alex Deucher 2017-12-14   99  
2376c1da325e9a Alex Deucher 2017-12-14  100  	if (use_bank) {
2376c1da325e9a Alex Deucher 2017-12-14  101  		if ((sh_bank != 0xFFFFFFFF && sh_bank >= adev->gfx.config.max_sh_per_se) ||
2376c1da325e9a Alex Deucher 2017-12-14  102  		    (se_bank != 0xFFFFFFFF && se_bank >= adev->gfx.config.max_shader_engines))
2376c1da325e9a Alex Deucher 2017-12-14  103  			return -EINVAL;
2376c1da325e9a Alex Deucher 2017-12-14  104  		mutex_lock(&adev->grbm_idx_mutex);
2376c1da325e9a Alex Deucher 2017-12-14  105  		amdgpu_gfx_select_se_sh(adev, se_bank,
2376c1da325e9a Alex Deucher 2017-12-14  106  					sh_bank, instance_bank);
2376c1da325e9a Alex Deucher 2017-12-14  107  	}
2376c1da325e9a Alex Deucher 2017-12-14  108  
2376c1da325e9a Alex Deucher 2017-12-14  109  	if (pm_pg_lock)
2376c1da325e9a Alex Deucher 2017-12-14  110  		mutex_lock(&adev->pm.mutex);
2376c1da325e9a Alex Deucher 2017-12-14  111  
2376c1da325e9a Alex Deucher 2017-12-14  112  	while (size) {
2376c1da325e9a Alex Deucher 2017-12-14  113  		uint32_t value;
2376c1da325e9a Alex Deucher 2017-12-14  114  
2376c1da325e9a Alex Deucher 2017-12-14  115  		if (*pos > adev->rmmio_size)
2376c1da325e9a Alex Deucher 2017-12-14  116  			goto end;
2376c1da325e9a Alex Deucher 2017-12-14  117  
2376c1da325e9a Alex Deucher 2017-12-14  118  		value = RREG32(*pos >> 2);
2376c1da325e9a Alex Deucher 2017-12-14 @119  		r = put_user(value, (uint32_t *)buf);
2376c1da325e9a Alex Deucher 2017-12-14  120  		if (r) {
2376c1da325e9a Alex Deucher 2017-12-14  121  			result = r;
2376c1da325e9a Alex Deucher 2017-12-14  122  			goto end;
2376c1da325e9a Alex Deucher 2017-12-14  123  		}
2376c1da325e9a Alex Deucher 2017-12-14  124  
2376c1da325e9a Alex Deucher 2017-12-14  125  		result += 4;
2376c1da325e9a Alex Deucher 2017-12-14  126  		buf += 4;
2376c1da325e9a Alex Deucher 2017-12-14  127  		*pos += 4;
2376c1da325e9a Alex Deucher 2017-12-14  128  		size -= 4;
2376c1da325e9a Alex Deucher 2017-12-14  129  	}
2376c1da325e9a Alex Deucher 2017-12-14  130  
2376c1da325e9a Alex Deucher 2017-12-14  131  end:
2376c1da325e9a Alex Deucher 2017-12-14  132  	if (use_bank) {
2376c1da325e9a Alex Deucher 2017-12-14  133  		amdgpu_gfx_select_se_sh(adev, 0xffffffff, 0xffffffff, 0xffffffff);
2376c1da325e9a Alex Deucher 2017-12-14  134  		mutex_unlock(&adev->grbm_idx_mutex);
2376c1da325e9a Alex Deucher 2017-12-14  135  	}
2376c1da325e9a Alex Deucher 2017-12-14  136  
2376c1da325e9a Alex Deucher 2017-12-14  137  	if (pm_pg_lock)
2376c1da325e9a Alex Deucher 2017-12-14  138  		mutex_unlock(&adev->pm.mutex);
2376c1da325e9a Alex Deucher 2017-12-14  139  
2376c1da325e9a Alex Deucher 2017-12-14  140  	return result;
2376c1da325e9a Alex Deucher 2017-12-14  141  }
2376c1da325e9a Alex Deucher 2017-12-14  142  
2376c1da325e9a Alex Deucher 2017-12-14  143  static ssize_t amdgpu_debugfs_regs_write(struct file *f, const char __user *buf,
2376c1da325e9a Alex Deucher 2017-12-14  144  					 size_t size, loff_t *pos)
2376c1da325e9a Alex Deucher 2017-12-14  145  {
2376c1da325e9a Alex Deucher 2017-12-14  146  	struct amdgpu_device *adev = file_inode(f)->i_private;
2376c1da325e9a Alex Deucher 2017-12-14  147  	ssize_t result = 0;
2376c1da325e9a Alex Deucher 2017-12-14  148  	int r;
2376c1da325e9a Alex Deucher 2017-12-14  149  	bool pm_pg_lock, use_bank;
2376c1da325e9a Alex Deucher 2017-12-14  150  	unsigned instance_bank, sh_bank, se_bank;
2376c1da325e9a Alex Deucher 2017-12-14  151  
2376c1da325e9a Alex Deucher 2017-12-14  152  	if (size & 0x3 || *pos & 0x3)
2376c1da325e9a Alex Deucher 2017-12-14  153  		return -EINVAL;
2376c1da325e9a Alex Deucher 2017-12-14  154  
2376c1da325e9a Alex Deucher 2017-12-14  155  	/* are we reading registers for which a PG lock is necessary? */
2376c1da325e9a Alex Deucher 2017-12-14  156  	pm_pg_lock = (*pos >> 23) & 1;
2376c1da325e9a Alex Deucher 2017-12-14  157  
2376c1da325e9a Alex Deucher 2017-12-14  158  	if (*pos & (1ULL << 62)) {
2376c1da325e9a Alex Deucher 2017-12-14  159  		se_bank = (*pos & GENMASK_ULL(33, 24)) >> 24;
2376c1da325e9a Alex Deucher 2017-12-14  160  		sh_bank = (*pos & GENMASK_ULL(43, 34)) >> 34;
2376c1da325e9a Alex Deucher 2017-12-14  161  		instance_bank = (*pos & GENMASK_ULL(53, 44)) >> 44;
2376c1da325e9a Alex Deucher 2017-12-14  162  
2376c1da325e9a Alex Deucher 2017-12-14  163  		if (se_bank == 0x3FF)
2376c1da325e9a Alex Deucher 2017-12-14  164  			se_bank = 0xFFFFFFFF;
2376c1da325e9a Alex Deucher 2017-12-14  165  		if (sh_bank == 0x3FF)
2376c1da325e9a Alex Deucher 2017-12-14  166  			sh_bank = 0xFFFFFFFF;
2376c1da325e9a Alex Deucher 2017-12-14  167  		if (instance_bank == 0x3FF)
2376c1da325e9a Alex Deucher 2017-12-14  168  			instance_bank = 0xFFFFFFFF;
2376c1da325e9a Alex Deucher 2017-12-14  169  		use_bank = 1;
2376c1da325e9a Alex Deucher 2017-12-14  170  	} else {
2376c1da325e9a Alex Deucher 2017-12-14  171  		use_bank = 0;
2376c1da325e9a Alex Deucher 2017-12-14  172  	}
2376c1da325e9a Alex Deucher 2017-12-14  173  
2376c1da325e9a Alex Deucher 2017-12-14  174  	*pos &= (1UL << 22) - 1;
2376c1da325e9a Alex Deucher 2017-12-14  175  
2376c1da325e9a Alex Deucher 2017-12-14  176  	if (use_bank) {
2376c1da325e9a Alex Deucher 2017-12-14  177  		if ((sh_bank != 0xFFFFFFFF && sh_bank >= adev->gfx.config.max_sh_per_se) ||
2376c1da325e9a Alex Deucher 2017-12-14  178  		    (se_bank != 0xFFFFFFFF && se_bank >= adev->gfx.config.max_shader_engines))
2376c1da325e9a Alex Deucher 2017-12-14  179  			return -EINVAL;
2376c1da325e9a Alex Deucher 2017-12-14  180  		mutex_lock(&adev->grbm_idx_mutex);
2376c1da325e9a Alex Deucher 2017-12-14  181  		amdgpu_gfx_select_se_sh(adev, se_bank,
2376c1da325e9a Alex Deucher 2017-12-14  182  					sh_bank, instance_bank);
2376c1da325e9a Alex Deucher 2017-12-14  183  	}
2376c1da325e9a Alex Deucher 2017-12-14  184  
2376c1da325e9a Alex Deucher 2017-12-14  185  	if (pm_pg_lock)
2376c1da325e9a Alex Deucher 2017-12-14  186  		mutex_lock(&adev->pm.mutex);
2376c1da325e9a Alex Deucher 2017-12-14  187  
2376c1da325e9a Alex Deucher 2017-12-14  188  	while (size) {
2376c1da325e9a Alex Deucher 2017-12-14  189  		uint32_t value;
2376c1da325e9a Alex Deucher 2017-12-14  190  
2376c1da325e9a Alex Deucher 2017-12-14  191  		if (*pos > adev->rmmio_size)
2376c1da325e9a Alex Deucher 2017-12-14  192  			return result;
2376c1da325e9a Alex Deucher 2017-12-14  193  
2376c1da325e9a Alex Deucher 2017-12-14 @194  		r = get_user(value, (uint32_t *)buf);
2376c1da325e9a Alex Deucher 2017-12-14  195  		if (r)
2376c1da325e9a Alex Deucher 2017-12-14  196  			return r;
2376c1da325e9a Alex Deucher 2017-12-14  197  
2376c1da325e9a Alex Deucher 2017-12-14  198  		WREG32(*pos >> 2, value);
2376c1da325e9a Alex Deucher 2017-12-14  199  
2376c1da325e9a Alex Deucher 2017-12-14  200  		result += 4;
2376c1da325e9a Alex Deucher 2017-12-14  201  		buf += 4;
2376c1da325e9a Alex Deucher 2017-12-14  202  		*pos += 4;
2376c1da325e9a Alex Deucher 2017-12-14  203  		size -= 4;
2376c1da325e9a Alex Deucher 2017-12-14  204  	}
2376c1da325e9a Alex Deucher 2017-12-14  205  
2376c1da325e9a Alex Deucher 2017-12-14  206  	if (use_bank) {
2376c1da325e9a Alex Deucher 2017-12-14  207  		amdgpu_gfx_select_se_sh(adev, 0xffffffff, 0xffffffff, 0xffffffff);
2376c1da325e9a Alex Deucher 2017-12-14  208  		mutex_unlock(&adev->grbm_idx_mutex);
2376c1da325e9a Alex Deucher 2017-12-14  209  	}
2376c1da325e9a Alex Deucher 2017-12-14  210  
2376c1da325e9a Alex Deucher 2017-12-14  211  	if (pm_pg_lock)
2376c1da325e9a Alex Deucher 2017-12-14  212  		mutex_unlock(&adev->pm.mutex);
2376c1da325e9a Alex Deucher 2017-12-14  213  
2376c1da325e9a Alex Deucher 2017-12-14  214  	return result;
2376c1da325e9a Alex Deucher 2017-12-14  215  }
2376c1da325e9a Alex Deucher 2017-12-14  216  

-- 
0-DAY CI Kernel Test Service
https://01.org/lkp

--QOsuMNdzeW434NVn
Content-Type: text/plain; charset=us-ascii
Content-Disposition: attachment; filename=config

#
# Automatically generated file; DO NOT EDIT.
# Linux/s390 4.14.56 Kernel Configuration
#
CONFIG_MMU=y
CONFIG_ZONE_DMA=y
CONFIG_CPU_BIG_ENDIAN=y
CONFIG_LOCKDEP_SUPPORT=y
CONFIG_STACKTRACE_SUPPORT=y
CONFIG_RWSEM_XCHGADD_ALGORITHM=y
# CONFIG_ARCH_HAS_ILOG2_U32 is not set
# CONFIG_ARCH_HAS_ILOG2_U64 is not set
CONFIG_GENERIC_HWEIGHT=y
CONFIG_GENERIC_BUG=y
CONFIG_GENERIC_BUG_RELATIVE_POINTERS=y
CONFIG_ARCH_DMA_ADDR_T_64BIT=y
CONFIG_ARCH_SUPPORTS_DEBUG_PAGEALLOC=y
CONFIG_KEXEC=y
CONFIG_AUDIT_ARCH=y
CONFIG_NO_IOPORT_MAP=y
# CONFIG_PCI_QUIRKS is not set
CONFIG_ARCH_SUPPORTS_UPROBES=y
CONFIG_S390=y
CONFIG_SCHED_OMIT_FRAME_POINTER=y
CONFIG_PGTABLE_LEVELS=5
CONFIG_DEFCONFIG_LIST="/lib/modules/$UNAME_RELEASE/.config"
CONFIG_CONSTRUCTORS=y
CONFIG_IRQ_WORK=y
CONFIG_BUILDTIME_EXTABLE_SORT=y
CONFIG_THREAD_INFO_IN_TASK=y

#
# General setup
#
CONFIG_INIT_ENV_ARG_LIMIT=32
CONFIG_CROSS_COMPILE=""
CONFIG_COMPILE_TEST=y
CONFIG_LOCALVERSION=""
CONFIG_HAVE_KERNEL_GZIP=y
CONFIG_HAVE_KERNEL_BZIP2=y
CONFIG_HAVE_KERNEL_LZMA=y
CONFIG_HAVE_KERNEL_XZ=y
CONFIG_HAVE_KERNEL_LZO=y
CONFIG_HAVE_KERNEL_LZ4=y
# CONFIG_KERNEL_GZIP is not set
CONFIG_KERNEL_BZIP2=y
# CONFIG_KERNEL_LZMA is not set
# CONFIG_KERNEL_XZ is not set
# CONFIG_KERNEL_LZO is not set
# CONFIG_KERNEL_LZ4 is not set
CONFIG_DEFAULT_HOSTNAME="(none)"
# CONFIG_SWAP is not set
# CONFIG_SYSVIPC is not set
# CONFIG_CROSS_MEMORY_ATTACH is not set
CONFIG_FHANDLE=y
# CONFIG_USELIB is not set
CONFIG_HAVE_ARCH_AUDITSYSCALL=y

#
# IRQ subsystem
#
CONFIG_GENERIC_IRQ_CHIP=y
CONFIG_IRQ_DOMAIN=y
CONFIG_IRQ_SIM=y
CONFIG_GENERIC_MSI_IRQ=y
# CONFIG_IRQ_DOMAIN_DEBUG is not set
CONFIG_SPARSE_IRQ=y
CONFIG_GENERIC_IRQ_DEBUGFS=y
CONFIG_GENERIC_TIME_VSYSCALL=y
CONFIG_GENERIC_CLOCKEVENTS=y

#
# Timers subsystem
#
CONFIG_TICK_ONESHOT=y
CONFIG_HZ_PERIODIC=y
# CONFIG_NO_HZ_IDLE is not set
# CONFIG_NO_HZ is not set
CONFIG_HIGH_RES_TIMERS=y

#
# CPU/Task time and stats accounting
#
CONFIG_VIRT_CPU_ACCOUNTING=y
CONFIG_VIRT_CPU_ACCOUNTING_NATIVE=y

#
# RCU Subsystem
#
CONFIG_TREE_RCU=y
CONFIG_RCU_EXPERT=y
CONFIG_SRCU=y
CONFIG_TREE_SRCU=y
CONFIG_TASKS_RCU=y
CONFIG_RCU_STALL_COMMON=y
CONFIG_RCU_NEED_SEGCBLIST=y
CONFIG_RCU_FANOUT=64
CONFIG_RCU_FANOUT_LEAF=16
# CONFIG_RCU_NOCB_CPU is not set
CONFIG_BUILD_BIN2C=y
CONFIG_IKCONFIG=y
# CONFIG_IKCONFIG_PROC is not set
CONFIG_ARCH_SUPPORTS_NUMA_BALANCING=y
CONFIG_CGROUPS=y
CONFIG_PAGE_COUNTER=y
CONFIG_MEMCG=y
CONFIG_BLK_CGROUP=y
# CONFIG_DEBUG_BLK_CGROUP is not set
CONFIG_CGROUP_WRITEBACK=y
CONFIG_CGROUP_SCHED=y
# CONFIG_FAIR_GROUP_SCHED is not set
CONFIG_RT_GROUP_SCHED=y
CONFIG_CGROUP_PIDS=y
# CONFIG_CGROUP_RDMA is not set
CONFIG_CGROUP_FREEZER=y
# CONFIG_CGROUP_HUGETLB is not set
CONFIG_CPUSETS=y
CONFIG_PROC_PID_CPUSET=y
# CONFIG_CGROUP_DEVICE is not set
# CONFIG_CGROUP_CPUACCT is not set
CONFIG_CGROUP_BPF=y
CONFIG_CGROUP_DEBUG=y
CONFIG_SOCK_CGROUP_DATA=y
CONFIG_CHECKPOINT_RESTORE=y
# CONFIG_SCHED_AUTOGROUP is not set
CONFIG_SYSFS_DEPRECATED=y
CONFIG_SYSFS_DEPRECATED_V2=y
# CONFIG_RELAY is not set
CONFIG_BLK_DEV_INITRD=y
CONFIG_INITRAMFS_SOURCE=""
CONFIG_RD_GZIP=y
# CONFIG_RD_BZIP2 is not set
# CONFIG_RD_LZMA is not set
CONFIG_RD_XZ=y
# CONFIG_RD_LZO is not set
# CONFIG_RD_LZ4 is not set
# CONFIG_CC_OPTIMIZE_FOR_PERFORMANCE is not set
CONFIG_CC_OPTIMIZE_FOR_SIZE=y
CONFIG_ANON_INODES=y
CONFIG_SYSCTL_EXCEPTION_TRACE=y
CONFIG_BPF=y
CONFIG_EXPERT=y
# CONFIG_MULTIUSER is not set
# CONFIG_SGETMASK_SYSCALL is not set
CONFIG_SYSFS_SYSCALL=y
CONFIG_POSIX_TIMERS=y
CONFIG_KALLSYMS=y
CONFIG_KALLSYMS_ALL=y
# CONFIG_KALLSYMS_ABSOLUTE_PERCPU is not set
CONFIG_KALLSYMS_BASE_RELATIVE=y
# CONFIG_PRINTK is not set
CONFIG_BUG=y
CONFIG_BASE_FULL=y
CONFIG_FUTEX=y
CONFIG_FUTEX_PI=y
CONFIG_HAVE_FUTEX_CMPXCHG=y
# CONFIG_EPOLL is not set
CONFIG_SIGNALFD=y
CONFIG_TIMERFD=y
CONFIG_EVENTFD=y
CONFIG_BPF_SYSCALL=y
# CONFIG_SHMEM is not set
CONFIG_AIO=y
# CONFIG_ADVISE_SYSCALLS is not set
CONFIG_USERFAULTFD=y
CONFIG_MEMBARRIER=y
CONFIG_EMBEDDED=y
CONFIG_HAVE_PERF_EVENTS=y
CONFIG_PC104=y

#
# Kernel Performance Events And Counters
#
# CONFIG_PERF_EVENTS is not set
# CONFIG_VM_EVENT_COUNTERS is not set
CONFIG_COMPAT_BRK=y
# CONFIG_SLAB is not set
# CONFIG_SLUB is not set
CONFIG_SLOB=y
CONFIG_SLAB_MERGE_DEFAULT=y
# CONFIG_SYSTEM_DATA_VERIFICATION is not set
CONFIG_PROFILING=y
CONFIG_TRACEPOINTS=y
CONFIG_CRASH_CORE=y
CONFIG_KEXEC_CORE=y
# CONFIG_OPROFILE is not set
CONFIG_HAVE_OPROFILE=y
# CONFIG_JUMP_LABEL is not set
# CONFIG_UPROBES is not set
# CONFIG_HAVE_64BIT_ALIGNED_ACCESS is not set
CONFIG_HAVE_EFFICIENT_UNALIGNED_ACCESS=y
CONFIG_ARCH_USE_BUILTIN_BSWAP=y
CONFIG_HAVE_KPROBES=y
CONFIG_HAVE_KRETPROBES=y
CONFIG_HAVE_NMI=y
CONFIG_HAVE_ARCH_TRACEHOOK=y
CONFIG_HAVE_DMA_CONTIGUOUS=y
CONFIG_GENERIC_SMP_IDLE_THREAD=y
CONFIG_ARCH_HAS_SET_MEMORY=y
CONFIG_ARCH_WANTS_DYNAMIC_TASK_STRUCT=y
CONFIG_HAVE_REGS_AND_STACK_ACCESS_API=y
CONFIG_HAVE_DMA_API_DEBUG=y
CONFIG_HAVE_ARCH_JUMP_LABEL=y
CONFIG_ARCH_HAVE_NMI_SAFE_CMPXCHG=y
CONFIG_HAVE_CMPXCHG_LOCAL=y
CONFIG_HAVE_CMPXCHG_DOUBLE=y
CONFIG_ARCH_WANT_IPC_PARSE_VERSION=y
CONFIG_HAVE_ARCH_SECCOMP_FILTER=y
# CONFIG_CC_STACKPROTECTOR is not set
CONFIG_THIN_ARCHIVES=y
CONFIG_HAVE_VIRT_CPU_ACCOUNTING=y
CONFIG_ARCH_HAS_SCALED_CPUTIME=y
CONFIG_HAVE_VIRT_CPU_ACCOUNTING_GEN=y
CONFIG_HAVE_ARCH_TRANSPARENT_HUGEPAGE=y
CONFIG_HAVE_ARCH_SOFT_DIRTY=y
CONFIG_HAVE_MOD_ARCH_SPECIFIC=y
CONFIG_MODULES_USE_ELF_RELA=y
CONFIG_ARCH_HAS_ELF_RANDOMIZE=y
CONFIG_HAVE_EXIT_THREAD=y
CONFIG_HAVE_COPY_THREAD_TLS=y
# CONFIG_HAVE_ARCH_HASH is not set
# CONFIG_ISA_BUS_API is not set
CONFIG_CLONE_BACKWARDS2=y
CONFIG_OLD_SIGSUSPEND3=y
CONFIG_OLD_SIGACTION=y
# CONFIG_CPU_NO_EFFICIENT_FFS is not set
# CONFIG_HAVE_ARCH_VMAP_STACK is not set
# CONFIG_ARCH_OPTIONAL_KERNEL_RWX is not set
# CONFIG_ARCH_OPTIONAL_KERNEL_RWX_DEFAULT is not set
CONFIG_ARCH_HAS_STRICT_KERNEL_RWX=y
CONFIG_STRICT_KERNEL_RWX=y
CONFIG_ARCH_HAS_STRICT_MODULE_RWX=y
# CONFIG_REFCOUNT_FULL is not set

#
# GCOV-based kernel profiling
#
CONFIG_GCOV_KERNEL=y
CONFIG_ARCH_HAS_GCOV_PROFILE_ALL=y
CONFIG_GCOV_FORMAT_AUTODETECT=y
# CONFIG_GCOV_FORMAT_3_4 is not set
# CONFIG_GCOV_FORMAT_4_7 is not set
# CONFIG_HAVE_GENERIC_DMA_COHERENT is not set
CONFIG_RT_MUTEXES=y
CONFIG_BASE_SMALL=0
# CONFIG_MODULES is not set
CONFIG_MODULES_TREE_LOOKUP=y
CONFIG_BLOCK=y
CONFIG_BLK_SCSI_REQUEST=y
CONFIG_BLK_DEV_BSG=y
CONFIG_BLK_DEV_BSGLIB=y
# CONFIG_BLK_DEV_INTEGRITY is not set
# CONFIG_BLK_DEV_ZONED is not set
# CONFIG_BLK_DEV_THROTTLING is not set
# CONFIG_BLK_CMDLINE_PARSER is not set
# CONFIG_BLK_WBT is not set
CONFIG_BLK_DEBUG_FS=y
# CONFIG_BLK_SED_OPAL is not set

#
# Partition Types
#
CONFIG_PARTITION_ADVANCED=y
CONFIG_ACORN_PARTITION=y
CONFIG_ACORN_PARTITION_CUMANA=y
CONFIG_ACORN_PARTITION_EESOX=y
CONFIG_ACORN_PARTITION_ICS=y
CONFIG_ACORN_PARTITION_ADFS=y
# CONFIG_ACORN_PARTITION_POWERTEC is not set
CONFIG_ACORN_PARTITION_RISCIX=y
CONFIG_AIX_PARTITION=y
CONFIG_OSF_PARTITION=y
# CONFIG_AMIGA_PARTITION is not set
CONFIG_ATARI_PARTITION=y
CONFIG_IBM_PARTITION=y
# CONFIG_MAC_PARTITION is not set
# CONFIG_MSDOS_PARTITION is not set
# CONFIG_LDM_PARTITION is not set
CONFIG_SGI_PARTITION=y
# CONFIG_ULTRIX_PARTITION is not set
# CONFIG_SUN_PARTITION is not set
CONFIG_KARMA_PARTITION=y
# CONFIG_EFI_PARTITION is not set
CONFIG_SYSV68_PARTITION=y
# CONFIG_CMDLINE_PARTITION is not set
CONFIG_BLK_MQ_PCI=y
CONFIG_BLK_MQ_VIRTIO=y

#
# IO Schedulers
#
CONFIG_IOSCHED_NOOP=y
CONFIG_IOSCHED_DEADLINE=y
CONFIG_IOSCHED_CFQ=y
# CONFIG_CFQ_GROUP_IOSCHED is not set
# CONFIG_DEFAULT_DEADLINE is not set
CONFIG_DEFAULT_CFQ=y
# CONFIG_DEFAULT_NOOP is not set
CONFIG_DEFAULT_IOSCHED="cfq"
# CONFIG_MQ_IOSCHED_DEADLINE is not set
CONFIG_MQ_IOSCHED_KYBER=y
CONFIG_IOSCHED_BFQ=y
CONFIG_BFQ_GROUP_IOSCHED=y
CONFIG_ASN1=y
CONFIG_ARCH_INLINE_SPIN_TRYLOCK=y
CONFIG_ARCH_INLINE_SPIN_TRYLOCK_BH=y
CONFIG_ARCH_INLINE_SPIN_LOCK=y
CONFIG_ARCH_INLINE_SPIN_LOCK_BH=y
CONFIG_ARCH_INLINE_SPIN_LOCK_IRQ=y
CONFIG_ARCH_INLINE_SPIN_LOCK_IRQSAVE=y
CONFIG_ARCH_INLINE_SPIN_UNLOCK=y
CONFIG_ARCH_INLINE_SPIN_UNLOCK_BH=y
CONFIG_ARCH_INLINE_SPIN_UNLOCK_IRQ=y
CONFIG_ARCH_INLINE_SPIN_UNLOCK_IRQRESTORE=y
CONFIG_ARCH_INLINE_READ_TRYLOCK=y
CONFIG_ARCH_INLINE_READ_LOCK=y
CONFIG_ARCH_INLINE_READ_LOCK_BH=y
CONFIG_ARCH_INLINE_READ_LOCK_IRQ=y
CONFIG_ARCH_INLINE_READ_LOCK_IRQSAVE=y
CONFIG_ARCH_INLINE_READ_UNLOCK=y
CONFIG_ARCH_INLINE_READ_UNLOCK_BH=y
CONFIG_ARCH_INLINE_READ_UNLOCK_IRQ=y
CONFIG_ARCH_INLINE_READ_UNLOCK_IRQRESTORE=y
CONFIG_ARCH_INLINE_WRITE_TRYLOCK=y
CONFIG_ARCH_INLINE_WRITE_LOCK=y
CONFIG_ARCH_INLINE_WRITE_LOCK_BH=y
CONFIG_ARCH_INLINE_WRITE_LOCK_IRQ=y
CONFIG_ARCH_INLINE_WRITE_LOCK_IRQSAVE=y
CONFIG_ARCH_INLINE_WRITE_UNLOCK=y
CONFIG_ARCH_INLINE_WRITE_UNLOCK_BH=y
CONFIG_ARCH_INLINE_WRITE_UNLOCK_IRQ=y
CONFIG_ARCH_INLINE_WRITE_UNLOCK_IRQRESTORE=y
CONFIG_UNINLINE_SPIN_UNLOCK=y
CONFIG_ARCH_SUPPORTS_ATOMIC_RMW=y
CONFIG_MUTEX_SPIN_ON_OWNER=y
CONFIG_RWSEM_SPIN_ON_OWNER=y
CONFIG_LOCK_SPIN_ON_OWNER=y
CONFIG_FREEZER=y
CONFIG_HAVE_LIVEPATCH=y

#
# Processor type and features
#
CONFIG_HAVE_MARCH_Z900_FEATURES=y
CONFIG_HAVE_MARCH_Z990_FEATURES=y
CONFIG_HAVE_MARCH_Z9_109_FEATURES=y
CONFIG_HAVE_MARCH_Z10_FEATURES=y
CONFIG_HAVE_MARCH_Z196_FEATURES=y
# CONFIG_HAVE_MARCH_ZEC12_FEATURES is not set
# CONFIG_HAVE_MARCH_Z13_FEATURES is not set
# CONFIG_HAVE_MARCH_Z14_FEATURES is not set
# CONFIG_MARCH_Z900 is not set
# CONFIG_MARCH_Z990 is not set
# CONFIG_MARCH_Z9_109 is not set
# CONFIG_MARCH_Z10 is not set
CONFIG_MARCH_Z196=y
# CONFIG_MARCH_ZEC12 is not set
# CONFIG_MARCH_Z13 is not set
# CONFIG_MARCH_Z14 is not set
# CONFIG_MARCH_Z900_TUNE is not set
# CONFIG_MARCH_Z990_TUNE is not set
# CONFIG_MARCH_Z9_109_TUNE is not set
# CONFIG_MARCH_Z10_TUNE is not set
# CONFIG_MARCH_Z196_TUNE is not set
# CONFIG_MARCH_ZEC12_TUNE is not set
# CONFIG_MARCH_Z13_TUNE is not set
CONFIG_MARCH_Z14_TUNE=y
# CONFIG_TUNE_DEFAULT is not set
# CONFIG_TUNE_Z900 is not set
# CONFIG_TUNE_Z990 is not set
# CONFIG_TUNE_Z9_109 is not set
# CONFIG_TUNE_Z10 is not set
# CONFIG_TUNE_Z196 is not set
# CONFIG_TUNE_ZEC12 is not set
# CONFIG_TUNE_Z13 is not set
CONFIG_TUNE_Z14=y
CONFIG_64BIT=y
CONFIG_SMP=y
CONFIG_NR_CPUS=64
CONFIG_HOTPLUG_CPU=y
# CONFIG_NODES_SPAN_OTHER_NODES is not set
# CONFIG_NUMA is not set
CONFIG_SCHED_SMT=y
CONFIG_SCHED_MC=y
CONFIG_SCHED_BOOK=y
CONFIG_SCHED_DRAWER=y
CONFIG_SCHED_TOPOLOGY=y
CONFIG_PREEMPT_NONE=y
# CONFIG_PREEMPT_VOLUNTARY is not set
# CONFIG_PREEMPT is not set
CONFIG_HZ_100=y
# CONFIG_HZ_250 is not set
# CONFIG_HZ_300 is not set
# CONFIG_HZ_1000 is not set
CONFIG_HZ=100
CONFIG_SCHED_HRTICK=y
CONFIG_ARCH_RANDOM=y
CONFIG_KERNEL_NOBP=y
CONFIG_EXPOLINE=y
CONFIG_EXPOLINE_OFF=y
# CONFIG_EXPOLINE_AUTO is not set
# CONFIG_EXPOLINE_FULL is not set

#
# Memory setup
#
CONFIG_ARCH_SPARSEMEM_ENABLE=y
CONFIG_ARCH_SPARSEMEM_DEFAULT=y
CONFIG_ARCH_SELECT_MEMORY_MODEL=y
CONFIG_ARCH_ENABLE_MEMORY_HOTPLUG=y
CONFIG_ARCH_ENABLE_MEMORY_HOTREMOVE=y
CONFIG_ARCH_ENABLE_SPLIT_PMD_PTLOCK=y
CONFIG_FORCE_MAX_ZONEORDER=9
CONFIG_SELECT_MEMORY_MODEL=y
CONFIG_SPARSEMEM_MANUAL=y
CONFIG_SPARSEMEM=y
CONFIG_HAVE_MEMORY_PRESENT=y
CONFIG_SPARSEMEM_EXTREME=y
CONFIG_SPARSEMEM_VMEMMAP_ENABLE=y
CONFIG_SPARSEMEM_VMEMMAP=y
CONFIG_HAVE_MEMBLOCK=y
CONFIG_HAVE_MEMBLOCK_NODE_MAP=y
CONFIG_HAVE_MEMBLOCK_PHYS_MAP=y
CONFIG_NO_BOOTMEM=y
CONFIG_MEMORY_ISOLATION=y
# CONFIG_HAVE_BOOTMEM_INFO_NODE is not set
CONFIG_MEMORY_HOTPLUG=y
CONFIG_MEMORY_HOTPLUG_SPARSE=y
CONFIG_MEMORY_HOTPLUG_DEFAULT_ONLINE=y
# CONFIG_MEMORY_HOTREMOVE is not set
CONFIG_SPLIT_PTLOCK_CPUS=4
CONFIG_COMPACTION=y
CONFIG_MIGRATION=y
CONFIG_PHYS_ADDR_T_64BIT=y
CONFIG_BOUNCE=y
CONFIG_VIRT_TO_BUS=y
CONFIG_MMU_NOTIFIER=y
# CONFIG_KSM is not set
CONFIG_DEFAULT_MMAP_MIN_ADDR=4096
CONFIG_MMAP_NOEXEC_TAINT=1
CONFIG_TRANSPARENT_HUGEPAGE=y
CONFIG_TRANSPARENT_HUGEPAGE_ALWAYS=y
# CONFIG_TRANSPARENT_HUGEPAGE_MADVISE is not set
# CONFIG_ARCH_WANTS_THP_SWAP is not set
CONFIG_TRANSPARENT_HUGE_PAGECACHE=y
# CONFIG_CLEANCACHE is not set
CONFIG_CMA=y
CONFIG_CMA_DEBUG=y
# CONFIG_CMA_DEBUGFS is not set
CONFIG_CMA_AREAS=7
CONFIG_MEM_SOFT_DIRTY=y
# CONFIG_ZPOOL is not set
# CONFIG_ZBUD is not set
# CONFIG_ZSMALLOC is not set
CONFIG_ARCH_SUPPORTS_DEFERRED_STRUCT_PAGE_INIT=y
CONFIG_DEFERRED_STRUCT_PAGE_INIT=y
# CONFIG_IDLE_PAGE_TRACKING is not set
# CONFIG_LOW_MEM_NOTIFY is not set
CONFIG_PERCPU_STATS=y
CONFIG_MAX_PHYSMEM_BITS=46
CONFIG_PACK_STACK=y
CONFIG_CHECK_STACK=y
CONFIG_STACK_GUARD=256
# CONFIG_WARN_DYNAMIC_STACK is not set

#
# I/O subsystem
#
CONFIG_QDIO=y
CONFIG_PCI=y
CONFIG_PCI_NR_FUNCTIONS=512
# CONFIG_PCIEPORTBUS is not set
CONFIG_PCI_BUS_ADDR_T_64BIT=y
CONFIG_PCI_MSI=y
# CONFIG_PCI_MSI_IRQ_DOMAIN is not set
CONFIG_PCI_DEBUG=y
# CONFIG_PCI_REALLOC_ENABLE_AUTO is not set
CONFIG_PCI_STUB=y
CONFIG_PCI_ATS=y
CONFIG_PCI_IOV=y
CONFIG_PCI_PRI=y
# CONFIG_PCI_PASID is not set
CONFIG_HOTPLUG_PCI=y
# CONFIG_HOTPLUG_PCI_CPCI is not set
CONFIG_HOTPLUG_PCI_SHPC=y
CONFIG_HOTPLUG_PCI_S390=y

#
# DesignWare PCI Core Support
#

#
# PCI host controller drivers
#

#
# PCI Endpoint
#
# CONFIG_PCI_ENDPOINT is not set

#
# PCI switch controller drivers
#
CONFIG_PCI_SW_SWITCHTEC=y
CONFIG_PCI_DOMAINS=y
CONFIG_HAS_IOMEM=y
CONFIG_IOMMU_HELPER=y
CONFIG_NEED_SG_DMA_LENGTH=y
CONFIG_NEED_DMA_MAP_STATE=y
# CONFIG_CHSC_SCH is not set
# CONFIG_SCM_BUS is not set

#
# Dump support
#
# CONFIG_CRASH_DUMP is not set

#
# Executable file formats / Emulations
#
# CONFIG_BINFMT_ELF is not set
CONFIG_ARCH_BINFMT_ELF_STATE=y
# CONFIG_BINFMT_SCRIPT is not set
# CONFIG_HAVE_AOUT is not set
# CONFIG_BINFMT_MISC is not set
# CONFIG_COREDUMP is not set
# CONFIG_SECCOMP is not set

#
# Power Management
#
CONFIG_ARCH_HIBERNATION_POSSIBLE=y
# CONFIG_PM is not set
# CONFIG_NET is not set
CONFIG_HAVE_EBPF_JIT=y
# CONFIG_PCMCIA is not set
CONFIG_CCW=y

#
# Device Drivers
#

#
# Generic Driver Options
#
# CONFIG_UEVENT_HELPER is not set
CONFIG_DEVTMPFS=y
# CONFIG_DEVTMPFS_MOUNT is not set
# CONFIG_STANDALONE is not set
# CONFIG_PREVENT_FIRMWARE_BUILD is not set
CONFIG_FW_LOADER=y
CONFIG_FIRMWARE_IN_KERNEL=y
CONFIG_EXTRA_FIRMWARE=""
# CONFIG_FW_LOADER_USER_HELPER_FALLBACK is not set
CONFIG_WANT_DEV_COREDUMP=y
CONFIG_ALLOW_DEV_COREDUMP=y
CONFIG_DEV_COREDUMP=y
# CONFIG_DEBUG_DRIVER is not set
# CONFIG_DEBUG_DEVRES is not set
CONFIG_DEBUG_TEST_DRIVER_REMOVE=y
CONFIG_SYS_HYPERVISOR=y
# CONFIG_GENERIC_CPU_DEVICES is not set
CONFIG_GENERIC_CPU_AUTOPROBE=y
CONFIG_GENERIC_CPU_VULNERABILITIES=y
CONFIG_REGMAP=y
CONFIG_REGMAP_I2C=y
CONFIG_REGMAP_SPI=y
CONFIG_REGMAP_W1=y
CONFIG_REGMAP_MMIO=y
CONFIG_REGMAP_IRQ=y
CONFIG_DMA_SHARED_BUFFER=y
CONFIG_DMA_FENCE_TRACE=y
# CONFIG_DMA_CMA is not set

#
# Bus devices
#
# CONFIG_QCOM_EBI2 is not set
CONFIG_MTD=y
CONFIG_MTD_REDBOOT_PARTS=y
CONFIG_MTD_REDBOOT_DIRECTORY_BLOCK=-1
# CONFIG_MTD_REDBOOT_PARTS_UNALLOCATED is not set
# CONFIG_MTD_REDBOOT_PARTS_READONLY is not set
# CONFIG_MTD_CMDLINE_PARTS is not set
CONFIG_MTD_AR7_PARTS=y
# CONFIG_MTD_BCM63XX_PARTS is not set

#
# Partition parsers
#
# CONFIG_MTD_PARSER_TRX is not set

#
# User Modules And Translation Layers
#
CONFIG_MTD_BLKDEVS=y
# CONFIG_MTD_BLOCK is not set
CONFIG_MTD_BLOCK_RO=y
CONFIG_FTL=y
CONFIG_NFTL=y
# CONFIG_NFTL_RW is not set
CONFIG_INFTL=y
CONFIG_RFD_FTL=y
# CONFIG_SSFDC is not set
CONFIG_SM_FTL=y
# CONFIG_MTD_OOPS is not set
# CONFIG_MTD_PARTITIONED_MASTER is not set

#
# RAM/ROM/Flash chip drivers
#
CONFIG_MTD_CFI=y
CONFIG_MTD_JEDECPROBE=y
CONFIG_MTD_GEN_PROBE=y
CONFIG_MTD_CFI_ADV_OPTIONS=y
# CONFIG_MTD_CFI_NOSWAP is not set
# CONFIG_MTD_CFI_BE_BYTE_SWAP is not set
CONFIG_MTD_CFI_LE_BYTE_SWAP=y
# CONFIG_MTD_CFI_GEOMETRY is not set
CONFIG_MTD_MAP_BANK_WIDTH_1=y
CONFIG_MTD_MAP_BANK_WIDTH_2=y
CONFIG_MTD_MAP_BANK_WIDTH_4=y
# CONFIG_MTD_MAP_BANK_WIDTH_8 is not set
# CONFIG_MTD_MAP_BANK_WIDTH_16 is not set
# CONFIG_MTD_MAP_BANK_WIDTH_32 is not set
CONFIG_MTD_CFI_I1=y
CONFIG_MTD_CFI_I2=y
# CONFIG_MTD_CFI_I4 is not set
# CONFIG_MTD_CFI_I8 is not set
CONFIG_MTD_OTP=y
CONFIG_MTD_CFI_INTELEXT=y
CONFIG_MTD_CFI_AMDSTD=y
CONFIG_MTD_CFI_STAA=y
CONFIG_MTD_CFI_UTIL=y
CONFIG_MTD_RAM=y
CONFIG_MTD_ROM=y
CONFIG_MTD_ABSENT=y

#
# Mapping drivers for chip access
#
CONFIG_MTD_COMPLEX_MAPPINGS=y
CONFIG_MTD_PHYSMAP=y
# CONFIG_MTD_PHYSMAP_COMPAT is not set
# CONFIG_MTD_SC520CDP is not set
# CONFIG_MTD_NETSC520 is not set
# CONFIG_MTD_TS5500 is not set
# CONFIG_MTD_PCI is not set
# CONFIG_MTD_GPIO_ADDR is not set
CONFIG_MTD_INTEL_VR_NOR=y
# CONFIG_MTD_PLATRAM is not set
# CONFIG_MTD_LATCH_ADDR is not set

#
# Self-contained MTD device drivers
#
# CONFIG_MTD_PMC551 is not set
CONFIG_MTD_DATAFLASH=y
# CONFIG_MTD_DATAFLASH_WRITE_VERIFY is not set
CONFIG_MTD_DATAFLASH_OTP=y
CONFIG_MTD_MCHP23K256=y
# CONFIG_MTD_SST25L is not set
# CONFIG_MTD_SLRAM is not set
# CONFIG_MTD_PHRAM is not set
# CONFIG_MTD_MTDRAM is not set
CONFIG_MTD_BLOCK2MTD=y

#
# Disk-On-Chip Device Drivers
#
CONFIG_MTD_DOCG3=y
CONFIG_BCH_CONST_M=14
CONFIG_BCH_CONST_T=4
CONFIG_MTD_NAND_ECC=y
# CONFIG_MTD_NAND_ECC_SMC is not set
# CONFIG_MTD_NAND is not set
CONFIG_MTD_ONENAND=y
CONFIG_MTD_ONENAND_VERIFY_WRITE=y
CONFIG_MTD_ONENAND_GENERIC=y
# CONFIG_MTD_ONENAND_OTP is not set
# CONFIG_MTD_ONENAND_2X_PROGRAM is not set

#
# LPDDR & LPDDR2 PCM memory drivers
#
CONFIG_MTD_LPDDR=y
CONFIG_MTD_QINFO_PROBE=y
# CONFIG_MTD_SPI_NOR is not set
# CONFIG_MTD_UBI is not set
# CONFIG_OF is not set
CONFIG_PARPORT=y
# CONFIG_PARPORT_GSC is not set
CONFIG_PARPORT_AX88796=y
# CONFIG_PARPORT_1284 is not set
CONFIG_PARPORT_NOT_PC=y
# CONFIG_BLK_DEV is not set
CONFIG_NVME_CORE=y
CONFIG_BLK_DEV_NVME=y
CONFIG_NVME_FABRICS=y
CONFIG_NVME_FC=y
# CONFIG_NVME_TARGET is not set

#
# Misc devices
#
# CONFIG_SENSORS_LIS3LV02D is not set
CONFIG_AD525X_DPOT=y
# CONFIG_AD525X_DPOT_I2C is not set
CONFIG_AD525X_DPOT_SPI=y
CONFIG_DUMMY_IRQ=y
CONFIG_PHANTOM=y
# CONFIG_INTEL_MID_PTI is not set
# CONFIG_SGI_IOC4 is not set
# CONFIG_TIFM_CORE is not set
# CONFIG_ICS932S401 is not set
# CONFIG_ATMEL_SSC is not set
CONFIG_ENCLOSURE_SERVICES=y
CONFIG_HP_ILO=y
# CONFIG_QCOM_COINCELL is not set
# CONFIG_APDS9802ALS is not set
CONFIG_ISL29003=y
# CONFIG_ISL29020 is not set
CONFIG_SENSORS_TSL2550=y
CONFIG_SENSORS_BH1770=y
CONFIG_SENSORS_APDS990X=y
CONFIG_HMC6352=y
# CONFIG_DS1682 is not set
# CONFIG_TI_DAC7512 is not set
# CONFIG_PCH_PHUB is not set
# CONFIG_USB_SWITCH_FSA9480 is not set
CONFIG_LATTICE_ECP3_CONFIG=y
# CONFIG_SRAM is not set
# CONFIG_ASPEED_LPC_CTRL is not set
# CONFIG_ASPEED_LPC_SNOOP is not set
# CONFIG_PCI_ENDPOINT_TEST is not set
# CONFIG_MEMORY_STATE_TIME is not set
# CONFIG_C2PORT is not set

#
# EEPROM support
#
CONFIG_EEPROM_AT24=y
# CONFIG_EEPROM_AT25 is not set
CONFIG_EEPROM_LEGACY=y
CONFIG_EEPROM_MAX6875=y
CONFIG_EEPROM_93CX6=y
# CONFIG_EEPROM_93XX46 is not set
# CONFIG_EEPROM_IDT_89HPESX is not set
CONFIG_CB710_CORE=y
# CONFIG_CB710_DEBUG is not set
CONFIG_CB710_DEBUG_ASSUMPTIONS=y

#
# Texas Instruments shared transport line discipline
#
# CONFIG_SENSORS_LIS3_SPI is not set
# CONFIG_SENSORS_LIS3_I2C is not set

#
# Altera FPGA firmware download module
#
CONFIG_ALTERA_STAPL=y

#
# Intel MIC Bus Driver
#

#
# SCIF Bus Driver
#

#
# VOP Bus Driver
#

#
# Intel MIC Host Driver
#

#
# Intel MIC Card Driver
#

#
# SCIF Driver
#

#
# Intel MIC Coprocessor State Management (COSM) Drivers
#

#
# VOP Driver
#
CONFIG_GENWQE=y
CONFIG_GENWQE_PLATFORM_ERROR_RECOVERY=0
CONFIG_ECHO=y
# CONFIG_CXL_BASE is not set
# CONFIG_CXL_AFU_DRIVER_OPS is not set
# CONFIG_CXL_LIB is not set

#
# SCSI device support
#
CONFIG_SCSI_MOD=y
CONFIG_RAID_ATTRS=y
CONFIG_SCSI=y
CONFIG_SCSI_DMA=y
# CONFIG_SCSI_MQ_DEFAULT is not set
CONFIG_SCSI_PROC_FS=y

#
# SCSI support type (disk, tape, CD-ROM)
#
CONFIG_BLK_DEV_SD=y
# CONFIG_CHR_DEV_ST is not set
# CONFIG_CHR_DEV_OSST is not set
# CONFIG_BLK_DEV_SR is not set
CONFIG_CHR_DEV_SG=y
CONFIG_CHR_DEV_SCH=y
# CONFIG_SCSI_ENCLOSURE is not set
CONFIG_SCSI_CONSTANTS=y
CONFIG_SCSI_LOGGING=y
# CONFIG_SCSI_SCAN_ASYNC is not set

#
# SCSI Transports
#
# CONFIG_SCSI_SPI_ATTRS is not set
CONFIG_SCSI_SAS_ATTRS=y
# CONFIG_SCSI_SAS_LIBSAS is not set
# CONFIG_SCSI_SRP_ATTRS is not set
# CONFIG_SCSI_LOWLEVEL is not set
CONFIG_SCSI_DH=y
# CONFIG_SCSI_DH_RDAC is not set
CONFIG_SCSI_DH_HP_SW=y
CONFIG_SCSI_DH_EMC=y
# CONFIG_SCSI_DH_ALUA is not set
# CONFIG_SCSI_OSD_INITIATOR is not set
CONFIG_ATA=y
# CONFIG_ATA_NONSTANDARD is not set
# CONFIG_ATA_VERBOSE_ERROR is not set
CONFIG_SATA_PMP=y

#
# Controllers with non-SFF native interface
#
CONFIG_SATA_AHCI=y
# CONFIG_SATA_AHCI_PLATFORM is not set
# CONFIG_AHCI_IMX is not set
# CONFIG_SATA_GEMINI is not set
# CONFIG_SATA_INIC162X is not set
CONFIG_SATA_ACARD_AHCI=y
CONFIG_SATA_SIL24=y
CONFIG_ATA_SFF=y

#
# SFF controllers with custom DMA interface
#
CONFIG_PDC_ADMA=y
CONFIG_SATA_QSTOR=y
CONFIG_SATA_SX4=y
# CONFIG_ATA_BMDMA is not set

#
# PIO-only SFF controllers
#
CONFIG_PATA_CMD640_PCI=y
CONFIG_PATA_MPIIX=y
CONFIG_PATA_NS87410=y
CONFIG_PATA_OPTI=y
# CONFIG_PATA_PLATFORM is not set
# CONFIG_PATA_RZ1000 is not set

#
# Generic fallback / legacy drivers
#
# CONFIG_PATA_LEGACY is not set
CONFIG_MD=y
# CONFIG_BLK_DEV_MD is not set
# CONFIG_BCACHE is not set
CONFIG_BLK_DEV_DM_BUILTIN=y
CONFIG_BLK_DEV_DM=y
# CONFIG_DM_MQ_DEFAULT is not set
# CONFIG_DM_DEBUG is not set
CONFIG_DM_BUFIO=y
CONFIG_DM_DEBUG_BLOCK_MANAGER_LOCKING=y
# CONFIG_DM_DEBUG_BLOCK_STACK_TRACING is not set
CONFIG_DM_BIO_PRISON=y
CONFIG_DM_PERSISTENT_DATA=y
CONFIG_DM_CRYPT=y
CONFIG_DM_SNAPSHOT=y
CONFIG_DM_THIN_PROVISIONING=y
CONFIG_DM_CACHE=y
CONFIG_DM_CACHE_SMQ=y
CONFIG_DM_ERA=y
CONFIG_DM_MIRROR=y
# CONFIG_DM_RAID is not set
CONFIG_DM_ZERO=y
# CONFIG_DM_MULTIPATH is not set
CONFIG_DM_DELAY=y
CONFIG_DM_UEVENT=y
# CONFIG_DM_FLAKEY is not set
# CONFIG_DM_VERITY is not set
# CONFIG_DM_VERITY_HASH_PREFETCH_MIN_SIZE_128 is not set
# CONFIG_DM_SWITCH is not set
CONFIG_DM_LOG_WRITES=y
# CONFIG_DM_INTEGRITY is not set
# CONFIG_TARGET_CORE is not set
# CONFIG_FUSION is not set

#
# IEEE 1394 (FireWire) support
#
# CONFIG_FIREWIRE is not set
CONFIG_FIREWIRE_NOSY=y
# CONFIG_NVM is not set

#
# Input device support
#
CONFIG_INPUT=y
CONFIG_INPUT_LEDS=y
CONFIG_INPUT_FF_MEMLESS=y
CONFIG_INPUT_POLLDEV=y
CONFIG_INPUT_SPARSEKMAP=y
CONFIG_INPUT_MATRIXKMAP=y

#
# Userland interfaces
#
CONFIG_INPUT_MOUSEDEV=y
# CONFIG_INPUT_MOUSEDEV_PSAUX is not set
CONFIG_INPUT_MOUSEDEV_SCREEN_X=1024
CONFIG_INPUT_MOUSEDEV_SCREEN_Y=768
# CONFIG_INPUT_JOYDEV is not set
CONFIG_INPUT_EVDEV=y
CONFIG_INPUT_EVBUG=y

#
# Input Device Drivers
#
CONFIG_INPUT_KEYBOARD=y
CONFIG_KEYBOARD_ADC=y
CONFIG_KEYBOARD_ADP5520=y
CONFIG_KEYBOARD_ADP5588=y
CONFIG_KEYBOARD_ADP5589=y
# CONFIG_KEYBOARD_ATKBD is not set
CONFIG_KEYBOARD_QT1070=y
CONFIG_KEYBOARD_QT2160=y
CONFIG_KEYBOARD_DLINK_DIR685=y
CONFIG_KEYBOARD_LKKBD=y
CONFIG_KEYBOARD_GPIO=y
CONFIG_KEYBOARD_GPIO_POLLED=y
# CONFIG_KEYBOARD_TCA6416 is not set
CONFIG_KEYBOARD_TCA8418=y
CONFIG_KEYBOARD_MATRIX=y
CONFIG_KEYBOARD_LM8323=y
CONFIG_KEYBOARD_LM8333=y
CONFIG_KEYBOARD_MAX7359=y
CONFIG_KEYBOARD_MCS=y
CONFIG_KEYBOARD_MPR121=y
CONFIG_KEYBOARD_NEWTON=y
CONFIG_KEYBOARD_OPENCORES=y
# CONFIG_KEYBOARD_GOLDFISH_EVENTS is not set
CONFIG_KEYBOARD_STOWAWAY=y
# CONFIG_KEYBOARD_ST_KEYSCAN is not set
# CONFIG_KEYBOARD_SUNKBD is not set
# CONFIG_KEYBOARD_SH_KEYSC is not set
# CONFIG_KEYBOARD_TM2_TOUCHKEY is not set
CONFIG_KEYBOARD_TWL4030=y
CONFIG_KEYBOARD_XTKBD=y
CONFIG_INPUT_MOUSE=y
# CONFIG_MOUSE_PS2 is not set
CONFIG_MOUSE_SERIAL=y
# CONFIG_MOUSE_APPLETOUCH is not set
# CONFIG_MOUSE_BCM5974 is not set
# CONFIG_MOUSE_CYAPA is not set
# CONFIG_MOUSE_ELAN_I2C is not set
# CONFIG_MOUSE_VSXXXAA is not set
CONFIG_MOUSE_GPIO=y
CONFIG_MOUSE_SYNAPTICS_I2C=y
CONFIG_MOUSE_SYNAPTICS_USB=y
# CONFIG_INPUT_JOYSTICK is not set
CONFIG_INPUT_TABLET=y
CONFIG_TABLET_USB_ACECAD=y
# CONFIG_TABLET_USB_AIPTEK is not set
# CONFIG_TABLET_USB_GTCO is not set
CONFIG_TABLET_USB_HANWANG=y
CONFIG_TABLET_USB_KBTAB=y
CONFIG_TABLET_USB_PEGASUS=y
CONFIG_TABLET_SERIAL_WACOM4=y
CONFIG_INPUT_TOUCHSCREEN=y
CONFIG_TOUCHSCREEN_PROPERTIES=y
CONFIG_TOUCHSCREEN_ADS7846=y
CONFIG_TOUCHSCREEN_AD7877=y
# CONFIG_TOUCHSCREEN_AD7879 is not set
CONFIG_TOUCHSCREEN_ATMEL_MXT=y
# CONFIG_TOUCHSCREEN_AUO_PIXCIR is not set
CONFIG_TOUCHSCREEN_BU21013=y
CONFIG_TOUCHSCREEN_CY8CTMG110=y
# CONFIG_TOUCHSCREEN_CYTTSP_CORE is not set
CONFIG_TOUCHSCREEN_CYTTSP4_CORE=y
CONFIG_TOUCHSCREEN_CYTTSP4_I2C=y
CONFIG_TOUCHSCREEN_CYTTSP4_SPI=y
CONFIG_TOUCHSCREEN_DA9052=y
CONFIG_TOUCHSCREEN_DYNAPRO=y
# CONFIG_TOUCHSCREEN_HAMPSHIRE is not set
CONFIG_TOUCHSCREEN_EETI=y
CONFIG_TOUCHSCREEN_EGALAX_SERIAL=y
CONFIG_TOUCHSCREEN_FUJITSU=y
CONFIG_TOUCHSCREEN_GOODIX=y
CONFIG_TOUCHSCREEN_ILI210X=y
# CONFIG_TOUCHSCREEN_IPROC is not set
CONFIG_TOUCHSCREEN_GUNZE=y
# CONFIG_TOUCHSCREEN_EKTF2127 is not set
CONFIG_TOUCHSCREEN_ELAN=y
CONFIG_TOUCHSCREEN_ELO=y
# CONFIG_TOUCHSCREEN_WACOM_W8001 is not set
CONFIG_TOUCHSCREEN_WACOM_I2C=y
CONFIG_TOUCHSCREEN_MAX11801=y
CONFIG_TOUCHSCREEN_MCS5000=y
# CONFIG_TOUCHSCREEN_MMS114 is not set
CONFIG_TOUCHSCREEN_MELFAS_MIP4=y
# CONFIG_TOUCHSCREEN_MTOUCH is not set
# CONFIG_TOUCHSCREEN_IMX6UL_TSC is not set
# CONFIG_TOUCHSCREEN_INEXIO is not set
CONFIG_TOUCHSCREEN_MK712=y
CONFIG_TOUCHSCREEN_PENMOUNT=y
CONFIG_TOUCHSCREEN_EDT_FT5X06=y
# CONFIG_TOUCHSCREEN_MIGOR is not set
CONFIG_TOUCHSCREEN_TOUCHRIGHT=y
# CONFIG_TOUCHSCREEN_TOUCHWIN is not set
CONFIG_TOUCHSCREEN_PIXCIR=y
CONFIG_TOUCHSCREEN_WDT87XX_I2C=y
# CONFIG_TOUCHSCREEN_WM831X is not set
# CONFIG_TOUCHSCREEN_USB_COMPOSITE is not set
CONFIG_TOUCHSCREEN_MC13783=y
# CONFIG_TOUCHSCREEN_TOUCHIT213 is not set
CONFIG_TOUCHSCREEN_TSC_SERIO=y
CONFIG_TOUCHSCREEN_TSC200X_CORE=y
# CONFIG_TOUCHSCREEN_TSC2004 is not set
CONFIG_TOUCHSCREEN_TSC2005=y
CONFIG_TOUCHSCREEN_TSC2007=y
# CONFIG_TOUCHSCREEN_TSC2007_IIO is not set
CONFIG_TOUCHSCREEN_RM_TS=y
# CONFIG_TOUCHSCREEN_SILEAD is not set
CONFIG_TOUCHSCREEN_SIS_I2C=y
# CONFIG_TOUCHSCREEN_ST1232 is not set
# CONFIG_TOUCHSCREEN_STMFTS is not set
# CONFIG_TOUCHSCREEN_SUN4I is not set
CONFIG_TOUCHSCREEN_SURFACE3_SPI=y
CONFIG_TOUCHSCREEN_SX8654=y
CONFIG_TOUCHSCREEN_TPS6507X=y
CONFIG_TOUCHSCREEN_ZET6223=y
CONFIG_TOUCHSCREEN_ZFORCE=y
CONFIG_TOUCHSCREEN_ROHM_BU21023=y
CONFIG_INPUT_MISC=y
CONFIG_INPUT_88PM80X_ONKEY=y
CONFIG_INPUT_AD714X=y
CONFIG_INPUT_AD714X_I2C=y
# CONFIG_INPUT_AD714X_SPI is not set
# CONFIG_INPUT_ATMEL_CAPTOUCH is not set
CONFIG_INPUT_BMA150=y
# CONFIG_INPUT_E3X0_BUTTON is not set
CONFIG_INPUT_MC13783_PWRBUTTON=y
CONFIG_INPUT_MMA8450=y
# CONFIG_INPUT_GP2A is not set
CONFIG_INPUT_GPIO_BEEPER=y
# CONFIG_INPUT_GPIO_TILT_POLLED is not set
CONFIG_INPUT_GPIO_DECODER=y
CONFIG_INPUT_ATI_REMOTE2=y
# CONFIG_INPUT_KEYSPAN_REMOTE is not set
# CONFIG_INPUT_KXTJ9 is not set
CONFIG_INPUT_POWERMATE=y
# CONFIG_INPUT_YEALINK is not set
# CONFIG_INPUT_CM109 is not set
CONFIG_INPUT_REGULATOR_HAPTIC=y
CONFIG_INPUT_RETU_PWRBUTTON=y
CONFIG_INPUT_AXP20X_PEK=y
CONFIG_INPUT_TWL4030_PWRBUTTON=y
CONFIG_INPUT_TWL4030_VIBRA=y
CONFIG_INPUT_UINPUT=y
CONFIG_INPUT_PALMAS_PWRBUTTON=y
CONFIG_INPUT_PCF50633_PMU=y
CONFIG_INPUT_PCF8574=y
# CONFIG_INPUT_GPIO_ROTARY_ENCODER is not set
CONFIG_INPUT_DA9052_ONKEY=y
CONFIG_INPUT_DA9063_ONKEY=y
# CONFIG_INPUT_WM831X_ON is not set
CONFIG_INPUT_ADXL34X=y
# CONFIG_INPUT_ADXL34X_I2C is not set
# CONFIG_INPUT_ADXL34X_SPI is not set
# CONFIG_INPUT_IMS_PCU is not set
CONFIG_INPUT_CMA3000=y
CONFIG_INPUT_CMA3000_I2C=y
# CONFIG_INPUT_SOC_BUTTON_ARRAY is not set
CONFIG_INPUT_DRV260X_HAPTICS=y
CONFIG_INPUT_DRV2665_HAPTICS=y
CONFIG_INPUT_DRV2667_HAPTICS=y
# CONFIG_INPUT_HISI_POWERKEY is not set
CONFIG_RMI4_CORE=y
CONFIG_RMI4_I2C=y
CONFIG_RMI4_SPI=y
# CONFIG_RMI4_SMB is not set
CONFIG_RMI4_F03=y
CONFIG_RMI4_F03_SERIO=y
CONFIG_RMI4_2D_SENSOR=y
CONFIG_RMI4_F11=y
CONFIG_RMI4_F12=y
CONFIG_RMI4_F30=y
# CONFIG_RMI4_F34 is not set
CONFIG_RMI4_F55=y

#
# Hardware I/O ports
#
CONFIG_SERIO=y
# CONFIG_SERIO_SERPORT is not set
CONFIG_SERIO_PARKBD=y
CONFIG_SERIO_PCIPS2=y
CONFIG_SERIO_LIBPS2=y
CONFIG_SERIO_RAW=y
CONFIG_SERIO_ALTERA_PS2=y
CONFIG_SERIO_PS2MULT=y
CONFIG_SERIO_ARC_PS2=y
# CONFIG_SERIO_OLPC_APSP is not set
# CONFIG_SERIO_SUN4I_PS2 is not set
# CONFIG_SERIO_GPIO_PS2 is not set
# CONFIG_USERIO is not set
# CONFIG_GAMEPORT is not set

#
# Character devices
#
CONFIG_TTY=y
CONFIG_UNIX98_PTYS=y
# CONFIG_LEGACY_PTYS is not set
# CONFIG_SERIAL_NONSTANDARD is not set
CONFIG_NOZOMI=y
# CONFIG_TRACE_SINK is not set
# CONFIG_DEVMEM is not set
# CONFIG_DEVKMEM is not set

#
# Serial drivers
#
CONFIG_SERIAL_EARLYCON=y
# CONFIG_SERIAL_8250 is not set

#
# Non-8250 serial port support
#
# CONFIG_SERIAL_ATMEL is not set
# CONFIG_SERIAL_CLPS711X is not set
# CONFIG_SERIAL_MAX3100 is not set
# CONFIG_SERIAL_MAX310X is not set
# CONFIG_SERIAL_IMX is not set
CONFIG_SERIAL_UARTLITE=y
# CONFIG_SERIAL_UARTLITE_CONSOLE is not set
CONFIG_SERIAL_UARTLITE_NR_UARTS=1
# CONFIG_SERIAL_SH_SCI is not set
CONFIG_SERIAL_CORE=y
CONFIG_SERIAL_CORE_CONSOLE=y
# CONFIG_SERIAL_JSM is not set
CONFIG_SERIAL_SCCNXP=y
# CONFIG_SERIAL_SCCNXP_CONSOLE is not set
CONFIG_SERIAL_SC16IS7XX_CORE=y
CONFIG_SERIAL_SC16IS7XX=y
CONFIG_SERIAL_SC16IS7XX_I2C=y
CONFIG_SERIAL_SC16IS7XX_SPI=y
# CONFIG_SERIAL_TIMBERDALE is not set
# CONFIG_SERIAL_BCM63XX is not set
CONFIG_SERIAL_ALTERA_JTAGUART=y
CONFIG_SERIAL_ALTERA_JTAGUART_CONSOLE=y
CONFIG_SERIAL_ALTERA_JTAGUART_CONSOLE_BYPASS=y
# CONFIG_SERIAL_ALTERA_UART is not set
# CONFIG_SERIAL_IFX6X60 is not set
# CONFIG_SERIAL_PCH_UART is not set
# CONFIG_SERIAL_MXS_AUART is not set
# CONFIG_SERIAL_MPS2_UART is not set
CONFIG_SERIAL_ARC=y
# CONFIG_SERIAL_ARC_CONSOLE is not set
CONFIG_SERIAL_ARC_NR_PORTS=1
CONFIG_SERIAL_RP2=y
CONFIG_SERIAL_RP2_NR_UARTS=32
CONFIG_SERIAL_FSL_LPUART=y
# CONFIG_SERIAL_FSL_LPUART_CONSOLE is not set
# CONFIG_SERIAL_ST_ASC is not set
CONFIG_SERIAL_MEN_Z135=y
# CONFIG_SERIAL_STM32 is not set
# CONFIG_SERIAL_MVEBU_UART is not set
# CONFIG_SERIAL_OWL is not set
CONFIG_SERIAL_DEV_BUS=y
# CONFIG_SERIAL_DEV_CTRL_TTYPORT is not set
# CONFIG_TTY_PRINTK is not set
CONFIG_PRINTER=y
# CONFIG_LP_CONSOLE is not set
CONFIG_PPDEV=y
CONFIG_HVC_DRIVER=y
CONFIG_VIRTIO_CONSOLE=y
# CONFIG_IPMI_HANDLER is not set
# CONFIG_ASPEED_BT_IPMI_BMC is not set
# CONFIG_HW_RANDOM is not set
# CONFIG_R3964 is not set
CONFIG_APPLICOM=y
# CONFIG_RAW_DRIVER is not set
# CONFIG_HANGCHECK_TIMER is not set
CONFIG_TCG_TPM=y
# CONFIG_TCG_TIS_SPI is not set
CONFIG_TCG_TIS_I2C_ATMEL=y
CONFIG_TCG_TIS_I2C_INFINEON=y
CONFIG_TCG_TIS_I2C_NUVOTON=y
# CONFIG_TCG_CR50_I2C is not set
# CONFIG_TCG_CR50_SPI is not set
# CONFIG_TCG_VTPM_PROXY is not set
CONFIG_TCG_TIS_ST33ZP24=y
CONFIG_TCG_TIS_ST33ZP24_I2C=y
CONFIG_TCG_TIS_ST33ZP24_SPI=y
CONFIG_DEVPORT=y

#
# S/390 character device drivers
#
CONFIG_TN3270=y
# CONFIG_TN3270_TTY is not set
CONFIG_TN3270_FS=y
# CONFIG_TN3215 is not set
CONFIG_SCLP_TTY=y
CONFIG_SCLP_CONSOLE=y
CONFIG_SCLP_VT220_TTY=y
CONFIG_SCLP_VT220_CONSOLE=y
CONFIG_SCLP_ASYNC=y
CONFIG_SCLP_ASYNC_ID="000000000"
CONFIG_HMC_DRV=y
# CONFIG_SCLP_OFB is not set
# CONFIG_S390_TAPE is not set
# CONFIG_VMCP is not set
CONFIG_MONWRITER=y
CONFIG_S390_VMUR=y
CONFIG_XILLYBUS=y
# CONFIG_XILLYBUS_PCIE is not set

#
# I2C support
#
CONFIG_I2C=y
CONFIG_I2C_BOARDINFO=y
# CONFIG_I2C_COMPAT is not set
# CONFIG_I2C_CHARDEV is not set
CONFIG_I2C_MUX=y

#
# Multiplexer I2C Chip support
#
# CONFIG_I2C_ARB_GPIO_CHALLENGE is not set
CONFIG_I2C_MUX_GPIO=y
# CONFIG_I2C_MUX_GPMUX is not set
CONFIG_I2C_MUX_LTC4306=y
CONFIG_I2C_MUX_PCA9541=y
CONFIG_I2C_MUX_PCA954x=y
# CONFIG_I2C_MUX_REG is not set
# CONFIG_I2C_MUX_MLXCPLD is not set
CONFIG_I2C_HELPER_AUTO=y
CONFIG_I2C_SMBUS=y
CONFIG_I2C_ALGOBIT=y

#
# I2C Hardware Bus support
#

#
# PC SMBus host controller drivers
#
# CONFIG_I2C_ALI1535 is not set
CONFIG_I2C_ALI1563=y
CONFIG_I2C_ALI15X3=y
# CONFIG_I2C_AMD756 is not set
CONFIG_I2C_AMD8111=y
# CONFIG_I2C_HIX5HD2 is not set
CONFIG_I2C_I801=y
CONFIG_I2C_ISCH=y
# CONFIG_I2C_PIIX4 is not set
# CONFIG_I2C_NFORCE2 is not set
# CONFIG_I2C_SIS5595 is not set
CONFIG_I2C_SIS630=y
CONFIG_I2C_SIS96X=y
CONFIG_I2C_VIA=y
CONFIG_I2C_VIAPRO=y

#
# I2C system bus drivers (mostly embedded / system-on-chip)
#
# CONFIG_I2C_ASPEED is not set
# CONFIG_I2C_AXXIA is not set
# CONFIG_I2C_BCM_IPROC is not set
CONFIG_I2C_BRCMSTB=y
CONFIG_I2C_CBUS_GPIO=y
CONFIG_I2C_DESIGNWARE_CORE=y
CONFIG_I2C_DESIGNWARE_PLATFORM=y
# CONFIG_I2C_DESIGNWARE_SLAVE is not set
CONFIG_I2C_DESIGNWARE_PCI=y
# CONFIG_I2C_EFM32 is not set
# CONFIG_I2C_EG20T is not set
CONFIG_I2C_GPIO=y
# CONFIG_I2C_IMG is not set
# CONFIG_I2C_IMX_LPI2C is not set
# CONFIG_I2C_JZ4780 is not set
CONFIG_I2C_KEMPLD=y
# CONFIG_I2C_MESON is not set
# CONFIG_I2C_MT65XX is not set
CONFIG_I2C_OCORES=y
# CONFIG_I2C_PCA_PLATFORM is not set
# CONFIG_I2C_PXA_PCI is not set
# CONFIG_I2C_RIIC is not set
# CONFIG_I2C_SH_MOBILE is not set
CONFIG_I2C_SIMTEC=y
# CONFIG_I2C_STM32F4 is not set
# CONFIG_I2C_STM32F7 is not set
# CONFIG_I2C_SUN6I_P2WI is not set
# CONFIG_I2C_UNIPHIER is not set
# CONFIG_I2C_UNIPHIER_F is not set
# CONFIG_I2C_VERSATILE is not set
# CONFIG_I2C_THUNDERX is not set
CONFIG_I2C_XILINX=y
# CONFIG_I2C_XLP9XX is not set
# CONFIG_I2C_RCAR is not set

#
# External I2C/SMBus adapter drivers
#
# CONFIG_I2C_DIOLAN_U2C is not set
# CONFIG_I2C_DLN2 is not set
CONFIG_I2C_PARPORT=y
# CONFIG_I2C_PARPORT_LIGHT is not set
CONFIG_I2C_ROBOTFUZZ_OSIF=y
# CONFIG_I2C_TAOS_EVM is not set
# CONFIG_I2C_TINY_USB is not set
# CONFIG_I2C_VIPERBOARD is not set

#
# Other I2C/SMBus bus drivers
#
CONFIG_I2C_SLAVE=y
CONFIG_I2C_SLAVE_EEPROM=y
CONFIG_I2C_DEBUG_CORE=y
CONFIG_I2C_DEBUG_ALGO=y
CONFIG_I2C_DEBUG_BUS=y
CONFIG_SPI=y
CONFIG_SPI_DEBUG=y
CONFIG_SPI_MASTER=y
CONFIG_SPI_MEM=y

#
# SPI Master Controller Drivers
#
# CONFIG_SPI_ALTERA is not set
# CONFIG_SPI_ARMADA_3700 is not set
# CONFIG_SPI_ATMEL is not set
# CONFIG_SPI_AXI_SPI_ENGINE is not set
# CONFIG_SPI_BCM2835 is not set
# CONFIG_SPI_BCM2835AUX is not set
# CONFIG_SPI_BCM63XX is not set
# CONFIG_SPI_BCM63XX_HSSPI is not set
# CONFIG_SPI_BCM_QSPI is not set
CONFIG_SPI_BITBANG=y
CONFIG_SPI_BUTTERFLY=y
CONFIG_SPI_CADENCE=y
# CONFIG_SPI_CLPS711X is not set
CONFIG_SPI_DESIGNWARE=y
# CONFIG_SPI_DW_PCI is not set
# CONFIG_SPI_DW_MMIO is not set
CONFIG_SPI_DLN2=y
# CONFIG_SPI_EP93XX is not set
# CONFIG_SPI_FSL_LPSPI is not set
CONFIG_SPI_GPIO=y
# CONFIG_SPI_IMG_SPFI is not set
# CONFIG_SPI_IMX is not set
# CONFIG_SPI_LM70_LLP is not set
# CONFIG_SPI_LP8841_RTC is not set
# CONFIG_SPI_FSL_DSPI is not set
# CONFIG_SPI_MESON_SPICC is not set
# CONFIG_SPI_MESON_SPIFC is not set
# CONFIG_SPI_MT65XX is not set
# CONFIG_SPI_LANTIQ_SSC is not set
CONFIG_SPI_OC_TINY=y
# CONFIG_SPI_OMAP24XX is not set
# CONFIG_SPI_TI_QSPI is not set
# CONFIG_SPI_OMAP_100K is not set
# CONFIG_SPI_ORION is not set
# CONFIG_SPI_PIC32 is not set
# CONFIG_SPI_PIC32_SQI is not set
CONFIG_SPI_PXA2XX=y
# CONFIG_SPI_PXA2XX_PCI is not set
# CONFIG_SPI_ROCKCHIP is not set
# CONFIG_SPI_RSPI is not set
# CONFIG_SPI_S3C64XX is not set
CONFIG_SPI_SC18IS602=y
# CONFIG_SPI_SH is not set
# CONFIG_SPI_SH_HSPI is not set
# CONFIG_SPI_STM32 is not set
# CONFIG_SPI_ST_SSC4 is not set
# CONFIG_SPI_SUN4I is not set
# CONFIG_SPI_SUN6I is not set
# CONFIG_SPI_TEGRA114 is not set
# CONFIG_SPI_TEGRA20_SFLASH is not set
# CONFIG_SPI_TEGRA20_SLINK is not set
# CONFIG_SPI_THUNDERX is not set
# CONFIG_SPI_TOPCLIFF_PCH is not set
# CONFIG_SPI_TXX9 is not set
# CONFIG_SPI_XCOMM is not set
# CONFIG_SPI_XILINX is not set
# CONFIG_SPI_XLP is not set
# CONFIG_SPI_XTENSA_XTFPGA is not set
CONFIG_SPI_ZYNQMP_GQSPI=y

#
# SPI Protocol Masters
#
CONFIG_SPI_SPIDEV=y
# CONFIG_SPI_TLE62X0 is not set
CONFIG_SPI_SLAVE=y
CONFIG_SPI_SLAVE_TIME=y
CONFIG_SPI_SLAVE_SYSTEM_CONTROL=y
# CONFIG_SPMI is not set
CONFIG_HSI=y
CONFIG_HSI_BOARDINFO=y

#
# HSI controllers
#

#
# HSI clients
#
CONFIG_HSI_CHAR=y
CONFIG_PPS=y
CONFIG_PPS_DEBUG=y
CONFIG_NTP_PPS=y

#
# PPS clients support
#
# CONFIG_PPS_CLIENT_KTIMER is not set
# CONFIG_PPS_CLIENT_LDISC is not set
# CONFIG_PPS_CLIENT_PARPORT is not set
# CONFIG_PPS_CLIENT_GPIO is not set

#
# PPS generators support
#

#
# PTP clock support
#

#
# Enable PHYLIB and NETWORK_PHY_TIMESTAMPING to see the additional clocks.
#
CONFIG_GPIOLIB=y
CONFIG_GPIOLIB_IRQCHIP=y
CONFIG_DEBUG_GPIO=y
CONFIG_GPIO_SYSFS=y
CONFIG_GPIO_GENERIC=y
CONFIG_GPIO_MAX730X=y

#
# Memory mapped GPIO drivers
#
# CONFIG_GPIO_ATH79 is not set
# CONFIG_GPIO_AXP209 is not set
# CONFIG_GPIO_CLPS711X is not set
CONFIG_GPIO_DWAPB=y
CONFIG_GPIO_GENERIC_PLATFORM=y
# CONFIG_GPIO_IOP is not set
CONFIG_GPIO_MB86S7X=y
CONFIG_GPIO_MENZ127=y
CONFIG_GPIO_MOCKUP=y
# CONFIG_GPIO_MPC8XXX is not set
# CONFIG_GPIO_RCAR is not set
# CONFIG_GPIO_THUNDERX is not set
# CONFIG_GPIO_VX855 is not set
# CONFIG_GPIO_ZX is not set

#
# I2C GPIO expanders
#
# CONFIG_GPIO_ADP5588 is not set
CONFIG_GPIO_MAX7300=y
CONFIG_GPIO_MAX732X=y
CONFIG_GPIO_MAX732X_IRQ=y
# CONFIG_GPIO_PCA953X is not set
CONFIG_GPIO_PCF857X=y
CONFIG_GPIO_TPIC2810=y
# CONFIG_GPIO_TS4900 is not set

#
# MFD GPIO expanders
#
CONFIG_GPIO_ADP5520=y
CONFIG_GPIO_ARIZONA=y
# CONFIG_GPIO_BD9571MWV is not set
CONFIG_GPIO_DA9052=y
CONFIG_GPIO_DLN2=y
# CONFIG_GPIO_JANZ_TTL is not set
CONFIG_GPIO_KEMPLD=y
# CONFIG_GPIO_LP873X is not set
# CONFIG_GPIO_PALMAS is not set
CONFIG_GPIO_TPS65086=y
# CONFIG_GPIO_TPS65912 is not set
# CONFIG_GPIO_TWL4030 is not set
CONFIG_GPIO_WM831X=y
# CONFIG_GPIO_WM8350 is not set
# CONFIG_GPIO_WM8994 is not set

#
# PCI GPIO expanders
#
# CONFIG_GPIO_AMD8111 is not set
CONFIG_GPIO_BT8XX=y
# CONFIG_GPIO_ML_IOH is not set
# CONFIG_GPIO_PCH is not set
CONFIG_GPIO_PCI_IDIO_16=y
# CONFIG_GPIO_RDC321X is not set

#
# SPI GPIO expanders
#
CONFIG_GPIO_MAX7301=y
CONFIG_GPIO_MC33880=y
# CONFIG_GPIO_PISOSR is not set
# CONFIG_GPIO_XRA1403 is not set

#
# USB GPIO expanders
#
# CONFIG_GPIO_VIPERBOARD is not set
CONFIG_W1=y

#
# 1-wire Bus Masters
#
CONFIG_W1_MASTER_MATROX=y
CONFIG_W1_MASTER_DS2490=y
CONFIG_W1_MASTER_DS2482=y
# CONFIG_W1_MASTER_MXC is not set
CONFIG_W1_MASTER_DS1WM=y
# CONFIG_W1_MASTER_GPIO is not set

#
# 1-wire Slaves
#
# CONFIG_W1_SLAVE_THERM is not set
CONFIG_W1_SLAVE_SMEM=y
CONFIG_W1_SLAVE_DS2405=y
CONFIG_W1_SLAVE_DS2408=y
# CONFIG_W1_SLAVE_DS2408_READBACK is not set
CONFIG_W1_SLAVE_DS2413=y
CONFIG_W1_SLAVE_DS2406=y
# CONFIG_W1_SLAVE_DS2423 is not set
# CONFIG_W1_SLAVE_DS2805 is not set
# CONFIG_W1_SLAVE_DS2431 is not set
CONFIG_W1_SLAVE_DS2433=y
# CONFIG_W1_SLAVE_DS2433_CRC is not set
CONFIG_W1_SLAVE_DS2438=y
# CONFIG_W1_SLAVE_DS2760 is not set
CONFIG_W1_SLAVE_DS2780=y
# CONFIG_W1_SLAVE_DS2781 is not set
# CONFIG_W1_SLAVE_DS28E04 is not set
# CONFIG_POWER_AVS is not set
# CONFIG_POWER_RESET is not set
CONFIG_POWER_SUPPLY=y
# CONFIG_POWER_SUPPLY_DEBUG is not set
# CONFIG_GENERIC_ADC_BATTERY is not set
# CONFIG_WM831X_BACKUP is not set
CONFIG_WM831X_POWER=y
# CONFIG_WM8350_POWER is not set
# CONFIG_TEST_POWER is not set
# CONFIG_BATTERY_ACT8945A is not set
CONFIG_BATTERY_DS2780=y
# CONFIG_BATTERY_DS2781 is not set
# CONFIG_BATTERY_DS2782 is not set
CONFIG_BATTERY_SBS=y
CONFIG_CHARGER_SBS=y
CONFIG_BATTERY_BQ27XXX=y
# CONFIG_BATTERY_BQ27XXX_I2C is not set
CONFIG_BATTERY_BQ27XXX_HDQ=y
# CONFIG_BATTERY_DA9052 is not set
# CONFIG_CHARGER_AXP20X is not set
# CONFIG_BATTERY_AXP20X is not set
CONFIG_AXP20X_POWER=y
# CONFIG_AXP288_FUEL_GAUGE is not set
# CONFIG_BATTERY_MAX17040 is not set
# CONFIG_BATTERY_MAX17042 is not set
CONFIG_BATTERY_MAX1721X=y
CONFIG_BATTERY_TWL4030_MADC=y
CONFIG_CHARGER_PCF50633=y
CONFIG_BATTERY_RX51=y
# CONFIG_CHARGER_ISP1704 is not set
CONFIG_CHARGER_MAX8903=y
# CONFIG_CHARGER_TWL4030 is not set
CONFIG_CHARGER_LP8727=y
CONFIG_CHARGER_GPIO=y
CONFIG_CHARGER_MANAGER=y
# CONFIG_CHARGER_LTC3651 is not set
CONFIG_CHARGER_MAX14577=y
CONFIG_CHARGER_MAX77693=y
CONFIG_CHARGER_BQ2415X=y
# CONFIG_CHARGER_BQ24190 is not set
# CONFIG_CHARGER_BQ24257 is not set
CONFIG_CHARGER_BQ24735=y
# CONFIG_CHARGER_BQ25890 is not set
# CONFIG_CHARGER_SMB347 is not set
CONFIG_BATTERY_GAUGE_LTC2941=y
# CONFIG_BATTERY_GOLDFISH is not set
# CONFIG_CHARGER_RT9455 is not set
CONFIG_HWMON=y
CONFIG_HWMON_VID=y
CONFIG_HWMON_DEBUG_CHIP=y

#
# Native drivers
#
CONFIG_SENSORS_AD7314=y
# CONFIG_SENSORS_AD7414 is not set
# CONFIG_SENSORS_AD7418 is not set
CONFIG_SENSORS_ADM1021=y
# CONFIG_SENSORS_ADM1025 is not set
# CONFIG_SENSORS_ADM1026 is not set
CONFIG_SENSORS_ADM1029=y
# CONFIG_SENSORS_ADM1031 is not set
# CONFIG_SENSORS_ADM9240 is not set
CONFIG_SENSORS_ADT7X10=y
CONFIG_SENSORS_ADT7310=y
CONFIG_SENSORS_ADT7410=y
# CONFIG_SENSORS_ADT7411 is not set
# CONFIG_SENSORS_ADT7462 is not set
# CONFIG_SENSORS_ADT7470 is not set
CONFIG_SENSORS_ADT7475=y
CONFIG_SENSORS_ASC7621=y
# CONFIG_SENSORS_ASPEED is not set
CONFIG_SENSORS_ATXP1=y
CONFIG_SENSORS_DS620=y
CONFIG_SENSORS_DS1621=y
# CONFIG_SENSORS_DA9052_ADC is not set
CONFIG_SENSORS_I5K_AMB=y
# CONFIG_SENSORS_F71805F is not set
CONFIG_SENSORS_F71882FG=y
CONFIG_SENSORS_F75375S=y
# CONFIG_SENSORS_MC13783_ADC is not set
CONFIG_SENSORS_FTSTEUTATES=y
CONFIG_SENSORS_GL518SM=y
CONFIG_SENSORS_GL520SM=y
CONFIG_SENSORS_G760A=y
CONFIG_SENSORS_G762=y
# CONFIG_SENSORS_GPIO_FAN is not set
# CONFIG_SENSORS_HIH6130 is not set
CONFIG_SENSORS_IIO_HWMON=y
CONFIG_SENSORS_IT87=y
# CONFIG_SENSORS_JC42 is not set
CONFIG_SENSORS_POWR1220=y
CONFIG_SENSORS_LINEAGE=y
CONFIG_SENSORS_LTC2945=y
# CONFIG_SENSORS_LTC2990 is not set
CONFIG_SENSORS_LTC4151=y
# CONFIG_SENSORS_LTC4215 is not set
CONFIG_SENSORS_LTC4222=y
# CONFIG_SENSORS_LTC4245 is not set
CONFIG_SENSORS_LTC4260=y
CONFIG_SENSORS_LTC4261=y
CONFIG_SENSORS_MAX1111=y
# CONFIG_SENSORS_MAX16065 is not set
CONFIG_SENSORS_MAX1619=y
CONFIG_SENSORS_MAX1668=y
# CONFIG_SENSORS_MAX197 is not set
# CONFIG_SENSORS_MAX31722 is not set
# CONFIG_SENSORS_MAX6639 is not set
# CONFIG_SENSORS_MAX6642 is not set
CONFIG_SENSORS_MAX6650=y
CONFIG_SENSORS_MAX6697=y
# CONFIG_SENSORS_MAX31790 is not set
# CONFIG_SENSORS_MCP3021 is not set
# CONFIG_SENSORS_TC654 is not set
# CONFIG_SENSORS_MENF21BMC_HWMON is not set
CONFIG_SENSORS_ADCXX=y
# CONFIG_SENSORS_LM63 is not set
CONFIG_SENSORS_LM70=y
# CONFIG_SENSORS_LM73 is not set
# CONFIG_SENSORS_LM75 is not set
CONFIG_SENSORS_LM77=y
CONFIG_SENSORS_LM78=y
# CONFIG_SENSORS_LM80 is not set
# CONFIG_SENSORS_LM83 is not set
CONFIG_SENSORS_LM85=y
# CONFIG_SENSORS_LM87 is not set
# CONFIG_SENSORS_LM90 is not set
CONFIG_SENSORS_LM92=y
# CONFIG_SENSORS_LM93 is not set
# CONFIG_SENSORS_LM95234 is not set
CONFIG_SENSORS_LM95241=y
# CONFIG_SENSORS_LM95245 is not set
CONFIG_SENSORS_PC87360=y
CONFIG_SENSORS_PC87427=y
# CONFIG_SENSORS_NTC_THERMISTOR is not set
CONFIG_SENSORS_NCT6683=y
# CONFIG_SENSORS_NCT6775 is not set
CONFIG_SENSORS_NCT7802=y
CONFIG_SENSORS_NCT7904=y
CONFIG_SENSORS_PCF8591=y
CONFIG_PMBUS=y
CONFIG_SENSORS_PMBUS=y
# CONFIG_SENSORS_ADM1275 is not set
CONFIG_SENSORS_IBM_CFFPS=y
CONFIG_SENSORS_IR35221=y
CONFIG_SENSORS_LM25066=y
# CONFIG_SENSORS_LTC2978 is not set
# CONFIG_SENSORS_LTC3815 is not set
CONFIG_SENSORS_MAX16064=y
CONFIG_SENSORS_MAX20751=y
CONFIG_SENSORS_MAX34440=y
CONFIG_SENSORS_MAX8688=y
# CONFIG_SENSORS_TPS40422 is not set
# CONFIG_SENSORS_TPS53679 is not set
# CONFIG_SENSORS_UCD9000 is not set
CONFIG_SENSORS_UCD9200=y
CONFIG_SENSORS_ZL6100=y
# CONFIG_SENSORS_PWM_FAN is not set
CONFIG_SENSORS_SHT15=y
CONFIG_SENSORS_SHT21=y
# CONFIG_SENSORS_SHT3x is not set
# CONFIG_SENSORS_SHTC1 is not set
CONFIG_SENSORS_SIS5595=y
# CONFIG_SENSORS_DME1737 is not set
CONFIG_SENSORS_EMC1403=y
CONFIG_SENSORS_EMC2103=y
# CONFIG_SENSORS_EMC6W201 is not set
# CONFIG_SENSORS_SMSC47M1 is not set
CONFIG_SENSORS_SMSC47M192=y
CONFIG_SENSORS_SMSC47B397=y
CONFIG_SENSORS_SCH56XX_COMMON=y
CONFIG_SENSORS_SCH5627=y
CONFIG_SENSORS_SCH5636=y
CONFIG_SENSORS_STTS751=y
CONFIG_SENSORS_SMM665=y
CONFIG_SENSORS_ADC128D818=y
# CONFIG_SENSORS_ADS1015 is not set
# CONFIG_SENSORS_ADS7828 is not set
# CONFIG_SENSORS_ADS7871 is not set
CONFIG_SENSORS_AMC6821=y
# CONFIG_SENSORS_INA209 is not set
CONFIG_SENSORS_INA2XX=y
CONFIG_SENSORS_INA3221=y
CONFIG_SENSORS_TC74=y
# CONFIG_SENSORS_THMC50 is not set
# CONFIG_SENSORS_TMP102 is not set
CONFIG_SENSORS_TMP103=y
# CONFIG_SENSORS_TMP108 is not set
CONFIG_SENSORS_TMP401=y
CONFIG_SENSORS_TMP421=y
CONFIG_SENSORS_VIA686A=y
CONFIG_SENSORS_VT1211=y
# CONFIG_SENSORS_VT8231 is not set
CONFIG_SENSORS_W83781D=y
# CONFIG_SENSORS_W83791D is not set
# CONFIG_SENSORS_W83792D is not set
CONFIG_SENSORS_W83793=y
CONFIG_SENSORS_W83795=y
CONFIG_SENSORS_W83795_FANCTRL=y
CONFIG_SENSORS_W83L785TS=y
# CONFIG_SENSORS_W83L786NG is not set
CONFIG_SENSORS_W83627HF=y
CONFIG_SENSORS_W83627EHF=y
CONFIG_SENSORS_WM831X=y
CONFIG_SENSORS_WM8350=y
# CONFIG_THERMAL is not set
CONFIG_WATCHDOG=y
CONFIG_WATCHDOG_CORE=y
# CONFIG_WATCHDOG_NOWAYOUT is not set
# CONFIG_WATCHDOG_HANDLE_BOOT_ENABLED is not set
CONFIG_WATCHDOG_SYSFS=y

#
# Watchdog Device Drivers
#
# CONFIG_SOFT_WATCHDOG is not set
# CONFIG_DA9052_WATCHDOG is not set
# CONFIG_DA9055_WATCHDOG is not set
# CONFIG_DA9063_WATCHDOG is not set
CONFIG_DA9062_WATCHDOG=y
# CONFIG_MENF21BMC_WATCHDOG is not set
# CONFIG_TANGOX_WATCHDOG is not set
# CONFIG_WM831X_WATCHDOG is not set
CONFIG_WM8350_WATCHDOG=y
CONFIG_XILINX_WATCHDOG=y
CONFIG_ZIIRAVE_WATCHDOG=y
# CONFIG_AT91RM9200_WATCHDOG is not set
# CONFIG_AT91SAM9X_WATCHDOG is not set
# CONFIG_SAMA5D4_WATCHDOG is not set
# CONFIG_CADENCE_WATCHDOG is not set
# CONFIG_S3C2410_WATCHDOG is not set
CONFIG_DW_WATCHDOG=y
# CONFIG_EP93XX_WATCHDOG is not set
# CONFIG_OMAP_WATCHDOG is not set
# CONFIG_DAVINCI_WATCHDOG is not set
# CONFIG_RN5T618_WATCHDOG is not set
# CONFIG_SUNXI_WATCHDOG is not set
CONFIG_TWL4030_WATCHDOG=y
# CONFIG_STMP3XXX_RTC_WATCHDOG is not set
# CONFIG_NUC900_WATCHDOG is not set
# CONFIG_TS72XX_WATCHDOG is not set
CONFIG_MAX63XX_WATCHDOG=y
# CONFIG_MAX77620_WATCHDOG is not set
# CONFIG_IMX2_WDT is not set
# CONFIG_RETU_WATCHDOG is not set
# CONFIG_MOXART_WDT is not set
CONFIG_SIRFSOC_WATCHDOG=y
# CONFIG_TEGRA_WATCHDOG is not set
# CONFIG_QCOM_WDT is not set
# CONFIG_MESON_GXBB_WATCHDOG is not set
# CONFIG_MESON_WATCHDOG is not set
# CONFIG_MEDIATEK_WATCHDOG is not set
# CONFIG_DIGICOLOR_WATCHDOG is not set
# CONFIG_LPC18XX_WATCHDOG is not set
# CONFIG_ATLAS7_WATCHDOG is not set
# CONFIG_RENESAS_WDT is not set
# CONFIG_RENESAS_RZAWDT is not set
# CONFIG_ASPEED_WATCHDOG is not set
# CONFIG_AT32AP700X_WDT is not set
CONFIG_ALIM7101_WDT=y
# CONFIG_SC520_WDT is not set
CONFIG_I6300ESB_WDT=y
CONFIG_KEMPLD_WDT=y
# CONFIG_RDC321X_WDT is not set
# CONFIG_BCM47XX_WDT is not set
# CONFIG_BCM_KONA_WDT is not set
# CONFIG_BCM_KONA_WDT_DEBUG is not set
# CONFIG_BCM7038_WDT is not set
# CONFIG_IMGPDC_WDT is not set
# CONFIG_MPC5200_WDT is not set
# CONFIG_MV64X60_WDT is not set
# CONFIG_MEN_A21_WDT is not set
CONFIG_DIAG288_WATCHDOG=y
# CONFIG_UML_WATCHDOG is not set

#
# PCI-based Watchdog Cards
#
# CONFIG_PCIPCWATCHDOG is not set
# CONFIG_WDTPCI is not set

#
# USB-based Watchdog Cards
#
# CONFIG_USBPCWATCHDOG is not set

#
# Watchdog Pretimeout Governors
#
# CONFIG_WATCHDOG_PRETIMEOUT_GOV is not set
CONFIG_SSB_POSSIBLE=y

#
# Sonics Silicon Backplane
#
CONFIG_SSB=y
CONFIG_SSB_PCIHOST_POSSIBLE=y
# CONFIG_SSB_PCIHOST is not set
# CONFIG_SSB_SILENT is not set
# CONFIG_SSB_DEBUG is not set
# CONFIG_SSB_DRIVER_GPIO is not set
CONFIG_BCMA_POSSIBLE=y
CONFIG_BCMA=y
CONFIG_BCMA_HOST_PCI_POSSIBLE=y
# CONFIG_BCMA_HOST_PCI is not set
CONFIG_BCMA_HOST_SOC=y
# CONFIG_BCMA_DRIVER_PCI is not set
CONFIG_BCMA_SFLASH=y
CONFIG_BCMA_DRIVER_GMAC_CMN=y
CONFIG_BCMA_DRIVER_GPIO=y
# CONFIG_BCMA_DEBUG is not set

#
# Multifunction device drivers
#
CONFIG_MFD_CORE=y
# CONFIG_MFD_SUN4I_GPADC is not set
CONFIG_MFD_AS3711=y
CONFIG_PMIC_ADP5520=y
# CONFIG_MFD_AAT2870_CORE is not set
CONFIG_MFD_BCM590XX=y
CONFIG_MFD_BD9571MWV=y
CONFIG_MFD_AXP20X=y
CONFIG_MFD_AXP20X_I2C=y
# CONFIG_MFD_CROS_EC is not set
# CONFIG_PMIC_DA903X is not set
CONFIG_PMIC_DA9052=y
CONFIG_MFD_DA9052_SPI=y
CONFIG_MFD_DA9052_I2C=y
# CONFIG_MFD_DA9055 is not set
CONFIG_MFD_DA9062=y
# CONFIG_MFD_DA9063 is not set
# CONFIG_MFD_DA9150 is not set
CONFIG_MFD_DLN2=y
# CONFIG_MFD_EXYNOS_LPASS is not set
CONFIG_MFD_MC13XXX=y
CONFIG_MFD_MC13XXX_SPI=y
CONFIG_MFD_MC13XXX_I2C=y
# CONFIG_MFD_MXS_LRADC is not set
# CONFIG_MFD_MX25_TSADC is not set
CONFIG_HTC_PASIC3=y
# CONFIG_HTC_I2CPLD is not set
# CONFIG_LPC_ICH is not set
CONFIG_LPC_SCH=y
CONFIG_MFD_JANZ_CMODIO=y
CONFIG_MFD_KEMPLD=y
CONFIG_MFD_88PM800=y
CONFIG_MFD_88PM805=y
# CONFIG_MFD_88PM860X is not set
CONFIG_MFD_MAX14577=y
# CONFIG_MFD_MAX77620 is not set
# CONFIG_MFD_MAX77686 is not set
CONFIG_MFD_MAX77693=y
CONFIG_MFD_MAX77843=y
# CONFIG_MFD_MAX8907 is not set
# CONFIG_MFD_MAX8925 is not set
# CONFIG_MFD_MAX8997 is not set
# CONFIG_MFD_MAX8998 is not set
# CONFIG_MFD_MT6397 is not set
CONFIG_MFD_MENF21BMC=y
# CONFIG_EZX_PCAP is not set
# CONFIG_MFD_CPCAP is not set
CONFIG_MFD_VIPERBOARD=y
CONFIG_MFD_RETU=y
CONFIG_MFD_PCF50633=y
CONFIG_PCF50633_ADC=y
CONFIG_PCF50633_GPIO=y
CONFIG_MFD_RDC321X=y
# CONFIG_MFD_RTSX_PCI is not set
# CONFIG_MFD_RT5033 is not set
# CONFIG_MFD_RTSX_USB is not set
# CONFIG_MFD_RC5T583 is not set
# CONFIG_MFD_SEC_CORE is not set
CONFIG_MFD_SI476X_CORE=y
# CONFIG_MFD_SM501 is not set
CONFIG_MFD_SKY81452=y
# CONFIG_MFD_SMSC is not set
CONFIG_ABX500_CORE=y
# CONFIG_AB3100_CORE is not set
CONFIG_MFD_SYSCON=y
# CONFIG_MFD_TI_AM335X_TSCADC is not set
# CONFIG_MFD_LP3943 is not set
# CONFIG_MFD_LP8788 is not set
CONFIG_MFD_TI_LMU=y
CONFIG_MFD_PALMAS=y
CONFIG_TPS6105X=y
# CONFIG_TPS65010 is not set
CONFIG_TPS6507X=y
CONFIG_MFD_TPS65086=y
# CONFIG_MFD_TPS65090 is not set
# CONFIG_MFD_TPS65217 is not set
CONFIG_MFD_TI_LP873X=y
# CONFIG_MFD_TPS65218 is not set
# CONFIG_MFD_TPS6586X is not set
# CONFIG_MFD_TPS65910 is not set
CONFIG_MFD_TPS65912=y
CONFIG_MFD_TPS65912_I2C=y
CONFIG_MFD_TPS65912_SPI=y
# CONFIG_MFD_TPS80031 is not set
CONFIG_TWL4030_CORE=y
CONFIG_MFD_TWL4030_AUDIO=y
# CONFIG_TWL6040_CORE is not set
# CONFIG_MFD_WL1273_CORE is not set
CONFIG_MFD_LM3533=y
# CONFIG_MFD_TIMBERDALE is not set
# CONFIG_MFD_TMIO is not set
CONFIG_MFD_VX855=y
CONFIG_MFD_ARIZONA=y
# CONFIG_MFD_ARIZONA_I2C is not set
CONFIG_MFD_ARIZONA_SPI=y
# CONFIG_MFD_CS47L24 is not set
# CONFIG_MFD_WM5102 is not set
CONFIG_MFD_WM5110=y
CONFIG_MFD_WM8997=y
CONFIG_MFD_WM8998=y
CONFIG_MFD_WM8400=y
CONFIG_MFD_WM831X=y
# CONFIG_MFD_WM831X_I2C is not set
CONFIG_MFD_WM831X_SPI=y
CONFIG_MFD_WM8350=y
CONFIG_MFD_WM8350_I2C=y
CONFIG_MFD_WM8994=y
# CONFIG_MFD_STW481X is not set
# CONFIG_MFD_STM32_LPTIMER is not set
# CONFIG_MFD_STM32_TIMERS is not set
CONFIG_REGULATOR=y
CONFIG_REGULATOR_DEBUG=y
CONFIG_REGULATOR_FIXED_VOLTAGE=y
CONFIG_REGULATOR_VIRTUAL_CONSUMER=y
# CONFIG_REGULATOR_USERSPACE_CONSUMER is not set
CONFIG_REGULATOR_88PM800=y
CONFIG_REGULATOR_ACT8865=y
CONFIG_REGULATOR_AD5398=y
# CONFIG_REGULATOR_ANATOP is not set
# CONFIG_REGULATOR_AS3711 is not set
CONFIG_REGULATOR_AXP20X=y
CONFIG_REGULATOR_BCM590XX=y
# CONFIG_REGULATOR_BD9571MWV is not set
CONFIG_REGULATOR_DA9052=y
CONFIG_REGULATOR_DA9062=y
CONFIG_REGULATOR_DA9210=y
CONFIG_REGULATOR_DA9211=y
CONFIG_REGULATOR_FAN53555=y
CONFIG_REGULATOR_GPIO=y
CONFIG_REGULATOR_ISL9305=y
CONFIG_REGULATOR_ISL6271A=y
# CONFIG_REGULATOR_LM363X is not set
CONFIG_REGULATOR_LP3971=y
CONFIG_REGULATOR_LP3972=y
CONFIG_REGULATOR_LP872X=y
CONFIG_REGULATOR_LP8755=y
CONFIG_REGULATOR_LTC3589=y
CONFIG_REGULATOR_LTC3676=y
# CONFIG_REGULATOR_MAX14577 is not set
CONFIG_REGULATOR_MAX1586=y
# CONFIG_REGULATOR_MAX8649 is not set
# CONFIG_REGULATOR_MAX8660 is not set
# CONFIG_REGULATOR_MAX8952 is not set
CONFIG_REGULATOR_MAX77693=y
CONFIG_REGULATOR_MC13XXX_CORE=y
CONFIG_REGULATOR_MC13783=y
CONFIG_REGULATOR_MC13892=y
CONFIG_REGULATOR_MT6311=y
# CONFIG_REGULATOR_PALMAS is not set
# CONFIG_REGULATOR_PBIAS is not set
CONFIG_REGULATOR_PCF50633=y
# CONFIG_REGULATOR_PFUZE100 is not set
# CONFIG_REGULATOR_PV88060 is not set
# CONFIG_REGULATOR_PV88080 is not set
# CONFIG_REGULATOR_PV88090 is not set
# CONFIG_REGULATOR_QCOM_SPMI is not set
CONFIG_REGULATOR_SKY81452=y
# CONFIG_REGULATOR_STM32_VREFBUF is not set
# CONFIG_REGULATOR_STW481X_VMMC is not set
CONFIG_REGULATOR_TPS51632=y
CONFIG_REGULATOR_TPS6105X=y
# CONFIG_REGULATOR_TPS62360 is not set
CONFIG_REGULATOR_TPS65023=y
CONFIG_REGULATOR_TPS6507X=y
# CONFIG_REGULATOR_TPS65086 is not set
CONFIG_REGULATOR_TPS65132=y
# CONFIG_REGULATOR_TPS6524X is not set
# CONFIG_REGULATOR_TPS65912 is not set
# CONFIG_REGULATOR_TWL4030 is not set
CONFIG_REGULATOR_WM831X=y
# CONFIG_REGULATOR_WM8350 is not set
CONFIG_REGULATOR_WM8400=y
# CONFIG_REGULATOR_WM8994 is not set
CONFIG_RC_CORE=y
CONFIG_RC_MAP=y
# CONFIG_RC_DECODERS is not set
# CONFIG_RC_DEVICES is not set
# CONFIG_MEDIA_SUPPORT is not set

#
# Graphics support
#
CONFIG_DRM=y
CONFIG_DRM_PANEL_ORIENTATION_QUIRKS=y
# CONFIG_DRM_DP_AUX_CHARDEV is not set
# CONFIG_DRM_DEBUG_MM is not set
# CONFIG_DRM_DEBUG_MM_SELFTEST is not set
CONFIG_DRM_KMS_HELPER=y
CONFIG_DRM_KMS_FB_HELPER=y
CONFIG_DRM_FBDEV_EMULATION=y
CONFIG_DRM_FBDEV_OVERALLOC=100
# CONFIG_DRM_LOAD_EDID_FIRMWARE is not set
CONFIG_DRM_TTM=y
CONFIG_DRM_VM=y
CONFIG_DRM_SCHED=y

#
# I2C encoder or helper chips
#
CONFIG_DRM_I2C_CH7006=y
CONFIG_DRM_I2C_SIL164=y
CONFIG_DRM_I2C_NXP_TDA998X=y
# CONFIG_DRM_RADEON is not set
CONFIG_DRM_AMDGPU=y
# CONFIG_DRM_AMDGPU_SI is not set
CONFIG_DRM_AMDGPU_CIK=y
CONFIG_DRM_AMDGPU_USERPTR=y
# CONFIG_DRM_AMDGPU_GART_DEBUGFS is not set

#
# ACP (Audio CoProcessor) Configuration
#
# CONFIG_DRM_AMD_ACP is not set

#
# Display Engine Configuration
#
CONFIG_DRM_AMD_DC=y
# CONFIG_DRM_AMD_DC_FBC is not set
# CONFIG_DEBUG_KERNEL_DC is not set

#
# AMD Library routines
#
CONFIG_CHASH=y
# CONFIG_CHASH_STATS is not set
# CONFIG_CHASH_SELFTEST is not set
CONFIG_DRM_NOUVEAU=y
CONFIG_NOUVEAU_DEBUG=5
CONFIG_NOUVEAU_DEBUG_DEFAULT=3
CONFIG_DRM_NOUVEAU_BACKLIGHT=y
# CONFIG_DRM_VGEM is not set
CONFIG_DRM_UDL=y
CONFIG_DRM_AST=y
# CONFIG_DRM_MGAG200 is not set
CONFIG_DRM_CIRRUS_QEMU=y
CONFIG_DRM_QXL=y
CONFIG_DRM_BOCHS=y
# CONFIG_DRM_VIRTIO_GPU is not set
CONFIG_DRM_PANEL=y

#
# Display Panels
#
CONFIG_DRM_BRIDGE=y
CONFIG_DRM_PANEL_BRIDGE=y

#
# Display Interface Bridges
#
CONFIG_DRM_ANALOGIX_ANX78XX=y
# CONFIG_DRM_HISI_HIBMC is not set
# CONFIG_DRM_TINYDRM is not set
CONFIG_DRM_LEGACY=y
CONFIG_DRM_TDFX=y
CONFIG_DRM_R128=y
CONFIG_DRM_MGA=y
# CONFIG_DRM_VIA is not set
CONFIG_DRM_SAVAGE=y
# CONFIG_DRM_LIB_RANDOM is not set

#
# Frame buffer Devices
#
CONFIG_FB=y
# CONFIG_FIRMWARE_EDID is not set
CONFIG_FB_CMDLINE=y
CONFIG_FB_NOTIFY=y
# CONFIG_FB_DDC is not set
# CONFIG_FB_BOOT_VESA_SUPPORT is not set
CONFIG_FB_CFB_FILLRECT=y
CONFIG_FB_CFB_COPYAREA=y
CONFIG_FB_CFB_IMAGEBLIT=y
# CONFIG_FB_CFB_REV_PIXELS_IN_BYTE is not set
CONFIG_FB_SYS_FILLRECT=y
CONFIG_FB_SYS_COPYAREA=y
CONFIG_FB_SYS_IMAGEBLIT=y
# CONFIG_FB_PROVIDE_GET_FB_UNMAPPED_AREA is not set
# CONFIG_FB_FOREIGN_ENDIAN is not set
CONFIG_FB_SYS_FOPS=y
CONFIG_FB_DEFERRED_IO=y
# CONFIG_FB_SVGALIB is not set
# CONFIG_FB_MACMODES is not set
CONFIG_FB_BACKLIGHT=y
# CONFIG_FB_MODE_HELPERS is not set
# CONFIG_FB_TILEBLITTING is not set

#
# Frame buffer hardware drivers
#
# CONFIG_FB_CIRRUS is not set
# CONFIG_FB_PM2 is not set
# CONFIG_FB_CLPS711X is not set
# CONFIG_FB_CYBER2000 is not set
# CONFIG_FB_ASILIANT is not set
# CONFIG_FB_IMSTT is not set
# CONFIG_FB_OPENCORES is not set
# CONFIG_FB_S1D13XXX is not set
# CONFIG_FB_NVIDIA is not set
# CONFIG_FB_RIVA is not set
# CONFIG_FB_I740 is not set
# CONFIG_FB_MATROX is not set
# CONFIG_FB_RADEON is not set
# CONFIG_FB_ATY128 is not set
# CONFIG_FB_ATY is not set
# CONFIG_FB_S3 is not set
# CONFIG_FB_SAVAGE is not set
# CONFIG_FB_SIS is not set
# CONFIG_FB_NEOMAGIC is not set
# CONFIG_FB_KYRO is not set
# CONFIG_FB_3DFX is not set
# CONFIG_FB_VOODOO1 is not set
# CONFIG_FB_VT8623 is not set
# CONFIG_FB_TRIDENT is not set
# CONFIG_FB_ARK is not set
# CONFIG_FB_PM3 is not set
# CONFIG_FB_CARMINE is not set
# CONFIG_FB_TMIO is not set
# CONFIG_FB_SMSCUFX is not set
# CONFIG_FB_UDL is not set
# CONFIG_FB_IBM_GXT4500 is not set
# CONFIG_FB_GOLDFISH is not set
# CONFIG_FB_VIRTUAL is not set
# CONFIG_FB_METRONOME is not set
# CONFIG_FB_MB862XX is not set
# CONFIG_FB_BROADSHEET is not set
# CONFIG_FB_AUO_K190X is not set
# CONFIG_FB_SIMPLE is not set
# CONFIG_FB_SM712 is not set
CONFIG_BACKLIGHT_LCD_SUPPORT=y
# CONFIG_LCD_CLASS_DEVICE is not set
CONFIG_BACKLIGHT_CLASS_DEVICE=y
CONFIG_BACKLIGHT_GENERIC=y
CONFIG_BACKLIGHT_LM3533=y
# CONFIG_BACKLIGHT_DA9052 is not set
# CONFIG_BACKLIGHT_PM8941_WLED is not set
CONFIG_BACKLIGHT_WM831X=y
# CONFIG_BACKLIGHT_ADP5520 is not set
# CONFIG_BACKLIGHT_ADP8860 is not set
CONFIG_BACKLIGHT_ADP8870=y
# CONFIG_BACKLIGHT_PCF50633 is not set
CONFIG_BACKLIGHT_LM3639=y
# CONFIG_BACKLIGHT_PANDORA is not set
# CONFIG_BACKLIGHT_SKY81452 is not set
CONFIG_BACKLIGHT_AS3711=y
CONFIG_BACKLIGHT_GPIO=y
CONFIG_BACKLIGHT_LV5207LP=y
# CONFIG_BACKLIGHT_BD6107 is not set
CONFIG_BACKLIGHT_ARCXCNN=y
# CONFIG_VGASTATE is not set
CONFIG_HDMI=y
# CONFIG_LOGO is not set
CONFIG_SOUND=y
# CONFIG_SOUND_OSS_CORE is not set
# CONFIG_SND is not set

#
# HID support
#
CONFIG_HID=y
CONFIG_HID_BATTERY_STRENGTH=y
CONFIG_HIDRAW=y
# CONFIG_UHID is not set
CONFIG_HID_GENERIC=y

#
# Special HID drivers
#
CONFIG_HID_A4TECH=y
CONFIG_HID_ACRUX=y
CONFIG_HID_ACRUX_FF=y
# CONFIG_HID_APPLE is not set
# CONFIG_HID_ASUS is not set
CONFIG_HID_AUREAL=y
CONFIG_HID_BELKIN=y
CONFIG_HID_CHERRY=y
# CONFIG_HID_CHICONY is not set
# CONFIG_HID_CORSAIR is not set
# CONFIG_HID_CMEDIA is not set
# CONFIG_HID_CYPRESS is not set
CONFIG_HID_DRAGONRISE=y
CONFIG_DRAGONRISE_FF=y
# CONFIG_HID_EMS_FF is not set
CONFIG_HID_ELECOM=y
CONFIG_HID_EZKEY=y
CONFIG_HID_GEMBIRD=y
# CONFIG_HID_GFRM is not set
# CONFIG_HID_KEYTOUCH is not set
# CONFIG_HID_KYE is not set
# CONFIG_HID_WALTOP is not set
CONFIG_HID_GYRATION=y
CONFIG_HID_ICADE=y
# CONFIG_HID_ITE is not set
CONFIG_HID_TWINHAN=y
CONFIG_HID_KENSINGTON=y
CONFIG_HID_LCPOWER=y
CONFIG_HID_LED=y
CONFIG_HID_LENOVO=y
# CONFIG_HID_LOGITECH is not set
CONFIG_HID_MAGICMOUSE=y
# CONFIG_HID_MAYFLASH is not set
# CONFIG_HID_MICROSOFT is not set
CONFIG_HID_MONTEREY=y
CONFIG_HID_MULTITOUCH=y
CONFIG_HID_NTI=y
CONFIG_HID_ORTEK=y
CONFIG_HID_PANTHERLORD=y
CONFIG_PANTHERLORD_FF=y
CONFIG_HID_PETALYNX=y
CONFIG_HID_PICOLCD=y
# CONFIG_HID_PICOLCD_FB is not set
CONFIG_HID_PICOLCD_BACKLIGHT=y
# CONFIG_HID_PICOLCD_LEDS is not set
# CONFIG_HID_PICOLCD_CIR is not set
CONFIG_HID_PLANTRONICS=y
CONFIG_HID_PRIMAX=y
# CONFIG_HID_SAITEK is not set
# CONFIG_HID_SAMSUNG is not set
# CONFIG_HID_SPEEDLINK is not set
CONFIG_HID_STEELSERIES=y
# CONFIG_HID_SUNPLUS is not set
CONFIG_HID_RMI=y
CONFIG_HID_GREENASIA=y
CONFIG_GREENASIA_FF=y
# CONFIG_HID_SMARTJOYPLUS is not set
CONFIG_HID_TIVO=y
CONFIG_HID_TOPSEED=y
CONFIG_HID_THINGM=y
# CONFIG_HID_THRUSTMASTER is not set
CONFIG_HID_UDRAW_PS3=y
# CONFIG_HID_WIIMOTE is not set
# CONFIG_HID_XINMO is not set
# CONFIG_HID_ZEROPLUS is not set
CONFIG_HID_ZYDACRON=y
# CONFIG_HID_SENSOR_HUB is not set
CONFIG_HID_ALPS=y

#
# USB HID support
#
# CONFIG_USB_HID is not set
# CONFIG_HID_PID is not set

#
# USB HID Boot Protocol drivers
#
CONFIG_USB_KBD=y
CONFIG_USB_MOUSE=y

#
# I2C HID support
#
# CONFIG_I2C_HID is not set

#
# Intel ISH HID support
#
# CONFIG_INTEL_ISH_HID is not set
CONFIG_USB_OHCI_LITTLE_ENDIAN=y
CONFIG_USB_SUPPORT=y
CONFIG_USB_COMMON=y
CONFIG_USB_ARCH_HAS_HCD=y
CONFIG_USB=y
CONFIG_USB_PCI=y
CONFIG_USB_ANNOUNCE_NEW_DEVICES=y

#
# Miscellaneous USB options
#
# CONFIG_USB_DEFAULT_PERSIST is not set
# CONFIG_USB_DYNAMIC_MINORS is not set
# CONFIG_USB_OTG_WHITELIST is not set
# CONFIG_USB_OTG_BLACKLIST_HUB is not set
CONFIG_USB_LEDS_TRIGGER_USBPORT=y
CONFIG_USB_MON=y
# CONFIG_USB_WUSB_CBAF is not set

#
# USB Host Controller Drivers
#
CONFIG_USB_C67X00_HCD=y
CONFIG_USB_XHCI_HCD=y
CONFIG_USB_XHCI_PCI=y
CONFIG_USB_XHCI_PLATFORM=y
# CONFIG_USB_XHCI_MTK is not set
# CONFIG_USB_XHCI_MVEBU is not set
# CONFIG_USB_XHCI_RCAR is not set
CONFIG_USB_EHCI_HCD=y
CONFIG_USB_EHCI_ROOT_HUB_TT=y
CONFIG_USB_EHCI_TT_NEWSCHED=y
CONFIG_USB_EHCI_PCI=y
CONFIG_USB_EHCI_HCD_PLATFORM=y
CONFIG_USB_OXU210HP_HCD=y
CONFIG_USB_ISP116X_HCD=y
# CONFIG_USB_ISP1362_HCD is not set
# CONFIG_USB_FOTG210_HCD is not set
CONFIG_USB_MAX3421_HCD=y
CONFIG_USB_OHCI_HCD=y
CONFIG_USB_OHCI_HCD_PCI=y
CONFIG_USB_OHCI_HCD_SSB=y
CONFIG_USB_OHCI_HCD_PLATFORM=y
# CONFIG_USB_UHCI_HCD is not set
CONFIG_USB_U132_HCD=y
CONFIG_USB_SL811_HCD=y
CONFIG_USB_SL811_HCD_ISO=y
# CONFIG_USB_R8A66597_HCD is not set
# CONFIG_USB_HCD_BCMA is not set
CONFIG_USB_HCD_SSB=y
CONFIG_USB_HCD_TEST_MODE=y

#
# USB Device Class drivers
#
CONFIG_USB_ACM=y
CONFIG_USB_PRINTER=y
CONFIG_USB_WDM=y
# CONFIG_USB_TMC is not set

#
# NOTE: USB_STORAGE depends on SCSI but BLK_DEV_SD may
#

#
# also be needed; see USB_STORAGE Help for more info
#
# CONFIG_USB_STORAGE is not set

#
# USB Imaging devices
#
CONFIG_USB_MDC800=y
CONFIG_USB_MICROTEK=y
# CONFIG_USB_MTU3 is not set
# CONFIG_USB_MUSB_HDRC is not set
CONFIG_USB_DWC3=y
# CONFIG_USB_DWC3_ULPI is not set
CONFIG_USB_DWC3_HOST=y

#
# Platform Glue Driver Support
#
CONFIG_USB_DWC3_KEYSTONE=y
CONFIG_USB_DWC2=y
CONFIG_USB_DWC2_HOST=y

#
# Gadget/Dual-role mode requires USB Gadget support to be enabled
#
CONFIG_USB_DWC2_PCI=y
CONFIG_USB_DWC2_DEBUG=y
# CONFIG_USB_DWC2_VERBOSE is not set
CONFIG_USB_DWC2_TRACK_MISSED_SOFS=y
# CONFIG_USB_DWC2_DEBUG_PERIODIC is not set
CONFIG_USB_CHIPIDEA=y
CONFIG_USB_CHIPIDEA_PCI=y
# CONFIG_USB_CHIPIDEA_HOST is not set
# CONFIG_USB_CHIPIDEA_ULPI is not set
# CONFIG_USB_ISP1760 is not set

#
# USB port drivers
#
CONFIG_USB_USS720=y
CONFIG_USB_SERIAL=y
CONFIG_USB_SERIAL_CONSOLE=y
# CONFIG_USB_SERIAL_GENERIC is not set
CONFIG_USB_SERIAL_SIMPLE=y
CONFIG_USB_SERIAL_AIRCABLE=y
# CONFIG_USB_SERIAL_ARK3116 is not set
CONFIG_USB_SERIAL_BELKIN=y
CONFIG_USB_SERIAL_CH341=y
CONFIG_USB_SERIAL_WHITEHEAT=y
CONFIG_USB_SERIAL_DIGI_ACCELEPORT=y
# CONFIG_USB_SERIAL_CP210X is not set
CONFIG_USB_SERIAL_CYPRESS_M8=y
CONFIG_USB_SERIAL_EMPEG=y
CONFIG_USB_SERIAL_FTDI_SIO=y
CONFIG_USB_SERIAL_VISOR=y
CONFIG_USB_SERIAL_IPAQ=y
CONFIG_USB_SERIAL_IR=y
CONFIG_USB_SERIAL_EDGEPORT=y
CONFIG_USB_SERIAL_EDGEPORT_TI=y
CONFIG_USB_SERIAL_F81232=y
CONFIG_USB_SERIAL_F8153X=y
# CONFIG_USB_SERIAL_GARMIN is not set
CONFIG_USB_SERIAL_IPW=y
CONFIG_USB_SERIAL_IUU=y
# CONFIG_USB_SERIAL_KEYSPAN_PDA is not set
# CONFIG_USB_SERIAL_KEYSPAN is not set
CONFIG_USB_SERIAL_KLSI=y
CONFIG_USB_SERIAL_KOBIL_SCT=y
CONFIG_USB_SERIAL_MCT_U232=y
CONFIG_USB_SERIAL_METRO=y
# CONFIG_USB_SERIAL_MOS7720 is not set
CONFIG_USB_SERIAL_MOS7840=y
CONFIG_USB_SERIAL_MXUPORT=y
CONFIG_USB_SERIAL_NAVMAN=y
CONFIG_USB_SERIAL_PL2303=y
CONFIG_USB_SERIAL_OTI6858=y
CONFIG_USB_SERIAL_QCAUX=y
CONFIG_USB_SERIAL_QUALCOMM=y
CONFIG_USB_SERIAL_SPCP8X5=y
# CONFIG_USB_SERIAL_SAFE is not set
CONFIG_USB_SERIAL_SIERRAWIRELESS=y
# CONFIG_USB_SERIAL_SYMBOL is not set
CONFIG_USB_SERIAL_TI=y
CONFIG_USB_SERIAL_CYBERJACK=y
# CONFIG_USB_SERIAL_XIRCOM is not set
CONFIG_USB_SERIAL_WWAN=y
# CONFIG_USB_SERIAL_OPTION is not set
CONFIG_USB_SERIAL_OMNINET=y
CONFIG_USB_SERIAL_OPTICON=y
CONFIG_USB_SERIAL_XSENS_MT=y
CONFIG_USB_SERIAL_WISHBONE=y
CONFIG_USB_SERIAL_SSU100=y
# CONFIG_USB_SERIAL_QT2 is not set
CONFIG_USB_SERIAL_UPD78F0730=y
# CONFIG_USB_SERIAL_DEBUG is not set

#
# USB Miscellaneous drivers
#
# CONFIG_USB_EMI62 is not set
# CONFIG_USB_EMI26 is not set
CONFIG_USB_ADUTUX=y
# CONFIG_USB_SEVSEG is not set
# CONFIG_USB_RIO500 is not set
# CONFIG_USB_LEGOTOWER is not set
# CONFIG_USB_LCD is not set
CONFIG_USB_CYPRESS_CY7C63=y
CONFIG_USB_CYTHERM=y
CONFIG_USB_IDMOUSE=y
CONFIG_USB_FTDI_ELAN=y
# CONFIG_USB_APPLEDISPLAY is not set
CONFIG_USB_SISUSBVGA=y
CONFIG_USB_LD=y
# CONFIG_USB_TRANCEVIBRATOR is not set
CONFIG_USB_IOWARRIOR=y
# CONFIG_USB_TEST is not set
# CONFIG_USB_EHSET_TEST_FIXTURE is not set
# CONFIG_USB_ISIGHTFW is not set
# CONFIG_USB_YUREX is not set
CONFIG_USB_EZUSB_FX2=y
# CONFIG_USB_HUB_USB251XB is not set
# CONFIG_USB_HSIC_USB3503 is not set
CONFIG_USB_HSIC_USB4604=y
CONFIG_USB_LINK_LAYER_TEST=y

#
# USB Physical Layer drivers
#
CONFIG_USB_PHY=y
# CONFIG_KEYSTONE_USB_PHY is not set
CONFIG_NOP_USB_XCEIV=y
# CONFIG_AM335X_PHY_USB is not set
# CONFIG_USB_GPIO_VBUS is not set
CONFIG_TAHVO_USB=y
# CONFIG_TAHVO_USB_HOST_BY_DEFAULT is not set
# CONFIG_USB_ISP1301 is not set
# CONFIG_USB_MSM_OTG is not set
# CONFIG_USB_QCOM_8X16_PHY is not set
# CONFIG_DUAL_ROLE_USB_INTF is not set
# CONFIG_USB_GADGET is not set

#
# USB Power Delivery and Type-C drivers
#
CONFIG_TYPEC=y
CONFIG_USB_LED_TRIG=y
CONFIG_USB_ULPI_BUS=y
# CONFIG_UWB is not set
# CONFIG_MMC is not set
CONFIG_MEMSTICK=y
CONFIG_MEMSTICK_DEBUG=y

#
# MemoryStick drivers
#
CONFIG_MEMSTICK_UNSAFE_RESUME=y
CONFIG_MSPRO_BLOCK=y
CONFIG_MS_BLOCK=y

#
# MemoryStick Host Controller Drivers
#
# CONFIG_MEMSTICK_TIFM_MS is not set
# CONFIG_MEMSTICK_JMICRON_38X is not set
CONFIG_MEMSTICK_R592=y
CONFIG_NEW_LEDS=y
CONFIG_LEDS_CLASS=y
CONFIG_LEDS_CLASS_FLASH=y
# CONFIG_LEDS_BRIGHTNESS_HW_CHANGED is not set

#
# LED drivers
#
CONFIG_LEDS_AS3645A=y
CONFIG_LEDS_LM3530=y
# CONFIG_LEDS_LM3533 is not set
CONFIG_LEDS_LM3642=y
CONFIG_LEDS_PCA9532=y
# CONFIG_LEDS_PCA9532_GPIO is not set
CONFIG_LEDS_GPIO=y
CONFIG_LEDS_LP3944=y
CONFIG_LEDS_LP3952=y
# CONFIG_LEDS_LP5521 is not set
# CONFIG_LEDS_LP5523 is not set
# CONFIG_LEDS_LP5562 is not set
# CONFIG_LEDS_LP8501 is not set
# CONFIG_LEDS_LP8860 is not set
# CONFIG_LEDS_PCA955X is not set
CONFIG_LEDS_PCA963X=y
CONFIG_LEDS_WM831X_STATUS=y
# CONFIG_LEDS_WM8350 is not set
CONFIG_LEDS_DA9052=y
CONFIG_LEDS_DAC124S085=y
CONFIG_LEDS_REGULATOR=y
CONFIG_LEDS_BD2802=y
# CONFIG_LEDS_LT3593 is not set
CONFIG_LEDS_ADP5520=y
CONFIG_LEDS_MC13783=y
CONFIG_LEDS_TCA6507=y
CONFIG_LEDS_TLC591XX=y
CONFIG_LEDS_LM355x=y
# CONFIG_LEDS_OT200 is not set
# CONFIG_LEDS_MENF21BMC is not set

#
# LED driver for blink(1) USB RGB LED is under Special HID drivers (HID_THINGM)
#
# CONFIG_LEDS_BLINKM is not set
CONFIG_LEDS_USER=y

#
# LED Triggers
#
CONFIG_LEDS_TRIGGERS=y
CONFIG_LEDS_TRIGGER_TIMER=y
CONFIG_LEDS_TRIGGER_ONESHOT=y
CONFIG_LEDS_TRIGGER_DISK=y
CONFIG_LEDS_TRIGGER_MTD=y
CONFIG_LEDS_TRIGGER_HEARTBEAT=y
CONFIG_LEDS_TRIGGER_BACKLIGHT=y
# CONFIG_LEDS_TRIGGER_CPU is not set
# CONFIG_LEDS_TRIGGER_GPIO is not set
CONFIG_LEDS_TRIGGER_DEFAULT_ON=y

#
# iptables trigger is under Netfilter config (LED target)
#
CONFIG_LEDS_TRIGGER_TRANSIENT=y
CONFIG_LEDS_TRIGGER_CAMERA=y
CONFIG_LEDS_TRIGGER_PANIC=y
CONFIG_ACCESSIBILITY=y
CONFIG_DMADEVICES=y
CONFIG_DMADEVICES_DEBUG=y
CONFIG_DMADEVICES_VDEBUG=y

#
# DMA Devices
#
CONFIG_DMA_ENGINE=y
CONFIG_DMA_VIRTUAL_CHANNELS=y
CONFIG_ALTERA_MSGDMA=y
# CONFIG_AXI_DMAC is not set
# CONFIG_COH901318 is not set
# CONFIG_DMA_JZ4740 is not set
# CONFIG_DMA_JZ4780 is not set
# CONFIG_DMA_OMAP is not set
# CONFIG_DMA_SA11X0 is not set
# CONFIG_DMA_SUN6I is not set
# CONFIG_EP93XX_DMA is not set
# CONFIG_IMG_MDC_DMA is not set
CONFIG_INTEL_IDMA64=y
# CONFIG_K3_DMA is not set
# CONFIG_MMP_PDMA is not set
# CONFIG_MMP_TDMA is not set
# CONFIG_MV_XOR is not set
# CONFIG_MXS_DMA is not set
# CONFIG_NBPFAXI_DMA is not set
# CONFIG_PCH_DMA is not set
# CONFIG_STM32_DMA is not set
# CONFIG_S3C24XX_DMAC is not set
# CONFIG_TIMB_DMA is not set
# CONFIG_TI_EDMA is not set
# CONFIG_XGENE_DMA is not set
# CONFIG_ZX_DMA is not set
CONFIG_QCOM_HIDMA_MGMT=y
CONFIG_QCOM_HIDMA=y
CONFIG_DW_DMAC_CORE=y
CONFIG_DW_DMAC=y
CONFIG_DW_DMAC_PCI=y
CONFIG_RENESAS_DMA=y
CONFIG_SH_DMAE_BASE=y
# CONFIG_SH_DMAE is not set
# CONFIG_RCAR_DMAC is not set
# CONFIG_RENESAS_USB_DMAC is not set
# CONFIG_SUDMAC is not set

#
# DMA Clients
#
CONFIG_ASYNC_TX_DMA=y
CONFIG_DMATEST=y
CONFIG_DMA_ENGINE_RAID=y

#
# DMABUF options
#
CONFIG_SYNC_FILE=y
CONFIG_SW_SYNC=y
CONFIG_AUXDISPLAY=y
# CONFIG_HD44780 is not set
# CONFIG_IMG_ASCII_LCD is not set
CONFIG_PANEL=y
CONFIG_PANEL_PARPORT=0
CONFIG_PANEL_PROFILE=5
CONFIG_PANEL_CHANGE_MESSAGE=y
CONFIG_PANEL_BOOT_MESSAGE=""
CONFIG_CHARLCD=y
CONFIG_UIO=y
# CONFIG_UIO_CIF is not set
CONFIG_UIO_PDRV_GENIRQ=y
CONFIG_UIO_DMEM_GENIRQ=y
# CONFIG_UIO_AEC is not set
CONFIG_UIO_SERCOS3=y
CONFIG_UIO_PCI_GENERIC=y
CONFIG_UIO_NETX=y
# CONFIG_UIO_PRUSS is not set
CONFIG_UIO_MF624=y
CONFIG_VFIO_IOMMU_TYPE1=y
CONFIG_VFIO_VIRQFD=y
CONFIG_VFIO=y
# CONFIG_VFIO_NOIOMMU is not set
CONFIG_VFIO_PCI=y
# CONFIG_VFIO_MDEV is not set
CONFIG_IRQ_BYPASS_MANAGER=y
CONFIG_VIRT_DRIVERS=y
CONFIG_VIRTIO=y

#
# Virtio drivers
#
# CONFIG_VIRTIO_PCI is not set
# CONFIG_VIRTIO_BALLOON is not set
# CONFIG_VIRTIO_INPUT is not set
# CONFIG_VIRTIO_MMIO is not set
# CONFIG_VIRTIO_WL is not set

#
# Microsoft Hyper-V guest support
#
# CONFIG_HYPERV_TSCPAGE is not set
CONFIG_STAGING=y
# CONFIG_COMEDI is not set
CONFIG_RTS5208=y

#
# IIO staging drivers
#

#
# Accelerometers
#
CONFIG_ADIS16201=y
# CONFIG_ADIS16203 is not set
# CONFIG_ADIS16209 is not set
# CONFIG_ADIS16240 is not set

#
# Analog to digital converters
#
# CONFIG_AD7606 is not set
# CONFIG_AD7780 is not set
CONFIG_AD7816=y
CONFIG_AD7192=y
CONFIG_AD7280=y

#
# Analog digital bi-direction converters
#
# CONFIG_ADT7316 is not set

#
# Capacitance to digital converters
#
CONFIG_AD7150=y
# CONFIG_AD7152 is not set
CONFIG_AD7746=y

#
# Direct Digital Synthesis
#
CONFIG_AD9832=y
CONFIG_AD9834=y

#
# Digital gyroscope sensors
#
# CONFIG_ADIS16060 is not set

#
# Network Analyzer, Impedance Converters
#
# CONFIG_AD5933 is not set

#
# Light sensors
#
# CONFIG_TSL2x7x is not set

#
# Active energy metering IC
#
# CONFIG_ADE7753 is not set
# CONFIG_ADE7754 is not set
# CONFIG_ADE7758 is not set
# CONFIG_ADE7759 is not set
CONFIG_ADE7854=y
CONFIG_ADE7854_I2C=y
CONFIG_ADE7854_SPI=y

#
# Resolver to digital converters
#
# CONFIG_AD2S90 is not set
# CONFIG_AD2S1200 is not set
# CONFIG_AD2S1210 is not set

#
# Triggers - standalone
#
# CONFIG_FB_SM750 is not set
# CONFIG_FB_XGI is not set

#
# Speakup console speech
#
CONFIG_STAGING_MEDIA=y

#
# Android
#
# CONFIG_DGNC is not set
# CONFIG_GS_FPGABOOT is not set
# CONFIG_FB_TFT is not set
CONFIG_MOST=y
CONFIG_MOSTCORE=y
# CONFIG_AIM_CDEV is not set
# CONFIG_HDM_DIM2 is not set
# CONFIG_HDM_I2C is not set
CONFIG_GREYBUS=y
CONFIG_GREYBUS_ES2=y
# CONFIG_GREYBUS_AUDIO is not set
CONFIG_GREYBUS_BOOTROM=y
CONFIG_GREYBUS_FIRMWARE=y
CONFIG_GREYBUS_HID=y
# CONFIG_GREYBUS_LIGHT is not set
CONFIG_GREYBUS_LOG=y
CONFIG_GREYBUS_LOOPBACK=y
# CONFIG_GREYBUS_POWER is not set
CONFIG_GREYBUS_RAW=y
CONFIG_GREYBUS_VIBRATOR=y
# CONFIG_GREYBUS_BRIDGED_PHY is not set
# CONFIG_GREYBUS_ARCHE is not set

#
# USB Power Delivery and Type-C drivers
#
CONFIG_TYPEC_TCPM=y
CONFIG_TYPEC_TCPCI=y
# CONFIG_TYPEC_FUSB302 is not set
CONFIG_PI433=y
# CONFIG_CHROME_PLATFORMS is not set
CONFIG_HWSPINLOCK=y

#
# Clock Source drivers
#
# CONFIG_BCM2835_TIMER is not set
# CONFIG_BCM_KONA_TIMER is not set
# CONFIG_DIGICOLOR_TIMER is not set
# CONFIG_DW_APB_TIMER is not set
# CONFIG_FTTMR010_TIMER is not set
# CONFIG_MESON6_TIMER is not set
# CONFIG_OWL_TIMER is not set
# CONFIG_SUN4I_TIMER is not set
# CONFIG_VT8500_TIMER is not set
# CONFIG_ASM9260_TIMER is not set
# CONFIG_CLKSRC_DBX500_PRCMU is not set
# CONFIG_CLPS711X_TIMER is not set
# CONFIG_ATLAS7_TIMER is not set
# CONFIG_MXS_TIMER is not set
# CONFIG_PRIMA2_TIMER is not set
# CONFIG_NSPIRE_TIMER is not set
# CONFIG_INTEGRATOR_AP_TIMER is not set
# CONFIG_CLKSRC_PISTACHIO is not set
# CONFIG_ARC_TIMERS is not set
# CONFIG_ARMV7M_SYSTICK is not set
# CONFIG_ATMEL_PIT is not set
# CONFIG_ATMEL_ST is not set
# CONFIG_CLKSRC_SAMSUNG_PWM is not set
# CONFIG_FSL_FTM_TIMER is not set
# CONFIG_OXNAS_RPS_TIMER is not set
# CONFIG_MTK_TIMER is not set
# CONFIG_SH_TIMER_CMT is not set
# CONFIG_SH_TIMER_MTU2 is not set
# CONFIG_RENESAS_OSTM is not set
# CONFIG_SH_TIMER_TMU is not set
# CONFIG_EM_TIMER_STI is not set
# CONFIG_CLKSRC_PXA is not set
# CONFIG_H8300_TMR8 is not set
# CONFIG_H8300_TMR16 is not set
# CONFIG_H8300_TPU is not set
# CONFIG_CLKSRC_ST_LPC is not set
# CONFIG_MAILBOX is not set
CONFIG_IOMMU_API=y
CONFIG_IOMMU_SUPPORT=y

#
# Generic IOMMU Pagetable Support
#
# CONFIG_IOMMU_IO_PGTABLE_LPAE is not set
# CONFIG_IOMMU_IO_PGTABLE_ARMV7S is not set
CONFIG_S390_IOMMU=y
# CONFIG_S390_CCW_IOMMU is not set
# CONFIG_QCOM_IOMMU is not set

#
# Remoteproc drivers
#
CONFIG_REMOTEPROC=y

#
# Rpmsg drivers
#

#
# SOC (System On Chip) specific Drivers
#

#
# Amlogic SoC drivers
#
# CONFIG_MESON_GX_SOCINFO is not set
# CONFIG_AT91_SOC_ID is not set

#
# Broadcom SoC drivers
#
# CONFIG_SOC_BRCMSTB is not set

#
# i.MX SoC drivers
#
# CONFIG_MTK_INFRACFG is not set
# CONFIG_MTK_SCPSYS is not set

#
# Qualcomm SoC drivers
#
# CONFIG_QCOM_GENI_SE is not set
# CONFIG_QCOM_RPMH is not set
# CONFIG_SOC_RENESAS is not set
CONFIG_ROCKCHIP_GRF=y
# CONFIG_SOC_SAMSUNG is not set
# CONFIG_SUNXI_SRAM is not set
# CONFIG_SOC_TI is not set
# CONFIG_UX500_SOC_ID is not set
# CONFIG_SOC_ZTE is not set
CONFIG_PM_DEVFREQ=y

#
# DEVFREQ Governors
#
CONFIG_DEVFREQ_GOV_SIMPLE_ONDEMAND=y
CONFIG_DEVFREQ_GOV_PERFORMANCE=y
CONFIG_DEVFREQ_GOV_POWERSAVE=y
CONFIG_DEVFREQ_GOV_USERSPACE=y
CONFIG_DEVFREQ_GOV_PASSIVE=y

#
# DEVFREQ Drivers
#
# CONFIG_ARM_EXYNOS_BUS_DEVFREQ is not set
CONFIG_PM_DEVFREQ_EVENT=y
# CONFIG_DEVFREQ_EVENT_EXYNOS_NOCP is not set
# CONFIG_DEVFREQ_EVENT_EXYNOS_PPMU is not set
CONFIG_EXTCON=y

#
# Extcon Device Drivers
#
CONFIG_EXTCON_ADC_JACK=y
# CONFIG_EXTCON_AXP288 is not set
CONFIG_EXTCON_GPIO=y
CONFIG_EXTCON_MAX14577=y
# CONFIG_EXTCON_MAX3355 is not set
# CONFIG_EXTCON_MAX77693 is not set
CONFIG_EXTCON_MAX77843=y
CONFIG_EXTCON_PALMAS=y
# CONFIG_EXTCON_QCOM_SPMI_MISC is not set
# CONFIG_EXTCON_RT8973A is not set
# CONFIG_EXTCON_SM5502 is not set
# CONFIG_EXTCON_USB_GPIO is not set
CONFIG_MEMORY=y
# CONFIG_SAMSUNG_MC is not set
CONFIG_IIO=y
CONFIG_IIO_BUFFER=y
CONFIG_IIO_BUFFER_CB=y
CONFIG_IIO_KFIFO_BUF=y
CONFIG_IIO_TRIGGERED_BUFFER=y
CONFIG_IIO_CONFIGFS=y
CONFIG_IIO_TRIGGER=y
CONFIG_IIO_CONSUMERS_PER_TRIGGER=2
# CONFIG_IIO_SW_DEVICE is not set
CONFIG_IIO_SW_TRIGGER=y

#
# Accelerometers
#
# CONFIG_BMA180 is not set
# CONFIG_BMA220 is not set
CONFIG_BMC150_ACCEL=y
CONFIG_BMC150_ACCEL_I2C=y
CONFIG_BMC150_ACCEL_SPI=y
CONFIG_DA280=y
CONFIG_DA311=y
CONFIG_DMARD06=y
CONFIG_DMARD09=y
CONFIG_DMARD10=y
# CONFIG_IIO_CROS_EC_ACCEL_LEGACY is not set
CONFIG_IIO_ST_ACCEL_3AXIS=y
CONFIG_IIO_ST_ACCEL_I2C_3AXIS=y
CONFIG_IIO_ST_ACCEL_SPI_3AXIS=y
CONFIG_KXSD9=y
CONFIG_KXSD9_SPI=y
CONFIG_KXSD9_I2C=y
# CONFIG_KXCJK1013 is not set
# CONFIG_MC3230 is not set
CONFIG_MMA7455=y
CONFIG_MMA7455_I2C=y
CONFIG_MMA7455_SPI=y
CONFIG_MMA7660=y
CONFIG_MMA8452=y
CONFIG_MMA9551_CORE=y
CONFIG_MMA9551=y
# CONFIG_MMA9553 is not set
# CONFIG_MXC4005 is not set
CONFIG_MXC6255=y
CONFIG_SCA3000=y
# CONFIG_STK8312 is not set
# CONFIG_STK8BA50 is not set

#
# Analog to digital converters
#
CONFIG_AD_SIGMA_DELTA=y
# CONFIG_AD7266 is not set
# CONFIG_AD7291 is not set
# CONFIG_AD7298 is not set
# CONFIG_AD7476 is not set
CONFIG_AD7766=y
CONFIG_AD7791=y
CONFIG_AD7793=y
CONFIG_AD7887=y
CONFIG_AD7923=y
CONFIG_AD799X=y
# CONFIG_AT91_SAMA5D2_ADC is not set
CONFIG_AXP20X_ADC=y
CONFIG_AXP288_ADC=y
# CONFIG_BCM_IPROC_ADC is not set
# CONFIG_DLN2_ADC is not set
# CONFIG_HI8435 is not set
CONFIG_HX711=y
# CONFIG_IMX7D_ADC is not set
# CONFIG_LPC32XX_ADC is not set
CONFIG_LTC2471=y
CONFIG_LTC2485=y
CONFIG_LTC2497=y
CONFIG_MAX1027=y
CONFIG_MAX11100=y
# CONFIG_MAX1118 is not set
CONFIG_MAX1363=y
# CONFIG_MAX9611 is not set
CONFIG_MCP320X=y
CONFIG_MCP3422=y
# CONFIG_MEDIATEK_MT6577_AUXADC is not set
CONFIG_MEN_Z188_ADC=y
CONFIG_NAU7802=y
# CONFIG_PALMAS_GPADC is not set
# CONFIG_SPEAR_ADC is not set
CONFIG_TI_ADC081C=y
CONFIG_TI_ADC0832=y
CONFIG_TI_ADC084S021=y
CONFIG_TI_ADC12138=y
CONFIG_TI_ADC108S102=y
CONFIG_TI_ADC128S052=y
CONFIG_TI_ADC161S626=y
CONFIG_TI_ADS1015=y
# CONFIG_TI_ADS7950 is not set
# CONFIG_TI_TLC4541 is not set
CONFIG_TWL4030_MADC=y
CONFIG_TWL6030_GPADC=y
CONFIG_VIPERBOARD_ADC=y
# CONFIG_XILINX_XADC is not set

#
# Amplifiers
#
# CONFIG_AD8366 is not set

#
# Chemical Sensors
#
CONFIG_ATLAS_PH_SENSOR=y
# CONFIG_CCS811 is not set
CONFIG_IAQCORE=y
# CONFIG_VZ89X is not set

#
# Hid Sensor IIO Common
#
CONFIG_IIO_MS_SENSORS_I2C=y

#
# SSP Sensor Common
#
CONFIG_IIO_SSP_SENSORS_COMMONS=y
CONFIG_IIO_SSP_SENSORHUB=y
CONFIG_IIO_ST_SENSORS_I2C=y
CONFIG_IIO_ST_SENSORS_SPI=y
CONFIG_IIO_ST_SENSORS_CORE=y

#
# Counters
#
# CONFIG_STM32_LPTIMER_CNT is not set

#
# Digital to analog converters
#
CONFIG_AD5064=y
CONFIG_AD5360=y
# CONFIG_AD5380 is not set
CONFIG_AD5421=y
CONFIG_AD5446=y
CONFIG_AD5449=y
CONFIG_AD5592R_BASE=y
CONFIG_AD5592R=y
CONFIG_AD5593R=y
CONFIG_AD5504=y
CONFIG_AD5624R_SPI=y
CONFIG_LTC2632=y
CONFIG_AD5686=y
CONFIG_AD5755=y
# CONFIG_AD5761 is not set
# CONFIG_AD5764 is not set
CONFIG_AD5791=y
CONFIG_AD7303=y
CONFIG_AD8801=y
CONFIG_M62332=y
CONFIG_MAX517=y
# CONFIG_MCP4725 is not set
# CONFIG_MCP4922 is not set
# CONFIG_STM32_DAC is not set

#
# IIO dummy driver
#

#
# Frequency Synthesizers DDS/PLL
#

#
# Clock Generator/Distribution
#
CONFIG_AD9523=y

#
# Phase-Locked Loop (PLL) frequency synthesizers
#
CONFIG_ADF4350=y

#
# Digital gyroscope sensors
#
CONFIG_ADIS16080=y
# CONFIG_ADIS16130 is not set
CONFIG_ADIS16136=y
CONFIG_ADIS16260=y
CONFIG_ADXRS450=y
CONFIG_BMG160=y
CONFIG_BMG160_I2C=y
CONFIG_BMG160_SPI=y
CONFIG_MPU3050=y
CONFIG_MPU3050_I2C=y
CONFIG_IIO_ST_GYRO_3AXIS=y
CONFIG_IIO_ST_GYRO_I2C_3AXIS=y
CONFIG_IIO_ST_GYRO_SPI_3AXIS=y
CONFIG_ITG3200=y

#
# Health Sensors
#

#
# Heart Rate Monitors
#
CONFIG_AFE4403=y
CONFIG_AFE4404=y
# CONFIG_MAX30100 is not set
CONFIG_MAX30102=y

#
# Humidity sensors
#
# CONFIG_AM2315 is not set
# CONFIG_DHT11 is not set
CONFIG_HDC100X=y
CONFIG_HTS221=y
CONFIG_HTS221_I2C=y
CONFIG_HTS221_SPI=y
CONFIG_HTU21=y
# CONFIG_SI7005 is not set
# CONFIG_SI7020 is not set

#
# Inertial measurement units
#
CONFIG_ADIS16400=y
# CONFIG_ADIS16480 is not set
CONFIG_BMI160=y
CONFIG_BMI160_I2C=y
# CONFIG_BMI160_SPI is not set
# CONFIG_KMX61 is not set
# CONFIG_INV_MPU6050_I2C is not set
# CONFIG_INV_MPU6050_SPI is not set
CONFIG_IIO_ST_LSM6DSX=y
CONFIG_IIO_ST_LSM6DSX_I2C=y
CONFIG_IIO_ST_LSM6DSX_SPI=y
CONFIG_IIO_ADIS_LIB=y
CONFIG_IIO_ADIS_LIB_BUFFER=y

#
# Light sensors
#
CONFIG_ADJD_S311=y
CONFIG_AL3320A=y
# CONFIG_APDS9300 is not set
# CONFIG_APDS9960 is not set
# CONFIG_BH1750 is not set
# CONFIG_BH1780 is not set
# CONFIG_CM32181 is not set
# CONFIG_CM3232 is not set
CONFIG_CM3323=y
CONFIG_CM36651=y
# CONFIG_GP2AP020A00F is not set
CONFIG_SENSORS_ISL29018=y
# CONFIG_SENSORS_ISL29028 is not set
CONFIG_ISL29125=y
CONFIG_JSA1212=y
CONFIG_RPR0521=y
CONFIG_SENSORS_LM3533=y
CONFIG_LTR501=y
# CONFIG_MAX44000 is not set
CONFIG_OPT3001=y
# CONFIG_PA12203001 is not set
CONFIG_SI1145=y
CONFIG_STK3310=y
CONFIG_TCS3414=y
CONFIG_TCS3472=y
CONFIG_SENSORS_TSL2563=y
CONFIG_TSL2583=y
CONFIG_TSL4531=y
# CONFIG_US5182D is not set
CONFIG_VCNL4000=y
CONFIG_VEML6070=y
CONFIG_VL6180=y

#
# Magnetometer sensors
#
CONFIG_AK8975=y
CONFIG_AK09911=y
CONFIG_BMC150_MAGN=y
# CONFIG_BMC150_MAGN_I2C is not set
CONFIG_BMC150_MAGN_SPI=y
CONFIG_MAG3110=y
CONFIG_MMC35240=y
CONFIG_IIO_ST_MAGN_3AXIS=y
CONFIG_IIO_ST_MAGN_I2C_3AXIS=y
CONFIG_IIO_ST_MAGN_SPI_3AXIS=y
CONFIG_SENSORS_HMC5843=y
CONFIG_SENSORS_HMC5843_I2C=y
CONFIG_SENSORS_HMC5843_SPI=y

#
# Multiplexers
#
# CONFIG_IIO_MUX is not set

#
# Inclinometer sensors
#

#
# Triggers - standalone
#
# CONFIG_IIO_HRTIMER_TRIGGER is not set
CONFIG_IIO_INTERRUPT_TRIGGER=y
# CONFIG_IIO_STM32_LPTIMER_TRIGGER is not set
# CONFIG_IIO_STM32_TIMER_TRIGGER is not set
# CONFIG_IIO_TIGHTLOOP_TRIGGER is not set
CONFIG_IIO_SYSFS_TRIGGER=y

#
# Digital potentiometers
#
# CONFIG_DS1803 is not set
CONFIG_MAX5481=y
# CONFIG_MAX5487 is not set
CONFIG_MCP4131=y
# CONFIG_MCP4531 is not set
CONFIG_TPL0102=y

#
# Digital potentiostats
#
# CONFIG_LMP91000 is not set

#
# Pressure sensors
#
# CONFIG_ABP060MG is not set
# CONFIG_BMP280 is not set
CONFIG_HP03=y
CONFIG_MPL115=y
CONFIG_MPL115_I2C=y
# CONFIG_MPL115_SPI is not set
# CONFIG_MPL3115 is not set
CONFIG_MS5611=y
# CONFIG_MS5611_I2C is not set
CONFIG_MS5611_SPI=y
# CONFIG_MS5637 is not set
CONFIG_IIO_ST_PRESS=y
CONFIG_IIO_ST_PRESS_I2C=y
CONFIG_IIO_ST_PRESS_SPI=y
CONFIG_T5403=y
CONFIG_HP206C=y
# CONFIG_ZPA2326 is not set

#
# Lightning sensors
#
CONFIG_AS3935=y

#
# Proximity and distance sensors
#
CONFIG_LIDAR_LITE_V2=y
# CONFIG_SRF04 is not set
CONFIG_SX9500=y
CONFIG_SRF08=y

#
# Temperature sensors
#
# CONFIG_MAXIM_THERMOCOUPLE is not set
CONFIG_MLX90614=y
# CONFIG_TMP006 is not set
# CONFIG_TMP007 is not set
CONFIG_TSYS01=y
CONFIG_TSYS02D=y
CONFIG_NTB=y
CONFIG_NTB_IDT=y
CONFIG_NTB_PINGPONG=y
CONFIG_NTB_TOOL=y
CONFIG_NTB_PERF=y
CONFIG_NTB_TRANSPORT=y
CONFIG_VME_BUS=y

#
# VME Bridge Drivers
#
# CONFIG_VME_CA91CX42 is not set
# CONFIG_VME_TSI148 is not set
CONFIG_VME_FAKE=y

#
# VME Board Drivers
#
# CONFIG_VMIVME_7805 is not set

#
# VME Device Drivers
#
CONFIG_VME_USER=y
# CONFIG_VME_PIO2 is not set
# CONFIG_PWM is not set
CONFIG_ARM_GIC_MAX_NR=1
# CONFIG_TS4800_IRQ is not set
# CONFIG_IRQ_UNIPHIER_AIDET is not set
CONFIG_IPACK_BUS=y
CONFIG_BOARD_TPCI200=y
# CONFIG_SERIAL_IPOCTAL is not set
CONFIG_RESET_CONTROLLER=y
# CONFIG_RESET_ATH79 is not set
# CONFIG_RESET_BERLIN is not set
# CONFIG_RESET_HSDK is not set
# CONFIG_RESET_IMX7 is not set
# CONFIG_RESET_LANTIQ is not set
# CONFIG_RESET_LPC18XX is not set
# CONFIG_RESET_MESON is not set
# CONFIG_RESET_PISTACHIO is not set
# CONFIG_RESET_SOCFPGA is not set
# CONFIG_RESET_STM32 is not set
# CONFIG_RESET_SUNXI is not set
CONFIG_RESET_TI_SYSCON=y
# CONFIG_RESET_ZX2967 is not set
# CONFIG_RESET_ZYNQ is not set
# CONFIG_COMMON_RESET_HI3660 is not set
# CONFIG_COMMON_RESET_HI6220 is not set
# CONFIG_RESET_TEGRA_BPMP is not set
# CONFIG_FMC is not set

#
# PHY Subsystem
#
CONFIG_GENERIC_PHY=y
CONFIG_BCM_KONA_USB2_PHY=y
# CONFIG_PHY_HI6220_USB is not set
CONFIG_PHY_PXA_28NM_HSIC=y
# CONFIG_PHY_PXA_28NM_USB2 is not set
CONFIG_PHY_CPCAP_USB=y
CONFIG_PHY_QCOM_USB_HS=y
# CONFIG_PHY_QCOM_USB_HSIC is not set
# CONFIG_PHY_RALINK_USB is not set
# CONFIG_PHY_RCAR_GEN3_USB3 is not set
# CONFIG_PHY_ROCKCHIP_PCIE is not set
# CONFIG_PHY_EXYNOS_MIPI_VIDEO is not set
CONFIG_PHY_SAMSUNG_USB2=y
# CONFIG_PHY_EXYNOS4210_USB2 is not set
# CONFIG_PHY_EXYNOS4X12_USB2 is not set
# CONFIG_PHY_EXYNOS5250_USB2 is not set
# CONFIG_PHY_ST_SPEAR1310_MIPHY is not set
# CONFIG_PHY_ST_SPEAR1340_MIPHY is not set
# CONFIG_PHY_STIH407_USB is not set
# CONFIG_OMAP_CONTROL_PHY is not set
# CONFIG_PHY_TUSB1210 is not set
# CONFIG_POWERCAP is not set
CONFIG_MCB=y
CONFIG_MCB_PCI=y
CONFIG_MCB_LPC=y
CONFIG_RAS=y
# CONFIG_THUNDERBOLT is not set

#
# Android
#
# CONFIG_ANDROID is not set
CONFIG_DAX=y
# CONFIG_DEV_DAX is not set
CONFIG_NVMEM=y
# CONFIG_NVMEM_IMX_IIM is not set
# CONFIG_NVMEM_IMX_OCOTP is not set
# CONFIG_NVMEM_LPC18XX_EEPROM is not set
# CONFIG_NVMEM_LPC18XX_OTP is not set
# CONFIG_NVMEM_MXS_OCOTP is not set
# CONFIG_MTK_EFUSE is not set
# CONFIG_QCOM_QFPROM is not set
# CONFIG_ROCKCHIP_EFUSE is not set
# CONFIG_NVMEM_BCM_OCOTP is not set
# CONFIG_NVMEM_VF610_OCOTP is not set
# CONFIG_STM is not set
# CONFIG_INTEL_TH is not set
# CONFIG_FPGA is not set

#
# FSI support
#
# CONFIG_FSI is not set
# CONFIG_TEE is not set
CONFIG_PM_OPP=y
# CONFIG_PKGLIST is not set
# CONFIG_DRM_EVDI is not set

#
# File systems
#
CONFIG_FS_IOMAP=y
# CONFIG_EXT2_FS is not set
# CONFIG_EXT3_FS is not set
# CONFIG_EXT4_FS is not set
# CONFIG_REISERFS_FS is not set
CONFIG_JFS_FS=y
CONFIG_JFS_POSIX_ACL=y
# CONFIG_JFS_SECURITY is not set
# CONFIG_JFS_DEBUG is not set
# CONFIG_JFS_STATISTICS is not set
CONFIG_XFS_FS=y
CONFIG_XFS_QUOTA=y
# CONFIG_XFS_POSIX_ACL is not set
# CONFIG_XFS_RT is not set
# CONFIG_XFS_WARN is not set
# CONFIG_XFS_DEBUG is not set
CONFIG_GFS2_FS=y
CONFIG_BTRFS_FS=y
# CONFIG_BTRFS_FS_POSIX_ACL is not set
# CONFIG_BTRFS_FS_CHECK_INTEGRITY is not set
CONFIG_BTRFS_FS_RUN_SANITY_TESTS=y
# CONFIG_BTRFS_DEBUG is not set
# CONFIG_BTRFS_ASSERT is not set
CONFIG_NILFS2_FS=y
CONFIG_F2FS_FS=y
CONFIG_F2FS_STAT_FS=y
# CONFIG_F2FS_FS_XATTR is not set
# CONFIG_F2FS_CHECK_FS is not set
# CONFIG_F2FS_IO_TRACE is not set
# CONFIG_F2FS_FAULT_INJECTION is not set
# CONFIG_FS_DAX is not set
CONFIG_FS_POSIX_ACL=y
CONFIG_EXPORTFS=y
# CONFIG_EXPORTFS_BLOCK_OPS is not set
CONFIG_FILE_LOCKING=y
CONFIG_MANDATORY_FILE_LOCKING=y
# CONFIG_FS_ENCRYPTION is not set
CONFIG_FSNOTIFY=y
# CONFIG_DNOTIFY is not set
CONFIG_INOTIFY_USER=y
CONFIG_FANOTIFY=y
CONFIG_QUOTA=y
# CONFIG_PRINT_QUOTA_WARNING is not set
CONFIG_QUOTA_DEBUG=y
CONFIG_QUOTA_TREE=y
CONFIG_QFMT_V1=y
CONFIG_QFMT_V2=y
CONFIG_QUOTACTL=y
# CONFIG_AUTOFS4_FS is not set
CONFIG_FUSE_FS=y
# CONFIG_CUSE is not set
# CONFIG_OVERLAY_FS is not set

#
# Caches
#
CONFIG_FSCACHE=y
CONFIG_FSCACHE_STATS=y
# CONFIG_FSCACHE_HISTOGRAM is not set
# CONFIG_FSCACHE_DEBUG is not set
# CONFIG_FSCACHE_OBJECT_LIST is not set
CONFIG_CACHEFILES=y
# CONFIG_CACHEFILES_DEBUG is not set
# CONFIG_CACHEFILES_HISTOGRAM is not set

#
# CD-ROM/DVD Filesystems
#
CONFIG_ISO9660_FS=y
CONFIG_JOLIET=y
CONFIG_ZISOFS=y
# CONFIG_UDF_FS is not set

#
# DOS/FAT/NT Filesystems
#
CONFIG_FAT_FS=y
CONFIG_MSDOS_FS=y
CONFIG_VFAT_FS=y
CONFIG_FAT_DEFAULT_CODEPAGE=437
CONFIG_FAT_DEFAULT_IOCHARSET="iso8859-1"
# CONFIG_FAT_DEFAULT_UTF8 is not set
# CONFIG_NTFS_FS is not set

#
# Pseudo filesystems
#
CONFIG_PROC_FS=y
# CONFIG_PROC_KCORE is not set
# CONFIG_PROC_SYSCTL is not set
CONFIG_PROC_PAGE_MONITOR=y
CONFIG_PROC_CHILDREN=y
CONFIG_KERNFS=y
CONFIG_SYSFS=y
CONFIG_HUGETLBFS=y
CONFIG_HUGETLB_PAGE=y
CONFIG_ARCH_HAS_GIGANTIC_PAGE=y
CONFIG_CONFIGFS_FS=y
# CONFIG_MISC_FILESYSTEMS is not set
CONFIG_NLS=y
CONFIG_NLS_DEFAULT="iso8859-1"
# CONFIG_NLS_CODEPAGE_437 is not set
CONFIG_NLS_CODEPAGE_737=y
# CONFIG_NLS_CODEPAGE_775 is not set
CONFIG_NLS_CODEPAGE_850=y
CONFIG_NLS_CODEPAGE_852=y
# CONFIG_NLS_CODEPAGE_855 is not set
# CONFIG_NLS_CODEPAGE_857 is not set
# CONFIG_NLS_CODEPAGE_860 is not set
CONFIG_NLS_CODEPAGE_861=y
# CONFIG_NLS_CODEPAGE_862 is not set
CONFIG_NLS_CODEPAGE_863=y
CONFIG_NLS_CODEPAGE_864=y
# CONFIG_NLS_CODEPAGE_865 is not set
# CONFIG_NLS_CODEPAGE_866 is not set
CONFIG_NLS_CODEPAGE_869=y
# CONFIG_NLS_CODEPAGE_936 is not set
# CONFIG_NLS_CODEPAGE_950 is not set
# CONFIG_NLS_CODEPAGE_932 is not set
# CONFIG_NLS_CODEPAGE_949 is not set
# CONFIG_NLS_CODEPAGE_874 is not set
CONFIG_NLS_ISO8859_8=y
CONFIG_NLS_CODEPAGE_1250=y
CONFIG_NLS_CODEPAGE_1251=y
CONFIG_NLS_ASCII=y
CONFIG_NLS_ISO8859_1=y
# CONFIG_NLS_ISO8859_2 is not set
CONFIG_NLS_ISO8859_3=y
# CONFIG_NLS_ISO8859_4 is not set
# CONFIG_NLS_ISO8859_5 is not set
# CONFIG_NLS_ISO8859_6 is not set
CONFIG_NLS_ISO8859_7=y
# CONFIG_NLS_ISO8859_9 is not set
CONFIG_NLS_ISO8859_13=y
CONFIG_NLS_ISO8859_14=y
CONFIG_NLS_ISO8859_15=y
# CONFIG_NLS_KOI8_R is not set
CONFIG_NLS_KOI8_U=y
CONFIG_NLS_MAC_ROMAN=y
# CONFIG_NLS_MAC_CELTIC is not set
# CONFIG_NLS_MAC_CENTEURO is not set
CONFIG_NLS_MAC_CROATIAN=y
# CONFIG_NLS_MAC_CYRILLIC is not set
# CONFIG_NLS_MAC_GAELIC is not set
# CONFIG_NLS_MAC_GREEK is not set
CONFIG_NLS_MAC_ICELAND=y
CONFIG_NLS_MAC_INUIT=y
# CONFIG_NLS_MAC_ROMANIAN is not set
# CONFIG_NLS_MAC_TURKISH is not set
# CONFIG_NLS_UTF8 is not set

#
# Kernel hacking
#
CONFIG_TRACE_IRQFLAGS_SUPPORT=y

#
# printk and dmesg options
#
CONFIG_CONSOLE_LOGLEVEL_DEFAULT=7
CONFIG_MESSAGE_LOGLEVEL_DEFAULT=4

#
# Compile-time checks and compiler options
#
CONFIG_ENABLE_WARN_DEPRECATED=y
CONFIG_ENABLE_MUST_CHECK=y
CONFIG_FRAME_WARN=2048
CONFIG_STRIP_ASM_SYMS=y
# CONFIG_READABLE_ASM is not set
# CONFIG_UNUSED_SYMBOLS is not set
# CONFIG_PAGE_OWNER is not set
CONFIG_DEBUG_FS=y
CONFIG_HEADERS_CHECK=y
CONFIG_DEBUG_SECTION_MISMATCH=y
CONFIG_SECTION_MISMATCH_WARN_ONLY=y
CONFIG_DEBUG_FORCE_WEAK_PER_CPU=y
CONFIG_MAGIC_SYSRQ=y
CONFIG_MAGIC_SYSRQ_DEFAULT_ENABLE=0x1
# CONFIG_MAGIC_SYSRQ_SERIAL is not set
CONFIG_DEBUG_KERNEL=y

#
# Memory Debugging
#
# CONFIG_PAGE_EXTENSION is not set
# CONFIG_DEBUG_PAGEALLOC is not set
# CONFIG_PAGE_POISONING is not set
# CONFIG_DEBUG_PAGE_REF is not set
# CONFIG_DEBUG_RODATA_TEST is not set
CONFIG_DEBUG_OBJECTS=y
CONFIG_DEBUG_OBJECTS_SELFTEST=y
CONFIG_DEBUG_OBJECTS_FREE=y
CONFIG_DEBUG_OBJECTS_TIMERS=y
# CONFIG_DEBUG_OBJECTS_WORK is not set
CONFIG_DEBUG_OBJECTS_RCU_HEAD=y
CONFIG_DEBUG_OBJECTS_PERCPU_COUNTER=y
CONFIG_DEBUG_OBJECTS_ENABLE_DEFAULT=1
CONFIG_HAVE_DEBUG_KMEMLEAK=y
CONFIG_DEBUG_KMEMLEAK=y
CONFIG_DEBUG_KMEMLEAK_EARLY_LOG_SIZE=16000
CONFIG_DEBUG_KMEMLEAK_DEFAULT_OFF=y
CONFIG_DEBUG_STACK_USAGE=y
CONFIG_DEBUG_VM=y
# CONFIG_DEBUG_VM_VMACACHE is not set
# CONFIG_DEBUG_VM_RB is not set
# CONFIG_DEBUG_VM_PGFLAGS is not set
CONFIG_DEBUG_MEMORY_INIT=y
# CONFIG_DEBUG_PER_CPU_MAPS is not set
CONFIG_ARCH_HAS_KCOV=y
CONFIG_KCOV=y
CONFIG_KCOV_INSTRUMENT_ALL=y
CONFIG_DEBUG_SHIRQ=y

#
# Debug Lockups and Hangs
#
# CONFIG_DETECT_HUNG_TASK is not set
CONFIG_WQ_WATCHDOG=y
# CONFIG_PANIC_ON_OOPS is not set
CONFIG_PANIC_ON_OOPS_VALUE=0
CONFIG_PANIC_TIMEOUT=0
CONFIG_SCHED_DEBUG=y
CONFIG_SCHED_INFO=y
CONFIG_SCHEDSTATS=y
CONFIG_SCHED_STACK_END_CHECK=y
CONFIG_DEBUG_TIMEKEEPING=y

#
# Lock Debugging (spinlocks, mutexes, etc...)
#
CONFIG_DEBUG_RT_MUTEXES=y
CONFIG_DEBUG_SPINLOCK=y
CONFIG_DEBUG_MUTEXES=y
CONFIG_DEBUG_WW_MUTEX_SLOWPATH=y
CONFIG_DEBUG_LOCK_ALLOC=y
CONFIG_PROVE_LOCKING=y
CONFIG_LOCKDEP=y
CONFIG_LOCK_STAT=y
CONFIG_DEBUG_LOCKDEP=y
# CONFIG_DEBUG_ATOMIC_SLEEP is not set
# CONFIG_DEBUG_LOCKING_API_SELFTESTS is not set
CONFIG_LOCK_TORTURE_TEST=y
CONFIG_WW_MUTEX_SELFTEST=y
CONFIG_TRACE_IRQFLAGS=y
CONFIG_STACKTRACE=y
CONFIG_WARN_ALL_UNSEEDED_RANDOM=y
CONFIG_DEBUG_KOBJECT=y
CONFIG_DEBUG_KOBJECT_RELEASE=y
# CONFIG_DEBUG_BUGVERBOSE is not set
CONFIG_DEBUG_LIST=y
# CONFIG_DEBUG_PI_LIST is not set
CONFIG_DEBUG_SG=y
# CONFIG_DEBUG_NOTIFIERS is not set
CONFIG_DEBUG_CREDENTIALS=y

#
# RCU Debugging
#
CONFIG_PROVE_RCU=y
CONFIG_TORTURE_TEST=y
# CONFIG_RCU_PERF_TEST is not set
CONFIG_RCU_TORTURE_TEST=y
CONFIG_RCU_CPU_STALL_TIMEOUT=21
CONFIG_RCU_TRACE=y
CONFIG_RCU_EQS_DEBUG=y
# CONFIG_DEBUG_WQ_FORCE_RR_CPU is not set
# CONFIG_DEBUG_BLOCK_EXT_DEVT is not set
# CONFIG_CPU_HOTPLUG_STATE_CONTROL is not set
# CONFIG_NOTIFIER_ERROR_INJECTION is not set
# CONFIG_FAULT_INJECTION is not set
CONFIG_LATENCYTOP=y
CONFIG_NOP_TRACER=y
CONFIG_HAVE_FUNCTION_TRACER=y
CONFIG_HAVE_FUNCTION_GRAPH_TRACER=y
CONFIG_HAVE_DYNAMIC_FTRACE=y
CONFIG_HAVE_DYNAMIC_FTRACE_WITH_REGS=y
CONFIG_HAVE_FTRACE_MCOUNT_RECORD=y
CONFIG_HAVE_SYSCALL_TRACEPOINTS=y
CONFIG_TRACER_MAX_TRACE=y
CONFIG_TRACE_CLOCK=y
CONFIG_RING_BUFFER=y
CONFIG_EVENT_TRACING=y
CONFIG_CONTEXT_SWITCH_TRACER=y
CONFIG_RING_BUFFER_ALLOW_SWAP=y
CONFIG_TRACING=y
CONFIG_GENERIC_TRACER=y
CONFIG_TRACING_SUPPORT=y
CONFIG_FTRACE=y
CONFIG_FUNCTION_TRACER=y
# CONFIG_FUNCTION_GRAPH_TRACER is not set
CONFIG_IRQSOFF_TRACER=y
CONFIG_SCHED_TRACER=y
CONFIG_HWLAT_TRACER=y
CONFIG_FTRACE_SYSCALLS=y
CONFIG_TRACER_SNAPSHOT=y
CONFIG_TRACER_SNAPSHOT_PER_CPU_SWAP=y
CONFIG_BRANCH_PROFILE_NONE=y
# CONFIG_PROFILE_ANNOTATED_BRANCHES is not set
# CONFIG_PROFILE_ALL_BRANCHES is not set
# CONFIG_STACK_TRACER is not set
# CONFIG_BLK_DEV_IO_TRACE is not set
# CONFIG_PROBE_EVENTS is not set
CONFIG_DYNAMIC_FTRACE=y
CONFIG_DYNAMIC_FTRACE_WITH_REGS=y
# CONFIG_FUNCTION_PROFILER is not set
CONFIG_FTRACE_MCOUNT_RECORD=y
CONFIG_FTRACE_SELFTEST=y
CONFIG_FTRACE_STARTUP_TEST=y
CONFIG_EVENT_TRACE_TEST_SYSCALLS=y
CONFIG_TRACING_MAP=y
CONFIG_HIST_TRIGGERS=y
# CONFIG_TRACEPOINT_BENCHMARK is not set
CONFIG_RING_BUFFER_BENCHMARK=y
CONFIG_RING_BUFFER_STARTUP_TEST=y
CONFIG_TRACE_EVAL_MAP_FILE=y
CONFIG_TRACING_EVENTS_GPIO=y
# CONFIG_DMA_API_DEBUG is not set

#
# Runtime Testing
#
# CONFIG_LKDTM is not set
# CONFIG_TEST_LIST_SORT is not set
# CONFIG_TEST_SORT is not set
# CONFIG_BACKTRACE_SELF_TEST is not set
# CONFIG_RBTREE_TEST is not set
# CONFIG_INTERVAL_TREE_TEST is not set
# CONFIG_ATOMIC64_SELFTEST is not set
# CONFIG_TEST_HEXDUMP is not set
# CONFIG_TEST_STRING_HELPERS is not set
# CONFIG_TEST_KSTRTOX is not set
# CONFIG_TEST_PRINTF is not set
# CONFIG_TEST_BITMAP is not set
# CONFIG_TEST_UUID is not set
# CONFIG_TEST_RHASHTABLE is not set
# CONFIG_TEST_HASH is not set
# CONFIG_TEST_FIRMWARE is not set
# CONFIG_TEST_UDELAY is not set
# CONFIG_MEMTEST is not set
CONFIG_BUG_ON_DATA_CORRUPTION=y
# CONFIG_SAMPLES is not set
CONFIG_ARCH_HAS_UBSAN_SANITIZE_ALL=y
CONFIG_ARCH_WANTS_UBSAN_NO_NULL=y
CONFIG_UBSAN=y
# CONFIG_UBSAN_ALIGNMENT is not set
# CONFIG_UBSAN_NULL is not set
CONFIG_ARCH_HAS_DEVMEM_IS_ALLOWED=y
# CONFIG_S390_PTDUMP is not set
CONFIG_EARLY_PRINTK=y

#
# Security options
#
CONFIG_KEYS=y
CONFIG_PERSISTENT_KEYRINGS=y
CONFIG_TRUSTED_KEYS=y
CONFIG_ENCRYPTED_KEYS=y
# CONFIG_KEY_DH_OPERATIONS is not set
# CONFIG_SECURITY_DMESG_RESTRICT is not set
CONFIG_SECURITYFS=y
# CONFIG_STATIC_USERMODEHELPER is not set
CONFIG_SECURITY_CHROMIUMOS_DEVICE_JAIL=y
CONFIG_SECURITY_CHROMIUMOS_READONLY_PROC_SELF_MEM=y
CONFIG_DEFAULT_SECURITY_DAC=y
CONFIG_DEFAULT_SECURITY=""
# CONFIG_ARCH_HAS_ALT_SYSCALL is not set
CONFIG_XOR_BLOCKS=y
CONFIG_CRYPTO=y

#
# Crypto core or helper
#
CONFIG_CRYPTO_ALGAPI=y
CONFIG_CRYPTO_ALGAPI2=y
CONFIG_CRYPTO_AEAD=y
CONFIG_CRYPTO_AEAD2=y
CONFIG_CRYPTO_BLKCIPHER=y
CONFIG_CRYPTO_BLKCIPHER2=y
CONFIG_CRYPTO_HASH=y
CONFIG_CRYPTO_HASH2=y
CONFIG_CRYPTO_RNG=y
CONFIG_CRYPTO_RNG2=y
CONFIG_CRYPTO_RNG_DEFAULT=y
CONFIG_CRYPTO_AKCIPHER2=y
CONFIG_CRYPTO_AKCIPHER=y
CONFIG_CRYPTO_KPP2=y
CONFIG_CRYPTO_KPP=y
CONFIG_CRYPTO_ACOMP2=y
CONFIG_CRYPTO_RSA=y
CONFIG_CRYPTO_DH=y
CONFIG_CRYPTO_ECDH=y
CONFIG_CRYPTO_MANAGER=y
CONFIG_CRYPTO_MANAGER2=y
CONFIG_CRYPTO_MANAGER_DISABLE_TESTS=y
CONFIG_CRYPTO_GF128MUL=y
CONFIG_CRYPTO_NULL=y
CONFIG_CRYPTO_NULL2=y
# CONFIG_CRYPTO_PCRYPT is not set
CONFIG_CRYPTO_WORKQUEUE=y
# CONFIG_CRYPTO_CRYPTD is not set
# CONFIG_CRYPTO_MCRYPTD is not set
CONFIG_CRYPTO_AUTHENC=y

#
# Authenticated Encryption with Associated Data
#
CONFIG_CRYPTO_CCM=y
CONFIG_CRYPTO_GCM=y
CONFIG_CRYPTO_CHACHA20POLY1305=y
CONFIG_CRYPTO_SEQIV=y
CONFIG_CRYPTO_ECHAINIV=y

#
# Block modes
#
CONFIG_CRYPTO_CBC=y
CONFIG_CRYPTO_CTR=y
# CONFIG_CRYPTO_CTS is not set
CONFIG_CRYPTO_ECB=y
CONFIG_CRYPTO_LRW=y
# CONFIG_CRYPTO_PCBC is not set
CONFIG_CRYPTO_XTS=y
CONFIG_CRYPTO_KEYWRAP=y

#
# Hash modes
#
# CONFIG_CRYPTO_CMAC is not set
CONFIG_CRYPTO_HMAC=y
CONFIG_CRYPTO_XCBC=y
CONFIG_CRYPTO_VMAC=y

#
# Digest
#
CONFIG_CRYPTO_CRC32C=y
CONFIG_CRYPTO_CRC32=y
CONFIG_CRYPTO_CRCT10DIF=y
CONFIG_CRYPTO_GHASH=y
CONFIG_CRYPTO_POLY1305=y
CONFIG_CRYPTO_MD4=y
CONFIG_CRYPTO_MD5=y
# CONFIG_CRYPTO_MICHAEL_MIC is not set
# CONFIG_CRYPTO_RMD128 is not set
CONFIG_CRYPTO_RMD160=y
# CONFIG_CRYPTO_RMD256 is not set
# CONFIG_CRYPTO_RMD320 is not set
CONFIG_CRYPTO_SHA1=y
CONFIG_CRYPTO_SHA256=y
CONFIG_CRYPTO_SHA512=y
CONFIG_CRYPTO_SHA3=y
# CONFIG_CRYPTO_TGR192 is not set
# CONFIG_CRYPTO_WP512 is not set

#
# Ciphers
#
CONFIG_CRYPTO_AES=y
CONFIG_CRYPTO_AES_TI=y
# CONFIG_CRYPTO_ANUBIS is not set
# CONFIG_CRYPTO_ARC4 is not set
CONFIG_CRYPTO_BLOWFISH=y
CONFIG_CRYPTO_BLOWFISH_COMMON=y
CONFIG_CRYPTO_CAMELLIA=y
CONFIG_CRYPTO_CAST_COMMON=y
CONFIG_CRYPTO_CAST5=y
CONFIG_CRYPTO_CAST6=y
CONFIG_CRYPTO_DES=y
# CONFIG_CRYPTO_FCRYPT is not set
# CONFIG_CRYPTO_KHAZAD is not set
# CONFIG_CRYPTO_SALSA20 is not set
CONFIG_CRYPTO_CHACHA20=y
# CONFIG_CRYPTO_SEED is not set
CONFIG_CRYPTO_SERPENT=y
# CONFIG_CRYPTO_TEA is not set
# CONFIG_CRYPTO_TWOFISH is not set

#
# Compression
#
# CONFIG_CRYPTO_DEFLATE is not set
CONFIG_CRYPTO_LZO=y
CONFIG_CRYPTO_842=y
CONFIG_CRYPTO_LZ4=y
# CONFIG_CRYPTO_LZ4HC is not set

#
# Random Number Generation
#
# CONFIG_CRYPTO_ANSI_CPRNG is not set
CONFIG_CRYPTO_DRBG_MENU=y
CONFIG_CRYPTO_DRBG_HMAC=y
# CONFIG_CRYPTO_DRBG_HASH is not set
CONFIG_CRYPTO_DRBG_CTR=y
CONFIG_CRYPTO_DRBG=y
CONFIG_CRYPTO_JITTERENTROPY=y
CONFIG_CRYPTO_HASH_INFO=y
CONFIG_CRYPTO_HW=y
# CONFIG_ZCRYPT is not set
# CONFIG_CRYPTO_SHA1_S390 is not set
CONFIG_CRYPTO_SHA256_S390=y
# CONFIG_CRYPTO_SHA512_S390 is not set
CONFIG_CRYPTO_DES_S390=y
# CONFIG_CRYPTO_AES_S390 is not set
CONFIG_S390_PRNG=y
# CONFIG_CRYPTO_GHASH_S390 is not set
# CONFIG_CRYPTO_CRC32_S390 is not set
# CONFIG_CRYPTO_DEV_FSL_CAAM_CRYPTO_API_DESC is not set
# CONFIG_CRYPTO_DEV_EXYNOS_RNG is not set
# CONFIG_CRYPTO_DEV_S5P is not set
# CONFIG_CRYPTO_DEV_ATMEL_AUTHENC is not set
# CONFIG_CRYPTO_DEV_ATMEL_AES is not set
# CONFIG_CRYPTO_DEV_ATMEL_TDES is not set
# CONFIG_CRYPTO_DEV_ATMEL_SHA is not set
CONFIG_CRYPTO_DEV_ATMEL_ECC=y
# CONFIG_CAVIUM_CPT is not set
# CONFIG_CRYPTO_DEV_NITROX_CNN55XX is not set
# CONFIG_CRYPTO_DEV_CAVIUM_ZIP is not set
# CONFIG_CRYPTO_DEV_QCE is not set
# CONFIG_CRYPTO_DEV_IMGTEC_HASH is not set
# CONFIG_CRYPTO_DEV_MEDIATEK is not set
# CONFIG_CRYPTO_DEV_VIRTIO is not set
CONFIG_ASYMMETRIC_KEY_TYPE=y
CONFIG_ASYMMETRIC_PUBLIC_KEY_SUBTYPE=y
# CONFIG_X509_CERTIFICATE_PARSER is not set

#
# Certificates for signature checking
#
# CONFIG_SYSTEM_TRUSTED_KEYRING is not set
# CONFIG_SYSTEM_BLACKLIST_KEYRING is not set
CONFIG_BINARY_PRINTF=y

#
# Library routines
#
CONFIG_RAID6_PQ=y
CONFIG_BITREVERSE=y
# CONFIG_HAVE_ARCH_BITREVERSE is not set
CONFIG_GENERIC_FIND_FIRST_BIT=y
CONFIG_GENERIC_IO=y
CONFIG_ARCH_USE_CMPXCHG_LOCKREF=y
CONFIG_CRC_CCITT=y
CONFIG_CRC16=y
CONFIG_CRC_T10DIF=y
CONFIG_CRC_ITU_T=y
CONFIG_CRC32=y
CONFIG_CRC32_SELFTEST=y
# CONFIG_CRC32_SLICEBY8 is not set
CONFIG_CRC32_SLICEBY4=y
# CONFIG_CRC32_SARWATE is not set
# CONFIG_CRC32_BIT is not set
CONFIG_CRC4=y
CONFIG_CRC7=y
CONFIG_LIBCRC32C=y
CONFIG_CRC8=y
CONFIG_XXHASH=y
# CONFIG_AUDIT_ARCH_COMPAT_GENERIC is not set
CONFIG_RANDOM32_SELFTEST=y
CONFIG_842_COMPRESS=y
CONFIG_842_DECOMPRESS=y
CONFIG_ZLIB_INFLATE=y
CONFIG_ZLIB_DEFLATE=y
CONFIG_LZO_COMPRESS=y
CONFIG_LZO_DECOMPRESS=y
CONFIG_LZ4_COMPRESS=y
CONFIG_LZ4_DECOMPRESS=y
CONFIG_ZSTD_COMPRESS=y
CONFIG_ZSTD_DECOMPRESS=y
CONFIG_XZ_DEC=y
CONFIG_XZ_DEC_X86=y
# CONFIG_XZ_DEC_POWERPC is not set
CONFIG_XZ_DEC_IA64=y
CONFIG_XZ_DEC_ARM=y
CONFIG_XZ_DEC_ARMTHUMB=y
CONFIG_XZ_DEC_SPARC=y
CONFIG_XZ_DEC_BCJ=y
CONFIG_XZ_DEC_TEST=y
CONFIG_DECOMPRESS_GZIP=y
CONFIG_DECOMPRESS_XZ=y
CONFIG_BCH=y
CONFIG_BCH_CONST_PARAMS=y
CONFIG_INTERVAL_TREE=y
CONFIG_RADIX_TREE_MULTIORDER=y
CONFIG_ASSOCIATIVE_ARRAY=y
CONFIG_HAS_DMA=y
CONFIG_DMA_NOOP_OPS=y
# CONFIG_DMA_VIRT_OPS is not set
CONFIG_GLOB=y
# CONFIG_GLOB_SELFTEST is not set
CONFIG_CLZ_TAB=y
CONFIG_CORDIC=y
# CONFIG_DDR is not set
# CONFIG_IRQ_POLL is not set
CONFIG_MPILIB=y
# CONFIG_SG_SPLIT is not set
CONFIG_SG_POOL=y
CONFIG_ARCH_HAS_SG_CHAIN=y
CONFIG_SBITMAP=y
# CONFIG_PARMAN is not set
# CONFIG_STRING_SELFTEST is not set

#
# Virtualization
#
# CONFIG_PFAULT is not set
# CONFIG_SHARED_KERNEL is not set
CONFIG_CMM=y
# CONFIG_APPLDATA_BASE is not set
CONFIG_S390_HYPFS_FS=y
CONFIG_HAVE_KVM=y
CONFIG_VIRTUALIZATION=y
# CONFIG_KVM is not set
# CONFIG_VHOST_CROSS_ENDIAN_LEGACY is not set
CONFIG_S390_GUEST=y
CONFIG_S390_GUEST_OLD_TRANSPORT=y

--QOsuMNdzeW434NVn--
