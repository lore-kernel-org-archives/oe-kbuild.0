Content-Type: multipart/mixed; boundary="===============5179121070520156063=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: [linux-next:master 9612/10347] mm/madvise.c:1174:66: warning: Parameter 'task' can be declared with const [constParameter]
Date: Thu, 14 Jul 2022 04:12:13 +0800
Message-ID: <202207140439.hkdcvwSl-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============5179121070520156063==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

:::::: =

:::::: Manual check reason: "low confidence static check warning: mm/madvis=
e.c:1174:66: warning: Parameter 'task' can be declared with const [constPar=
ameter]"
:::::: =


CC: kbuild-all(a)lists.01.org
BCC: lkp(a)intel.com
CC: Linux Memory Management List <linux-mm@kvack.org>
TO: "Zach O'Keefe" <zokeefe@google.com>
CC: Andrew Morton <akpm@linux-foundation.org>
CC: Linux Memory Management List <linux-mm@kvack.org>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git=
 master
head:   4662b7adea50bb62e993a67f611f3be625d3df0d
commit: 5e4507b87649326c597b9804979705c8269ed0b4 [9612/10347] mm/madvise: a=
dd MADV_COLLAPSE to process_madvise()
:::::: branch date: 8 hours ago
:::::: commit date: 2 days ago
compiler: powerpc-linux-gcc (GCC) 11.3.0
reproduce (cppcheck warning):
        # apt-get install cppcheck
        git checkout 5e4507b87649326c597b9804979705c8269ed0b4
        cppcheck --quiet --enable=3Dstyle,performance,portability --templat=
e=3Dgcc FILE

If you fix the issue, kindly add following tag where applicable
Reported-by: kernel test robot <lkp@intel.com>


cppcheck possible warnings: (new ones prefixed by >>, may not real problems)

   mm/madvise.c:1492:6: warning: Redundant assignment of 'ret' to itself. [=
selfAssignment]
    ret =3D (total_len - iov_iter_count(&iter)) ? : ret;
        ^
   mm/madvise.c:126:28: warning: Parameter 'anon_name' can be declared with=
 const [constParameter]
        struct anon_vma_name *anon_name)
                              ^
>> mm/madvise.c:1174:66: warning: Parameter 'task' can be declared with con=
st [constParameter]
   process_madvise_behavior_valid(int behavior, struct task_struct *task)
                                                                    ^

vim +/task +1174 mm/madvise.c

3866ea90d3635d Hugh Dickins 2009-09-21  1172  =

ecb8ac8b1f1469 Minchan Kim  2020-10-17  1173  static bool
5e4507b8764932 Zach O'Keefe 2022-07-06 @1174  process_madvise_behavior_vali=
d(int behavior, struct task_struct *task)
ecb8ac8b1f1469 Minchan Kim  2020-10-17  1175  {
ecb8ac8b1f1469 Minchan Kim  2020-10-17  1176  	switch (behavior) {
ecb8ac8b1f1469 Minchan Kim  2020-10-17  1177  	case MADV_COLD:
ecb8ac8b1f1469 Minchan Kim  2020-10-17  1178  	case MADV_PAGEOUT:
d5fffc5aff2697 zhangkui     2021-09-02  1179  	case MADV_WILLNEED:
ecb8ac8b1f1469 Minchan Kim  2020-10-17  1180  		return true;
5e4507b8764932 Zach O'Keefe 2022-07-06  1181  	case MADV_COLLAPSE:
5e4507b8764932 Zach O'Keefe 2022-07-06  1182  		return task =3D=3D current =
|| capable(CAP_SYS_ADMIN);
ecb8ac8b1f1469 Minchan Kim  2020-10-17  1183  	default:
ecb8ac8b1f1469 Minchan Kim  2020-10-17  1184  		return false;
ecb8ac8b1f1469 Minchan Kim  2020-10-17  1185  	}
ecb8ac8b1f1469 Minchan Kim  2020-10-17  1186  }
ecb8ac8b1f1469 Minchan Kim  2020-10-17  1187  =


-- =

0-DAY CI Kernel Test Service
https://01.org/lkp
--===============5179121070520156063==--

