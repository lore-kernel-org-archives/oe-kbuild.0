Content-Type: multipart/mixed; boundary="===============5218272871664617445=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: drivers/target/iscsi/iscsi_target_configfs.c:1133:9: warning: sprintf format string requires 2 parameters but only 1 is given. [wrongPrintfScanfArgNum]
Date: Sun, 22 May 2022 09:59:33 +0800
Message-ID: <202205220958.5ymVBsxw-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============5218272871664617445==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

CC: kbuild-all(a)lists.01.org
BCC: lkp(a)intel.com
CC: linux-kernel(a)vger.kernel.org
TO: Mingzhe Zou <mingzhe.zou@easystack.cn>
CC: "Martin K. Petersen" <martin.petersen@oracle.com>
CC: Mike Christie <michael.christie@oracle.com>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git =
master
head:   eaea45fc0e7b6ae439526b4a41d91230c8517336
commit: d72d827f2f2636d8d72f0f3ebe5b661c9a24d343 scsi: target: Add iscsi/cp=
us_allowed_list in configfs
date:   10 weeks ago
:::::: branch date: 2 hours ago
:::::: commit date: 10 weeks ago
compiler: m68k-linux-gcc (GCC) 11.3.0
reproduce (cppcheck warning):
        # apt-get install cppcheck
        git checkout d72d827f2f2636d8d72f0f3ebe5b661c9a24d343
        cppcheck --quiet --enable=3Dstyle,performance,portability --templat=
e=3Dgcc FILE

If you fix the issue, kindly add following tag where applicable
Reported-by: kernel test robot <lkp@intel.com>


cppcheck possible warnings: (new ones prefixed by >>, may not real problems)

>> drivers/target/iscsi/iscsi_target_configfs.c:1133:9: warning: sprintf fo=
rmat string requires 2 parameters but only 1 is given. [wrongPrintfScanfArg=
Num]
    return sprintf(page, "%*pbln",
           ^

vim +1133 drivers/target/iscsi/iscsi_target_configfs.c

e48354ce078c07 Nicholas Bellinger 2011-07-23  1129  =

d72d827f2f2636 Mingzhe Zou        2022-03-01  1130  static ssize_t lio_targ=
et_wwn_cpus_allowed_list_show(
d72d827f2f2636 Mingzhe Zou        2022-03-01  1131  		struct config_item *i=
tem, char *page)
d72d827f2f2636 Mingzhe Zou        2022-03-01  1132  {
d72d827f2f2636 Mingzhe Zou        2022-03-01 @1133  	return sprintf(page, "=
%*pbl\n",
d72d827f2f2636 Mingzhe Zou        2022-03-01  1134  		       cpumask_pr_arg=
s(iscsit_global->allowed_cpumask));
d72d827f2f2636 Mingzhe Zou        2022-03-01  1135  }
d72d827f2f2636 Mingzhe Zou        2022-03-01  1136  =


-- =

0-DAY CI Kernel Test Service
https://01.org/lkp
--===============5218272871664617445==--

