Content-Type: multipart/mixed; boundary="===============2105746652463941771=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: Re: [net-next v2 10/10] net-procfs: Show page pool stats in proc
Date: Sun, 30 Jan 2022 13:33:20 +0800
Message-ID: <202201301344.ROilifQC-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============2105746652463941771==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

CC: kbuild-all(a)lists.01.org
In-Reply-To: <1643499540-8351-11-git-send-email-jdamato@fastly.com>
References: <1643499540-8351-11-git-send-email-jdamato@fastly.com>
TO: Joe Damato <jdamato@fastly.com>
TO: netdev(a)vger.kernel.org
TO: kuba(a)kernel.org
TO: ilias.apalodimas(a)linaro.org
TO: davem(a)davemloft.net
TO: hawk(a)kernel.org
CC: Joe Damato <jdamato@fastly.com>

Hi Joe,

Thank you for the patch! Perhaps something to improve:

[auto build test WARNING on net-next/master]

url:    https://github.com/0day-ci/linux/commits/Joe-Damato/page_pool-Add-p=
age_pool-stat-counters/20220130-074147
base:   https://git.kernel.org/pub/scm/linux/kernel/git/davem/net-next.git =
ff58831fa02deb42fd731f830d8d9ec545573c7c
:::::: branch date: 5 hours ago
:::::: commit date: 5 hours ago
config: x86_64-randconfig-s022 (https://download.01.org/0day-ci/archive/202=
20130/202201301344.ROilifQC-lkp(a)intel.com/config)
compiler: gcc-9 (Debian 9.3.0-22) 9.3.0
reproduce:
        # apt-get install sparse
        # sparse version: v0.6.4-dirty
        # https://github.com/0day-ci/linux/commit/5f0fd838269d51e7a97662eaf=
54868a248b8bd42
        git remote add linux-review https://github.com/0day-ci/linux
        git fetch --no-tags linux-review Joe-Damato/page_pool-Add-page_pool=
-stat-counters/20220130-074147
        git checkout 5f0fd838269d51e7a97662eaf54868a248b8bd42
        # save the config file to linux build tree
        mkdir build_dir
        make W=3D1 C=3D1 CF=3D'-fdiagnostic-prefix -D__CHECK_ENDIAN__' O=3D=
build_dir ARCH=3Dx86_64 SHELL=3D/bin/bash net/core/

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>


sparse warnings: (new ones prefixed by >>)
>> net/core/net-procfs.c:399:1: sparse: sparse: unused label 'out_ptype'

vim +/out_ptype +399 net/core/net-procfs.c

5f0fd838269d51 Joe Damato 2022-01-29  398  =

900ff8c6321418 Cong Wang  2013-02-18 @399  out_ptype:
900ff8c6321418 Cong Wang  2013-02-18  400  	remove_proc_entry("ptype", net-=
>proc_net);
900ff8c6321418 Cong Wang  2013-02-18  401  out_softnet:
900ff8c6321418 Cong Wang  2013-02-18  402  	remove_proc_entry("softnet_stat=
", net->proc_net);
900ff8c6321418 Cong Wang  2013-02-18  403  out_dev:
900ff8c6321418 Cong Wang  2013-02-18  404  	remove_proc_entry("dev", net->p=
roc_net);
900ff8c6321418 Cong Wang  2013-02-18  405  	goto out;
900ff8c6321418 Cong Wang  2013-02-18  406  }
900ff8c6321418 Cong Wang  2013-02-18  407  =


---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all(a)lists.01.org
--===============2105746652463941771==--

