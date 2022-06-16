Content-Type: multipart/mixed; boundary="===============7624700267871612662=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: Re: [PATCH net-next 2/2] net: axienet: Use iowrite64 to write all 64b descriptor pointers
Date: Thu, 16 Jun 2022 08:19:38 +0800
Message-ID: <202206160857.k9KhIFKX-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============7624700267871612662==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

:::::: =

:::::: Manual check reason: "low confidence bisect report"
:::::: Manual check reason: "low confidence static check first_new_problem:=
 ERROR: modpost: "iowrite64" [drivers/net/ethernet/xilinx/xilinx_emac.ko] u=
ndefined!"
:::::: =


CC: kbuild-all(a)lists.01.org
BCC: lkp(a)intel.com
In-Reply-To: <20220613034202.3777248-3-andy.chiu@sifive.com>
References: <20220613034202.3777248-3-andy.chiu@sifive.com>
TO: Andy Chiu <andy.chiu@sifive.com>

Hi Andy,

Thank you for the patch! Yet something to improve:

[auto build test ERROR on net-next/master]

url:    https://github.com/intel-lab-lkp/linux/commits/Andy-Chiu/net-axiene=
t-fix-DMA-Tx-error/20220613-114738
base:   https://git.kernel.org/pub/scm/linux/kernel/git/davem/net-next.git =
27f2533bcc6e909b85d3c1b738fa1f203ed8a835
:::::: branch date: 3 days ago
:::::: commit date: 3 days ago
config: x86_64-randconfig-c001-20220613 (https://download.01.org/0day-ci/ar=
chive/20220616/202206160857.k9KhIFKX-lkp(a)intel.com/config)
compiler: gcc-11 (Debian 11.3.0-3) 11.3.0
reproduce (this is a W=3D1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/=
make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://github.com/intel-lab-lkp/linux/commit/6c45bbcce325f6c9c90=
7ed0a11ddc13d8026bbcf
        git remote add linux-review https://github.com/intel-lab-lkp/linux
        git fetch --no-tags linux-review Andy-Chiu/net-axienet-fix-DMA-Tx-e=
rror/20220613-114738
        git checkout 6c45bbcce325f6c9c907ed0a11ddc13d8026bbcf
        # save the config file
         =


If you fix the issue, kindly add following tag where applicable
Reported-by: kernel test robot <lkp@intel.com>

All errors (new ones prefixed by >>, old ones prefixed by <<):

>> ERROR: modpost: "iowrite64" [drivers/net/ethernet/xilinx/xilinx_emac.ko]=
 undefined!

-- =

0-DAY CI Kernel Test Service
https://01.org/lkp
--===============7624700267871612662==--

