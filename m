Content-Type: multipart/mixed; boundary="===============9141267796523114511=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: Re: [PATCH v13 2/4] dmaengine: tegra: Add tegra gpcdma driver
Date: Tue, 23 Nov 2021 22:41:32 +0800
Message-ID: <202111232224.zJjcC2ae-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============9141267796523114511==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

CC: kbuild-all(a)lists.01.org
In-Reply-To: <1637573292-13214-3-git-send-email-akhilrajeev@nvidia.com>
References: <1637573292-13214-3-git-send-email-akhilrajeev@nvidia.com>
TO: Akhil R <akhilrajeev@nvidia.com>
TO: dan.j.williams(a)intel.com
TO: devicetree(a)vger.kernel.org
TO: dmaengine(a)vger.kernel.org
TO: jonathanh(a)nvidia.com
TO: kyarlagadda(a)nvidia.com
TO: ldewangan(a)nvidia.com
TO: linux-kernel(a)vger.kernel.org
TO: linux-tegra(a)vger.kernel.org
TO: p.zabel(a)pengutronix.de
TO: rgumasta(a)nvidia.com

Hi Akhil,

Thank you for the patch! Perhaps something to improve:

[auto build test WARNING on robh/for-next]
[also build test WARNING on vkoul-dmaengine/next arm64/for-next/core v5.16-=
rc2 next-20211123]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch]

url:    https://github.com/0day-ci/linux/commits/Akhil-R/Add-NVIDIA-Tegra-G=
PC-DMA-driver/20211122-173019
base:   https://git.kernel.org/pub/scm/linux/kernel/git/robh/linux.git for-=
next
:::::: branch date: 29 hours ago
:::::: commit date: 29 hours ago
config: riscv-randconfig-c004-20211123 (https://download.01.org/0day-ci/arc=
hive/20211123/202111232224.zJjcC2ae-lkp(a)intel.com/config.gz)
compiler: riscv64-linux-gcc (GCC) 11.2.0

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>
Reported-by: Julia Lawall <julia.lawall@lip6.fr>


cocci warnings: (new ones prefixed by >>)
>> drivers/dma/tegra186-gpc-dma.c:241:26-34: WARNING use flexible-array mem=
ber instead (https://www.kernel.org/doc/html/latest/process/deprecated.html=
#zero-length-and-one-element-arrays)
--
>> drivers/dma/tegra186-gpc-dma.c:1271:3-8: No need to set .owner here. The=
 core will do it.

Please review and possibly fold the followup patch.

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all(a)lists.01.org
--===============9141267796523114511==--

