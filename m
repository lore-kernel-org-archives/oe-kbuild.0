Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D41CAA954
	for <oe-kbuild@lists.linux.dev>; Mon,  3 Apr 2023 23:56:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1680566211; x=1712102211;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=MGPtFqlcZyIXy1X8FMNymdWJfej+Ug8Ep/Lx4/3HRqE=;
  b=RA0AUICmjjMzg5rItkXiYAFbY/Bd42ckRv/ckAgyF9nvCaXuUZt4V7Ye
   O6WgmTn1svniFF+IzOAjW/kJaCvpRbGN8J4Tn86k/7Dsq9vCEYOJMqkuM
   hyQ/f/9bAOapxnbBwIqgV/PfgZpITpFzjgGA1vYhSFlW84ITfrao/nRp7
   cszOm8TUBOZvc3nqDwj3/DQ+gLTrHu1xTiYTPQ2MfB6vVa1bIZ0D4SNXk
   PS5OKwtxn/O5oT4oJ3FrGeVA9615JeNp1ujmXBojpbiirhTPZtplM1gZH
   FaB43hwuyQiLy3pMcJ7X3yX86b1YZxkBhVXsFd+ggFIoJ9gyFSyyajVc8
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10669"; a="340776770"
X-IronPort-AV: E=Sophos;i="5.98,316,1673942400"; 
   d="scan'208";a="340776770"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
  by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Apr 2023 16:56:50 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10669"; a="636302029"
X-IronPort-AV: E=Sophos;i="5.98,316,1673942400"; 
   d="scan'208";a="636302029"
Received: from lkp-server01.sh.intel.com (HELO b613635ddfff) ([10.239.97.150])
  by orsmga003.jf.intel.com with ESMTP; 03 Apr 2023 16:56:49 -0700
Received: from kbuild by b613635ddfff with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pjU2a-000Owu-0s;
	Mon, 03 Apr 2023 23:56:48 +0000
Date: Tue, 4 Apr 2023 07:56:42 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: Re: [PATCH v5 2/5] mfd: Add support for the Lantiq PEF2256 framer
Message-ID: <202304040752.9nxuNOcG-lkp@intel.com>
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
In-Reply-To: <20230328092645.634375-3-herve.codina@bootlin.com>
References: <20230328092645.634375-3-herve.codina@bootlin.com>
TO: Herve Codina <herve.codina@bootlin.com>
TO: Herve Codina <herve.codina@bootlin.com>
TO: Lee Jones <lee@kernel.org>
TO: Rob Herring <robh+dt@kernel.org>
TO: Krzysztof Kozlowski <krzk@kernel.org>
TO: Liam Girdwood <lgirdwood@gmail.com>
TO: Mark Brown <broonie@kernel.org>
TO: Jaroslav Kysela <perex@perex.cz>
TO: Takashi Iwai <tiwai@suse.com>
CC: linux-kernel@vger.kernel.org
CC: devicetree@vger.kernel.org
CC: alsa-devel@alsa-project.org
CC: Christophe Leroy <christophe.leroy@csgroup.eu>
CC: Thomas Petazzoni <thomas.petazzoni@bootlin.com>

Hi Herve,

kernel test robot noticed the following build warnings:

[auto build test WARNING on lee-mfd/for-mfd-next]
[also build test WARNING on broonie-sound/for-next lee-leds/for-leds-next robh/for-next linus/master v6.3-rc5 next-20230403]
[cannot apply to lee-mfd/for-mfd-fixes]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Herve-Codina/dt-bindings-mfd-Add-the-Lantiq-PEF2256-E1-T1-J1-framer/20230328-172844
base:   https://git.kernel.org/pub/scm/linux/kernel/git/lee/mfd.git for-mfd-next
patch link:    https://lore.kernel.org/r/20230328092645.634375-3-herve.codina%40bootlin.com
patch subject: [PATCH v5 2/5] mfd: Add support for the Lantiq PEF2256 framer
:::::: branch date: 7 days ago
:::::: commit date: 7 days ago
config: ia64-randconfig-s043-20230403 (https://download.01.org/0day-ci/archive/20230404/202304040752.9nxuNOcG-lkp@intel.com/config)
compiler: ia64-linux-gcc (GCC) 12.1.0
reproduce:
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # apt-get install sparse
        # sparse version: v0.6.4-39-gce1a6720-dirty
        # https://github.com/intel-lab-lkp/linux/commit/e94051d2538282ccd1a35a206c810437c652fd5a
        git remote add linux-review https://github.com/intel-lab-lkp/linux
        git fetch --no-tags linux-review Herve-Codina/dt-bindings-mfd-Add-the-Lantiq-PEF2256-E1-T1-J1-framer/20230328-172844
        git checkout e94051d2538282ccd1a35a206c810437c652fd5a
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross C=1 CF='-fdiagnostic-prefix -D__CHECK_ENDIAN__' O=build_dir ARCH=ia64 olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross C=1 CF='-fdiagnostic-prefix -D__CHECK_ENDIAN__' O=build_dir ARCH=ia64 SHELL=/bin/bash drivers/mfd/ drivers/target/

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/r/202304040752.9nxuNOcG-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
   drivers/mfd/pef2256.c:1192:23: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected void *[noderef] regs @@     got void [noderef] __iomem * @@
   drivers/mfd/pef2256.c:1192:23: sparse:     expected void *[noderef] regs
   drivers/mfd/pef2256.c:1192:23: sparse:     got void [noderef] __iomem *
>> drivers/mfd/pef2256.c:303:38: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void const [noderef] __iomem * @@     got void * @@
   drivers/mfd/pef2256.c:303:38: sparse:     expected void const [noderef] __iomem *
   drivers/mfd/pef2256.c:303:38: sparse:     got void *
   drivers/mfd/pef2256.c:303:24: sparse: sparse: dereference of noderef expression
>> drivers/mfd/pef2256.c:303:38: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void const [noderef] __iomem * @@     got void * @@
   drivers/mfd/pef2256.c:303:38: sparse:     expected void const [noderef] __iomem *
   drivers/mfd/pef2256.c:303:38: sparse:     got void *
   drivers/mfd/pef2256.c:303:24: sparse: sparse: dereference of noderef expression
>> drivers/mfd/pef2256.c:308:37: sparse: sparse: incorrect type in argument 2 (different address spaces) @@     expected void [noderef] __iomem * @@     got void * @@
   drivers/mfd/pef2256.c:308:37: sparse:     expected void [noderef] __iomem *
   drivers/mfd/pef2256.c:308:37: sparse:     got void *
   drivers/mfd/pef2256.c:308:23: sparse: sparse: dereference of noderef expression
>> drivers/mfd/pef2256.c:308:37: sparse: sparse: incorrect type in argument 2 (different address spaces) @@     expected void [noderef] __iomem * @@     got void * @@
   drivers/mfd/pef2256.c:308:37: sparse:     expected void [noderef] __iomem *
   drivers/mfd/pef2256.c:308:37: sparse:     got void *
   drivers/mfd/pef2256.c:308:23: sparse: sparse: dereference of noderef expression
>> drivers/mfd/pef2256.c:308:37: sparse: sparse: incorrect type in argument 2 (different address spaces) @@     expected void [noderef] __iomem * @@     got void * @@
   drivers/mfd/pef2256.c:308:37: sparse:     expected void [noderef] __iomem *
   drivers/mfd/pef2256.c:308:37: sparse:     got void *
   drivers/mfd/pef2256.c:308:23: sparse: sparse: dereference of noderef expression
>> drivers/mfd/pef2256.c:308:37: sparse: sparse: incorrect type in argument 2 (different address spaces) @@     expected void [noderef] __iomem * @@     got void * @@
   drivers/mfd/pef2256.c:308:37: sparse:     expected void [noderef] __iomem *
   drivers/mfd/pef2256.c:308:37: sparse:     got void *
   drivers/mfd/pef2256.c:308:23: sparse: sparse: dereference of noderef expression
>> drivers/mfd/pef2256.c:308:37: sparse: sparse: incorrect type in argument 2 (different address spaces) @@     expected void [noderef] __iomem * @@     got void * @@
   drivers/mfd/pef2256.c:308:37: sparse:     expected void [noderef] __iomem *
   drivers/mfd/pef2256.c:308:37: sparse:     got void *
   drivers/mfd/pef2256.c:308:23: sparse: sparse: dereference of noderef expression
>> drivers/mfd/pef2256.c:308:37: sparse: sparse: incorrect type in argument 2 (different address spaces) @@     expected void [noderef] __iomem * @@     got void * @@
   drivers/mfd/pef2256.c:308:37: sparse:     expected void [noderef] __iomem *
   drivers/mfd/pef2256.c:308:37: sparse:     got void *
   drivers/mfd/pef2256.c:308:23: sparse: sparse: dereference of noderef expression
>> drivers/mfd/pef2256.c:308:37: sparse: sparse: incorrect type in argument 2 (different address spaces) @@     expected void [noderef] __iomem * @@     got void * @@
   drivers/mfd/pef2256.c:308:37: sparse:     expected void [noderef] __iomem *
   drivers/mfd/pef2256.c:308:37: sparse:     got void *
   drivers/mfd/pef2256.c:308:23: sparse: sparse: dereference of noderef expression
>> drivers/mfd/pef2256.c:308:37: sparse: sparse: incorrect type in argument 2 (different address spaces) @@     expected void [noderef] __iomem * @@     got void * @@
   drivers/mfd/pef2256.c:308:37: sparse:     expected void [noderef] __iomem *
   drivers/mfd/pef2256.c:308:37: sparse:     got void *
   drivers/mfd/pef2256.c:308:23: sparse: sparse: dereference of noderef expression
>> drivers/mfd/pef2256.c:303:38: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void const [noderef] __iomem * @@     got void * @@
   drivers/mfd/pef2256.c:303:38: sparse:     expected void const [noderef] __iomem *
   drivers/mfd/pef2256.c:303:38: sparse:     got void *
   drivers/mfd/pef2256.c:303:24: sparse: sparse: dereference of noderef expression
>> drivers/mfd/pef2256.c:308:37: sparse: sparse: incorrect type in argument 2 (different address spaces) @@     expected void [noderef] __iomem * @@     got void * @@
   drivers/mfd/pef2256.c:308:37: sparse:     expected void [noderef] __iomem *
   drivers/mfd/pef2256.c:308:37: sparse:     got void *
   drivers/mfd/pef2256.c:303:24: sparse: sparse: dereference of noderef expression
   drivers/mfd/pef2256.c:308:23: sparse: sparse: dereference of noderef expression
>> drivers/mfd/pef2256.c:308:37: sparse: sparse: incorrect type in argument 2 (different address spaces) @@     expected void [noderef] __iomem * @@     got void * @@
   drivers/mfd/pef2256.c:308:37: sparse:     expected void [noderef] __iomem *
   drivers/mfd/pef2256.c:308:37: sparse:     got void *
   drivers/mfd/pef2256.c:308:23: sparse: sparse: dereference of noderef expression
>> drivers/mfd/pef2256.c:308:37: sparse: sparse: incorrect type in argument 2 (different address spaces) @@     expected void [noderef] __iomem * @@     got void * @@
   drivers/mfd/pef2256.c:308:37: sparse:     expected void [noderef] __iomem *
   drivers/mfd/pef2256.c:308:37: sparse:     got void *
   drivers/mfd/pef2256.c:308:23: sparse: sparse: dereference of noderef expression
>> drivers/mfd/pef2256.c:308:37: sparse: sparse: incorrect type in argument 2 (different address spaces) @@     expected void [noderef] __iomem * @@     got void * @@
   drivers/mfd/pef2256.c:308:37: sparse:     expected void [noderef] __iomem *
   drivers/mfd/pef2256.c:308:37: sparse:     got void *
   drivers/mfd/pef2256.c:308:23: sparse: sparse: dereference of noderef expression
>> drivers/mfd/pef2256.c:308:37: sparse: sparse: incorrect type in argument 2 (different address spaces) @@     expected void [noderef] __iomem * @@     got void * @@
   drivers/mfd/pef2256.c:308:37: sparse:     expected void [noderef] __iomem *
   drivers/mfd/pef2256.c:308:37: sparse:     got void *
   drivers/mfd/pef2256.c:308:23: sparse: sparse: dereference of noderef expression
>> drivers/mfd/pef2256.c:308:37: sparse: sparse: incorrect type in argument 2 (different address spaces) @@     expected void [noderef] __iomem * @@     got void * @@
   drivers/mfd/pef2256.c:308:37: sparse:     expected void [noderef] __iomem *
   drivers/mfd/pef2256.c:308:37: sparse:     got void *
   drivers/mfd/pef2256.c:308:23: sparse: sparse: dereference of noderef expression
>> drivers/mfd/pef2256.c:308:37: sparse: sparse: incorrect type in argument 2 (different address spaces) @@     expected void [noderef] __iomem * @@     got void * @@
   drivers/mfd/pef2256.c:308:37: sparse:     expected void [noderef] __iomem *
   drivers/mfd/pef2256.c:308:37: sparse:     got void *
   drivers/mfd/pef2256.c:308:23: sparse: sparse: dereference of noderef expression
>> drivers/mfd/pef2256.c:308:37: sparse: sparse: incorrect type in argument 2 (different address spaces) @@     expected void [noderef] __iomem * @@     got void * @@
   drivers/mfd/pef2256.c:308:37: sparse:     expected void [noderef] __iomem *
   drivers/mfd/pef2256.c:308:37: sparse:     got void *
   drivers/mfd/pef2256.c:308:23: sparse: sparse: dereference of noderef expression
>> drivers/mfd/pef2256.c:308:37: sparse: sparse: incorrect type in argument 2 (different address spaces) @@     expected void [noderef] __iomem * @@     got void * @@
   drivers/mfd/pef2256.c:308:37: sparse:     expected void [noderef] __iomem *
   drivers/mfd/pef2256.c:308:37: sparse:     got void *
   drivers/mfd/pef2256.c:308:23: sparse: sparse: dereference of noderef expression
>> drivers/mfd/pef2256.c:308:37: sparse: sparse: incorrect type in argument 2 (different address spaces) @@     expected void [noderef] __iomem * @@     got void * @@
   drivers/mfd/pef2256.c:308:37: sparse:     expected void [noderef] __iomem *
   drivers/mfd/pef2256.c:308:37: sparse:     got void *
   drivers/mfd/pef2256.c:308:23: sparse: sparse: dereference of noderef expression
>> drivers/mfd/pef2256.c:308:37: sparse: sparse: incorrect type in argument 2 (different address spaces) @@     expected void [noderef] __iomem * @@     got void * @@
   drivers/mfd/pef2256.c:308:37: sparse:     expected void [noderef] __iomem *
   drivers/mfd/pef2256.c:308:37: sparse:     got void *
   drivers/mfd/pef2256.c:308:23: sparse: sparse: dereference of noderef expression
>> drivers/mfd/pef2256.c:308:37: sparse: sparse: incorrect type in argument 2 (different address spaces) @@     expected void [noderef] __iomem * @@     got void * @@
   drivers/mfd/pef2256.c:308:37: sparse:     expected void [noderef] __iomem *
   drivers/mfd/pef2256.c:308:37: sparse:     got void *
   drivers/mfd/pef2256.c:308:23: sparse: sparse: dereference of noderef expression
>> drivers/mfd/pef2256.c:308:37: sparse: sparse: incorrect type in argument 2 (different address spaces) @@     expected void [noderef] __iomem * @@     got void * @@
   drivers/mfd/pef2256.c:308:37: sparse:     expected void [noderef] __iomem *
   drivers/mfd/pef2256.c:308:37: sparse:     got void *
   drivers/mfd/pef2256.c:308:23: sparse: sparse: dereference of noderef expression
>> drivers/mfd/pef2256.c:308:37: sparse: sparse: incorrect type in argument 2 (different address spaces) @@     expected void [noderef] __iomem * @@     got void * @@
   drivers/mfd/pef2256.c:308:37: sparse:     expected void [noderef] __iomem *
   drivers/mfd/pef2256.c:308:37: sparse:     got void *
   drivers/mfd/pef2256.c:308:23: sparse: sparse: dereference of noderef expression
>> drivers/mfd/pef2256.c:308:37: sparse: sparse: incorrect type in argument 2 (different address spaces) @@     expected void [noderef] __iomem * @@     got void * @@
   drivers/mfd/pef2256.c:308:37: sparse:     expected void [noderef] __iomem *
   drivers/mfd/pef2256.c:308:37: sparse:     got void *
   drivers/mfd/pef2256.c:308:23: sparse: sparse: dereference of noderef expression
>> drivers/mfd/pef2256.c:308:37: sparse: sparse: incorrect type in argument 2 (different address spaces) @@     expected void [noderef] __iomem * @@     got void * @@
   drivers/mfd/pef2256.c:308:37: sparse:     expected void [noderef] __iomem *
   drivers/mfd/pef2256.c:308:37: sparse:     got void *
   drivers/mfd/pef2256.c:308:23: sparse: sparse: dereference of noderef expression
>> drivers/mfd/pef2256.c:308:37: sparse: sparse: incorrect type in argument 2 (different address spaces) @@     expected void [noderef] __iomem * @@     got void * @@
   drivers/mfd/pef2256.c:308:37: sparse:     expected void [noderef] __iomem *
   drivers/mfd/pef2256.c:308:37: sparse:     got void *
   drivers/mfd/pef2256.c:308:23: sparse: sparse: dereference of noderef expression
>> drivers/mfd/pef2256.c:308:37: sparse: sparse: incorrect type in argument 2 (different address spaces) @@     expected void [noderef] __iomem * @@     got void * @@
   drivers/mfd/pef2256.c:308:37: sparse:     expected void [noderef] __iomem *
   drivers/mfd/pef2256.c:308:37: sparse:     got void *
   drivers/mfd/pef2256.c:308:23: sparse: sparse: dereference of noderef expression
>> drivers/mfd/pef2256.c:308:37: sparse: sparse: incorrect type in argument 2 (different address spaces) @@     expected void [noderef] __iomem * @@     got void * @@
   drivers/mfd/pef2256.c:308:37: sparse:     expected void [noderef] __iomem *
   drivers/mfd/pef2256.c:308:37: sparse:     got void *
   drivers/mfd/pef2256.c:308:23: sparse: sparse: dereference of noderef expression
>> drivers/mfd/pef2256.c:308:37: sparse: sparse: incorrect type in argument 2 (different address spaces) @@     expected void [noderef] __iomem * @@     got void * @@
   drivers/mfd/pef2256.c:308:37: sparse:     expected void [noderef] __iomem *
   drivers/mfd/pef2256.c:308:37: sparse:     got void *
   drivers/mfd/pef2256.c:308:23: sparse: sparse: dereference of noderef expression
>> drivers/mfd/pef2256.c:308:37: sparse: sparse: incorrect type in argument 2 (different address spaces) @@     expected void [noderef] __iomem * @@     got void * @@
   drivers/mfd/pef2256.c:308:37: sparse:     expected void [noderef] __iomem *
   drivers/mfd/pef2256.c:308:37: sparse:     got void *
   drivers/mfd/pef2256.c:308:23: sparse: sparse: dereference of noderef expression
>> drivers/mfd/pef2256.c:303:38: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void const [noderef] __iomem * @@     got void * @@
   drivers/mfd/pef2256.c:303:38: sparse:     expected void const [noderef] __iomem *
   drivers/mfd/pef2256.c:303:38: sparse:     got void *
   drivers/mfd/pef2256.c:303:24: sparse: sparse: dereference of noderef expression
>> drivers/mfd/pef2256.c:308:37: sparse: sparse: incorrect type in argument 2 (different address spaces) @@     expected void [noderef] __iomem * @@     got void * @@
   drivers/mfd/pef2256.c:308:37: sparse:     expected void [noderef] __iomem *
   drivers/mfd/pef2256.c:308:37: sparse:     got void *
   drivers/mfd/pef2256.c:303:24: sparse: sparse: dereference of noderef expression
   drivers/mfd/pef2256.c:308:23: sparse: sparse: dereference of noderef expression
>> drivers/mfd/pef2256.c:303:38: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void const [noderef] __iomem * @@     got void * @@
   drivers/mfd/pef2256.c:303:38: sparse:     expected void const [noderef] __iomem *
   drivers/mfd/pef2256.c:303:38: sparse:     got void *
   drivers/mfd/pef2256.c:303:24: sparse: sparse: dereference of noderef expression
>> drivers/mfd/pef2256.c:308:37: sparse: sparse: incorrect type in argument 2 (different address spaces) @@     expected void [noderef] __iomem * @@     got void * @@
   drivers/mfd/pef2256.c:308:37: sparse:     expected void [noderef] __iomem *
   drivers/mfd/pef2256.c:308:37: sparse:     got void *
   drivers/mfd/pef2256.c:303:24: sparse: sparse: dereference of noderef expression
   drivers/mfd/pef2256.c:308:23: sparse: sparse: dereference of noderef expression
>> drivers/mfd/pef2256.c:303:38: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void const [noderef] __iomem * @@     got void * @@
   drivers/mfd/pef2256.c:303:38: sparse:     expected void const [noderef] __iomem *
   drivers/mfd/pef2256.c:303:38: sparse:     got void *
   drivers/mfd/pef2256.c:303:24: sparse: sparse: dereference of noderef expression
>> drivers/mfd/pef2256.c:308:37: sparse: sparse: incorrect type in argument 2 (different address spaces) @@     expected void [noderef] __iomem * @@     got void * @@
   drivers/mfd/pef2256.c:308:37: sparse:     expected void [noderef] __iomem *
   drivers/mfd/pef2256.c:308:37: sparse:     got void *
   drivers/mfd/pef2256.c:308:23: sparse: sparse: dereference of noderef expression
>> drivers/mfd/pef2256.c:303:38: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void const [noderef] __iomem * @@     got void * @@
   drivers/mfd/pef2256.c:303:38: sparse:     expected void const [noderef] __iomem *
   drivers/mfd/pef2256.c:303:38: sparse:     got void *
   drivers/mfd/pef2256.c:303:24: sparse: sparse: dereference of noderef expression
>> drivers/mfd/pef2256.c:308:37: sparse: sparse: incorrect type in argument 2 (different address spaces) @@     expected void [noderef] __iomem * @@     got void * @@
   drivers/mfd/pef2256.c:308:37: sparse:     expected void [noderef] __iomem *
   drivers/mfd/pef2256.c:308:37: sparse:     got void *
   drivers/mfd/pef2256.c:308:23: sparse: sparse: dereference of noderef expression
>> drivers/mfd/pef2256.c:303:38: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void const [noderef] __iomem * @@     got void * @@
   drivers/mfd/pef2256.c:303:38: sparse:     expected void const [noderef] __iomem *
   drivers/mfd/pef2256.c:303:38: sparse:     got void *
   drivers/mfd/pef2256.c:303:24: sparse: sparse: dereference of noderef expression
>> drivers/mfd/pef2256.c:308:37: sparse: sparse: incorrect type in argument 2 (different address spaces) @@     expected void [noderef] __iomem * @@     got void * @@
   drivers/mfd/pef2256.c:308:37: sparse:     expected void [noderef] __iomem *
   drivers/mfd/pef2256.c:308:37: sparse:     got void *
   drivers/mfd/pef2256.c:308:23: sparse: sparse: dereference of noderef expression
>> drivers/mfd/pef2256.c:303:38: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void const [noderef] __iomem * @@     got void * @@
   drivers/mfd/pef2256.c:303:38: sparse:     expected void const [noderef] __iomem *
   drivers/mfd/pef2256.c:303:38: sparse:     got void *
   drivers/mfd/pef2256.c:303:24: sparse: sparse: dereference of noderef expression
>> drivers/mfd/pef2256.c:308:37: sparse: sparse: incorrect type in argument 2 (different address spaces) @@     expected void [noderef] __iomem * @@     got void * @@
   drivers/mfd/pef2256.c:308:37: sparse:     expected void [noderef] __iomem *
   drivers/mfd/pef2256.c:308:37: sparse:     got void *
   drivers/mfd/pef2256.c:308:23: sparse: sparse: dereference of noderef expression
>> drivers/mfd/pef2256.c:308:37: sparse: sparse: incorrect type in argument 2 (different address spaces) @@     expected void [noderef] __iomem * @@     got void * @@
   drivers/mfd/pef2256.c:308:37: sparse:     expected void [noderef] __iomem *
   drivers/mfd/pef2256.c:308:37: sparse:     got void *
   drivers/mfd/pef2256.c:308:23: sparse: sparse: dereference of noderef expression
>> drivers/mfd/pef2256.c:308:37: sparse: sparse: incorrect type in argument 2 (different address spaces) @@     expected void [noderef] __iomem * @@     got void * @@
   drivers/mfd/pef2256.c:308:37: sparse:     expected void [noderef] __iomem *
   drivers/mfd/pef2256.c:308:37: sparse:     got void *
   drivers/mfd/pef2256.c:308:23: sparse: sparse: dereference of noderef expression
>> drivers/mfd/pef2256.c:303:38: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void const [noderef] __iomem * @@     got void * @@
   drivers/mfd/pef2256.c:303:38: sparse:     expected void const [noderef] __iomem *
   drivers/mfd/pef2256.c:303:38: sparse:     got void *
   drivers/mfd/pef2256.c:303:24: sparse: sparse: dereference of noderef expression
>> drivers/mfd/pef2256.c:308:37: sparse: sparse: incorrect type in argument 2 (different address spaces) @@     expected void [noderef] __iomem * @@     got void * @@
   drivers/mfd/pef2256.c:308:37: sparse:     expected void [noderef] __iomem *
   drivers/mfd/pef2256.c:308:37: sparse:     got void *
   drivers/mfd/pef2256.c:303:24: sparse: sparse: too many warnings

vim +303 drivers/mfd/pef2256.c

e94051d2538282 Herve Codina 2023-03-28  300  
e94051d2538282 Herve Codina 2023-03-28  301  static inline u8 pef2256_read8(struct pef2256 *pef2256, int offset)
e94051d2538282 Herve Codina 2023-03-28  302  {
e94051d2538282 Herve Codina 2023-03-28 @303  	return ioread8(pef2256->regs + offset);
e94051d2538282 Herve Codina 2023-03-28  304  }
e94051d2538282 Herve Codina 2023-03-28  305  
e94051d2538282 Herve Codina 2023-03-28  306  static inline void pef2256_write8(struct pef2256 *pef2256, int offset, u8 val)
e94051d2538282 Herve Codina 2023-03-28  307  {
e94051d2538282 Herve Codina 2023-03-28 @308  	iowrite8(val, pef2256->regs + offset);
e94051d2538282 Herve Codina 2023-03-28  309  }
e94051d2538282 Herve Codina 2023-03-28  310  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
