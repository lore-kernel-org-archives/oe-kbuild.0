Content-Type: multipart/mixed; boundary="===============5378455296255375175=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: drivers/hsi/clients/hsi_char.c:147:15: warning: use of uninitialized value '*msg.sgt.sgl' [CWE-457]
Date: Mon, 15 Aug 2022 09:52:51 +0800
Message-ID: <202208150952.mmo9Tp0N-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============5378455296255375175==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

:::::: =

:::::: Manual check reason: "low confidence bisect report"
:::::: Manual check reason: "low confidence static check first_new_problem:=
 drivers/hsi/clients/hsi_char.c:147:15: warning: use of uninitialized value=
 '*msg.sgt.sgl' [CWE-457] [-Wanalyzer-use-of-uninitialized-value]"
:::::: =


BCC: lkp(a)intel.com
CC: kbuild-all(a)lists.01.org
CC: linux-kernel(a)vger.kernel.org
TO: Ard Biesheuvel <ardb@kernel.org>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git =
master
head:   568035b01cfb107af8d2e4bd2fb9aea22cf5b868
commit: 9c46929e7989efacc1dd0a1dd662a839897ea2b6 ARM: implement THREAD_INFO=
_IN_TASK for uniprocessor systems
date:   8 months ago
:::::: branch date: 3 hours ago
:::::: commit date: 8 months ago
config: arm-randconfig-c002-20220810 (https://download.01.org/0day-ci/archi=
ve/20220815/202208150952.mmo9Tp0N-lkp(a)intel.com/config)
compiler: arm-linux-gnueabi-gcc (GCC) 12.1.0
reproduce (this is a W=3D1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/=
make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.gi=
t/commit/?id=3D9c46929e7989efacc1dd0a1dd662a839897ea2b6
        git remote add linus https://git.kernel.org/pub/scm/linux/kernel/gi=
t/torvalds/linux.git
        git fetch --no-tags linus master
        git checkout 9c46929e7989efacc1dd0a1dd662a839897ea2b6
        # save the config file
        COMPILER_INSTALL_PATH=3D$HOME/0day COMPILER=3Dgcc-12.1.0 make.cross=
 ARCH=3Darm KBUILD_USERCFLAGS=3D'-fanalyzer -Wno-error' =


If you fix the issue, kindly add following tag where applicable
Reported-by: kernel test robot <lkp@intel.com>

gcc-analyzer warnings: (new ones prefixed by >>)
   drivers/hsi/clients/hsi_char.c: In function 'hsc_msg_free':
>> drivers/hsi/clients/hsi_char.c:147:15: warning: use of uninitialized val=
ue '*msg.sgt.sgl' [CWE-457] [-Wanalyzer-use-of-uninitialized-value]
     147 |         kfree(sg_virt(msg->sgt.sgl));
         |               ^~~~~~~~~~~~~~~~~~~~~
     'hsc_reset_list': event 1
       |
       |  161 | static void hsc_reset_list(struct hsc_channel *channel, str=
uct list_head *l)
       |      |             ^~~~~~~~~~~~~~
       |      |             |
       |      |             (1) entry to 'hsc_reset_list'
       |
     'hsc_reset_list': event 2
       |
       |  164 |         LIST_HEAD(list);
       |      |                   ^~~~
       |      |                   |
       |      |                   (2) region created on stack here
   include/linux/list.h:26:26: note: in definition of macro 'LIST_HEAD'
       |   26 |         struct list_head name =3D LIST_HEAD_INIT(name)
       |      |                          ^~~~
       |
     'hsc_reset_list': event 3
       |
       |drivers/hsi/clients/hsi_char.c:167:9:
       |  167 |         list_splice_init(l, &list);
       |      |         ^~~~~~~~~~~~~~~~~~~~~~~~~~
       |      |         |
       |      |         (3) calling 'list_splice_init' from 'hsc_reset_list'
       |
       +--> 'list_splice_init': events 4-6
              |
              |include/linux/list.h:480:20:
              |  480 | static inline void list_splice_init(struct list_head=
 *list,
              |      |                    ^~~~~~~~~~~~~~~~
              |      |                    |
              |      |                    (4) entry to 'list_splice_init'
              |......
              |  483 |         if (!list_empty(list)) {
              |      |            ~        =

              |      |            |
              |      |            (5) following 'false' branch...
              |......
              |  487 | }
              |      | ~                   =

              |      | |
              |      | (6) ...to here
              |
       <------+
       |
     'hsc_reset_list': events 7-8
       |
       |drivers/hsi/clients/hsi_char.c:167:9:
       |  167 |         list_splice_init(l, &list);
       |      |         ^~~~~~~~~~~~~~~~~~~~~~~~~~
       |      |         |
       |      |         (7) returning to 'hsc_reset_list' from 'list_splice=
_init'
       |......
       |  170 |         hsc_free_list(&list);
       |      |         ~~~~~~~~~~~~~~~~~~~~
       |      |         |
       |      |         (8) calling 'hsc_free_list' from 'hsc_reset_list'
       |
       +--> 'hsc_free_list': event 9
              |
              |  151 | static void hsc_free_list(struct list_head *list)
              |      |             ^~~~~~~~~~~~~
              |      |             |
              |      |             (9) entry to 'hsc_free_list'
              |
            'hsc_free_list': event 10
              |
              |include/linux/list.h:719:14:
              |  719 |              !list_entry_is_head(pos, head, member);=
                    \
              |      |              ^
              |      |              |
              |      |              (10) following 'true' branch...
   drivers/hsi/clients/hsi_char.c:155:9: note: in expansion of macro 'list_=
for_each_entry_safe'
              |  155 |         list_for_each_entry_safe(msg, tmp, list, lin=
k) {
              |      |         ^~~~~~~~~~~~~~~~~~~~~~~~
              |
            'hsc_free_list': events 11-12
              |
              |  156 |                 list_del(&msg->link);
              |      |                 ^~~~~~~~~~~~~~~~~~~~
              |      |                 |
              |      |                 (11) ...to here
              |  157 |                 hsc_msg_free(msg);
              |      |                 ~~~~~~~~~~~~~~~~~
              |      |                 |
              |      |                 (12) calling 'hsc_msg_free' from 'hs=
c_free_list'
              |
              +--> 'hsc_msg_free': events 13-14
                     |
                     |  145 | static inline void hsc_msg_free(struct hsi_ms=
g *msg)
                     |      |                    ^~~~~~~~~~~~
                     |      |                    |
                     |      |                    (13) entry to 'hsc_msg_fre=
e'
                     |  146 | {
                     |  147 |         kfree(sg_virt(msg->sgt.sgl));
                     |      |               ~~~~~~~~~~~~~~~~~~~~~
                     |      |               |
                     |      |               (14) use of uninitialized value=
 '*msg.sgt.sgl' here

vim +147 drivers/hsi/clients/hsi_char.c

4e69fc22753fcc Andras Domokos 2010-09-30  144  =

4e69fc22753fcc Andras Domokos 2010-09-30  145  static inline void hsc_msg_f=
ree(struct hsi_msg *msg)
4e69fc22753fcc Andras Domokos 2010-09-30  146  {
4e69fc22753fcc Andras Domokos 2010-09-30 @147  	kfree(sg_virt(msg->sgt.sgl)=
);
4e69fc22753fcc Andras Domokos 2010-09-30  148  	hsi_free_msg(msg);
4e69fc22753fcc Andras Domokos 2010-09-30  149  }
4e69fc22753fcc Andras Domokos 2010-09-30  150  =


:::::: The code at line 147 was first introduced by commit
:::::: 4e69fc22753fcce1d9275b5517ef3646ffeffcf4 HSI: hsi_char: Add HSI char=
 device driver

:::::: TO: Andras Domokos <andras.domokos@nokia.com>
:::::: CC: Carlos Chinea <carlos.chinea@nokia.com>

-- =

0-DAY CI Kernel Test Service
https://01.org/lkp
--===============5378455296255375175==--

