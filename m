Content-Type: multipart/mixed; boundary="===============1047714391426174848=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: kismet: WARNING: unmet direct dependencies detected for PM_GENERIC_DOMAINS_OF when selected by QCOM_RPMPD
Date: Sat, 06 Aug 2022 09:07:15 +0800
Message-ID: <202208060923.DrywHbPW-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============1047714391426174848==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

:::::: =

:::::: Manual check reason: "only Kconfig file updated"
:::::: =


BCC: lkp(a)intel.com
CC: Paul Gazzillo <paul@pgazz.com>
CC: Necip Fazil Yildiran <fazilyildiran@gmail.com>
CC: kbuild-all(a)lists.01.org
CC: linux-kernel(a)vger.kernel.org
TO: Konrad Dybcio <konrad.dybcio@somainline.org>
CC: Bjorn Andersson <bjorn.andersson@linaro.org>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git =
master
head:   74cae210a335d159f2eb822e261adee905b6951a
commit: 7d0221fb59125181a31ef3a561306c70fb238bc7 soc/qcom: Make QCOM_RPMPD =
select PM_GENERIC_DOMAINS/_OF
date:   4 weeks ago
:::::: branch date: 4 hours ago
:::::: commit date: 4 weeks ago
config: x86_64-kismet-CONFIG_PM_GENERIC_DOMAINS_OF-CONFIG_QCOM_RPMPD-0-0 (h=
ttps://download.01.org/0day-ci/archive/20220806/202208060923.DrywHbPW-lkp(a=
)intel.com/config)
reproduce:
        # https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.gi=
t/commit/?id=3D7d0221fb59125181a31ef3a561306c70fb238bc7
        git remote add linus https://git.kernel.org/pub/scm/linux/kernel/gi=
t/torvalds/linux.git
        git fetch --no-tags linus master
        git checkout 7d0221fb59125181a31ef3a561306c70fb238bc7
        # 1. reproduce by kismet
           # install kmax per https://github.com/paulgazz/kmax/blob/master/=
README.md
           kismet --linux-ksrc=3Dlinux --selectees CONFIG_PM_GENERIC_DOMAIN=
S_OF --selectors CONFIG_QCOM_RPMPD -a=3Dx86_64
        # 2. reproduce by make
           # save the config file to linux source tree
           cd linux
           make ARCH=3Dx86_64 olddefconfig

If you fix the issue, kindly add following tag where applicable
Reported-by: kernel test robot <lkp@intel.com>

kismet warnings: (new ones prefixed by >>)
>> kismet: WARNING: unmet direct dependencies detected for PM_GENERIC_DOMAI=
NS_OF when selected by QCOM_RPMPD
   =

   WARNING: unmet direct dependencies detected for PM_GENERIC_DOMAINS
     Depends on [n]: PM [=3Dn]
     Selected by [y]:
     - QCOM_RPMPD [=3Dy] && QCOM_SMD_RPM [=3Dy]
   =

   WARNING: unmet direct dependencies detected for PM_GENERIC_DOMAINS_OF
     Depends on [n]: PM_GENERIC_DOMAINS [=3Dy] && OF [=3Dn]
     Selected by [y]:
     - QCOM_RPMPD [=3Dy] && QCOM_SMD_RPM [=3Dy]

-- =

0-DAY CI Kernel Test Service
https://01.org/lkp
--===============1047714391426174848==--

