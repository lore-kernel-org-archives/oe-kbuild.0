Content-Type: multipart/mixed; boundary="===============7378460418886196565=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: [linux-next:master 3554/8914] drivers/ntb/test/ntb_perf.c:1445:9: warning: shift by negative count ('-1')
Date: Sun, 10 Jul 2022 16:50:45 +0800
Message-ID: <202207101631.dDysXHl9-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============7378460418886196565==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

:::::: =

:::::: Manual check reason: "low confidence bisect report"
:::::: Manual check reason: "low confidence static check warning: drivers/n=
tb/test/ntb_perf.c:1445:9: warning: shift by negative count ('-1') [-Wanaly=
zer-shift-count-negative]"
:::::: =


CC: kbuild-all(a)lists.01.org
BCC: lkp(a)intel.com
CC: Linux Memory Management List <linux-mm@kvack.org>
TO: Alexander Fomichev <a.fomichev@yadro.com>
CC: Jon Mason <jdmason@kudzu.us>
CC: Dave Jiang <dave.jiang@intel.com>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git=
 master
head:   f2528c29385819a84480cacef4886b049761e2c5
commit: d3b4b9c2142ca288f81a373841989f592f138934 [3554/8914] ntb_perf: exte=
nd with doorbell latency measurement
:::::: branch date: 2 days ago
:::::: commit date: 3 weeks ago
config: arm-randconfig-c002-20220710 (https://download.01.org/0day-ci/archi=
ve/20220710/202207101631.dDysXHl9-lkp(a)intel.com/config)
compiler: arm-linux-gnueabi-gcc (GCC) 11.3.0
reproduce (this is a W=3D1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/=
make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.g=
it/commit/?id=3Dd3b4b9c2142ca288f81a373841989f592f138934
        git remote add linux-next https://git.kernel.org/pub/scm/linux/kern=
el/git/next/linux-next.git
        git fetch --no-tags linux-next master
        git checkout d3b4b9c2142ca288f81a373841989f592f138934
        # save the config file
         ARCH=3Darm KBUILD_USERCFLAGS=3D'-fanalyzer -Wno-error' =


If you fix the issue, kindly add following tag where applicable
Reported-by: kernel test robot <lkp@intel.com>


gcc-analyzer warnings: (new ones prefixed by >>)
   drivers/ntb/test/ntb_perf.c: In function 'perf_clear_dbl':
>> drivers/ntb/test/ntb_perf.c:1445:9: warning: shift by negative count ('-=
1') [-Wanalyzer-shift-count-negative]
    1445 |         ntb_db_set_mask(perf->ntb, BIT_ULL(data->db));
         |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
     'perf_clear_dbl': event 1
       |
       | 1445 |         ntb_db_set_mask(perf->ntb, BIT_ULL(data->db));
       |      |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
       |      |         |
       |      |         (1) shift by negative amount here ('-1')
       |

vim +1445 drivers/ntb/test/ntb_perf.c

d3b4b9c2142ca2 Alexander Fomichev 2022-05-13  1439  =

d3b4b9c2142ca2 Alexander Fomichev 2022-05-13  1440  static void perf_clear_=
dbl(struct perf_ext_lat_data *data)
d3b4b9c2142ca2 Alexander Fomichev 2022-05-13  1441  {
d3b4b9c2142ca2 Alexander Fomichev 2022-05-13  1442  	struct perf_ctx *perf =
=3D data->perf;
d3b4b9c2142ca2 Alexander Fomichev 2022-05-13  1443  =

d3b4b9c2142ca2 Alexander Fomichev 2022-05-13  1444  	data->db =3D -1;
d3b4b9c2142ca2 Alexander Fomichev 2022-05-13 @1445  	ntb_db_set_mask(perf->=
ntb, BIT_ULL(data->db));
d3b4b9c2142ca2 Alexander Fomichev 2022-05-13  1446  	atomic_set(&perf->runn=
ing, 0);
d3b4b9c2142ca2 Alexander Fomichev 2022-05-13  1447  	wake_up(&perf->twait);
d3b4b9c2142ca2 Alexander Fomichev 2022-05-13  1448  }
d3b4b9c2142ca2 Alexander Fomichev 2022-05-13  1449  =


-- =

0-DAY CI Kernel Test Service
https://01.org/lkp
--===============7378460418886196565==--

