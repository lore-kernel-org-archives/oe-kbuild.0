Content-Type: multipart/mixed; boundary="===============0334568445279287396=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: drivers/nvme/target/auth.c:25:23: warning: use of uninitialized value '<unknown>' [CWE-457]
Date: Sun, 04 Sep 2022 03:20:01 +0800
Message-ID: <202209040308.XtATabfm-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============0334568445279287396==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

:::::: =

:::::: Manual check reason: "low confidence bisect report"
:::::: Manual check reason: "low confidence static check warning: drivers/n=
vme/target/auth.c:25:23: warning: use of uninitialized value '<unknown>' [C=
WE-457] [-Wanalyzer-use-of-uninitialized-value]"
:::::: =


BCC: lkp(a)intel.com
CC: kbuild-all(a)lists.01.org
CC: linux-kernel(a)vger.kernel.org
TO: Hannes Reinecke <hare@suse.de>
CC: Jens Axboe <axboe@kernel.dk>
CC: Sagi Grimberg <sagi@grimberg.me>
CC: Christoph Hellwig <hch@lst.de>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git =
master
head:   d895ec7938c431fe61a731939da76a6461bc6133
commit: db1312dd95488b5e6ff362ff66fcf953a46b1821 nvmet: implement basic In-=
Band Authentication
date:   5 weeks ago
:::::: branch date: 19 hours ago
:::::: commit date: 5 weeks ago
config: arm-randconfig-c002-20220830 (https://download.01.org/0day-ci/archi=
ve/20220904/202209040308.XtATabfm-lkp(a)intel.com/config)
compiler: arm-linux-gnueabi-gcc (GCC) 12.1.0
reproduce (this is a W=3D1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/=
make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.gi=
t/commit/?id=3Ddb1312dd95488b5e6ff362ff66fcf953a46b1821
        git remote add linus https://git.kernel.org/pub/scm/linux/kernel/gi=
t/torvalds/linux.git
        git fetch --no-tags linus master
        git checkout db1312dd95488b5e6ff362ff66fcf953a46b1821
        # save the config file
        COMPILER_INSTALL_PATH=3D$HOME/0day COMPILER=3Dgcc-12.1.0 make.cross=
 ARCH=3Darm KBUILD_USERCFLAGS=3D'-fanalyzer -Wno-error' =


If you fix the issue, kindly add following tag where applicable
Reported-by: kernel test robot <lkp@intel.com>

gcc_analyzer warnings: (new ones prefixed by >>)
   drivers/nvme/target/auth.c: In function 'nvmet_auth_set_key':
>> drivers/nvme/target/auth.c:25:23: warning: use of uninitialized value '<=
unknown>' [CWE-457] [-Wanalyzer-use-of-uninitialized-value]
      25 |         unsigned char key_hash;
         |                       ^~~~~~~~
     'nvmet_auth_set_key': event 1
       |
       |   25 |         unsigned char key_hash;
       |      |                       ^~~~~~~~
       |      |                       |
       |      |                       (1) use of uninitialized value '<unkn=
own>' here
       |
   In file included from include/linux/printk.h:573,
                    from include/linux/kernel.h:29,
                    from include/linux/cpumask.h:10,
                    from include/linux/mm_types_task.h:14,
                    from include/linux/mm_types.h:5,
                    from include/linux/buildid.h:5,
                    from include/linux/module.h:14,
                    from drivers/nvme/target/auth.c:8:
   drivers/nvme/target/auth.c: In function 'nvmet_setup_auth':
   drivers/nvme/target/auth.c:129:32: warning: dereference of NULL '*ctrl.c=
trl_key' [CWE-476] [-Wanalyzer-null-dereference]
     129 |                  ctrl->ctrl_key->hash > 0 ?
         |                  ~~~~~~~~~~~~~~^~~~~~
   include/linux/dynamic_debug.h:134:29: note: in definition of macro '__dy=
namic_func_call'
     134 |                 func(&id, ##__VA_ARGS__);               \
         |                             ^~~~~~~~~~~
   include/linux/dynamic_debug.h:162:9: note: in expansion of macro '_dynam=
ic_func_call'
     162 |         _dynamic_func_call(fmt, __dynamic_pr_debug,             \
         |         ^~~~~~~~~~~~~~~~~~
   include/linux/printk.h:588:9: note: in expansion of macro 'dynamic_pr_de=
bug'
     588 |         dynamic_pr_debug(fmt, ##__VA_ARGS__)
         |         ^~~~~~~~~~~~~~~~
   drivers/nvme/target/auth.c:128:9: note: in expansion of macro 'pr_debug'
     128 |         pr_debug("%s: using ctrl hash %s key %*ph\n", __func__,
         |         ^~~~~~~~
     'nvmet_setup_auth': events 1-3
       |
       |   65 |         if (nvmet_is_disc_subsys(ctrl->subsys))
       |      |            ^
       |      |            |
       |      |            (1) following 'false' branch...
       |......
       |   68 |         if (ctrl->subsys->allow_any_host)
       |      |            ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
       |      |            |            |
       |      |            |            (2) ...to here
       |      |            (3) following 'false' branch...
       |
     'nvmet_setup_auth': event 4
       |
       |include/linux/container_of.h:18:15:
       |   18 |         void *__mptr =3D (void *)(ptr);                    =
               \
       |      |               ^~~~~~
       |      |               |
       |      |               (4) ...to here
   include/linux/list.h:520:9: note: in expansion of macro 'container_of'
       |  520 |         container_of(ptr, type, member)
       |      |         ^~~~~~~~~~~~
   include/linux/list.h:531:9: note: in expansion of macro 'list_entry'
       |  531 |         list_entry((ptr)->next, type, member)
       |      |         ^~~~~~~~~~
   include/linux/list.h:674:20: note: in expansion of macro 'list_first_ent=
ry'
       |  674 |         for (pos =3D list_first_entry(head, typeof(*pos), m=
ember);        \
       |      |                    ^~~~~~~~~~~~~~~~
   drivers/nvme/target/auth.c:71:9: note: in expansion of macro 'list_for_e=
ach_entry'
       |   71 |         list_for_each_entry(p, &ctrl->subsys->hosts, entry)=
 {
       |      |         ^~~~~~~~~~~~~~~~~~~
       |
     'nvmet_setup_auth': event 5
       |
       |include/linux/list.h:675:14:
       |  675 |              !list_entry_is_head(pos, head, member);       =
             \
       |      |              ^
       |      |              |
       |      |              (5) following 'true' branch...
   drivers/nvme/target/auth.c:71:9: note: in expansion of macro 'list_for_e=
ach_entry'
       |   71 |         list_for_each_entry(p, &ctrl->subsys->hosts, entry)=
 {
       |      |         ^~~~~~~~~~~~~~~~~~~
       |
     'nvmet_setup_auth': event 6
       |
       |include/linux/dynamic_debug.h:126:28:
       |  126 |         unlikely(descriptor.flags & _DPRINTK_FLAGS_PRINT)
   include/linux/compiler.h:78:45: note: in definition of macro 'unlikely'
       |   78 | # define unlikely(x)    __builtin_expect(!!(x), 0)
       |      |                                             ^
   include/linux/dynamic_debug.h:133:13: note: in expansion of macro 'DYNAM=
IC_DEBUG_BRANCH'
       |  133 |         if (DYNAMIC_DEBUG_BRANCH(id))                   \
       |      |             ^~~~~~~~~~~~~~~~~~~~
   include/linux/dynamic_debug.h:152:9: note: in expansion of macro '__dyna=
mic_func_call'
       |  152 |         __dynamic_func_call(__UNIQUE_ID(ddebug), fmt, func,=
 ##__VA_ARGS__)
       |      |         ^~~~~~~~~~~~~~~~~~~
   include/linux/dynamic_debug.h:162:9: note: in expansion of macro '_dynam=
ic_func_call'
       |  162 |         _dynamic_func_call(fmt, __dynamic_pr_debug,        =
     \
       |      |         ^~~~~~~~~~~~~~~~~~
   include/linux/printk.h:588:9: note: in expansion of macro 'dynamic_pr_de=
bug'
       |  588 |         dynamic_pr_debug(fmt, ##__VA_ARGS__)
       |      |         ^~~~~~~~~~~~~~~~
   drivers/nvme/target/auth.c:72:17: note: in expansion of macro 'pr_debug'
       |   72 |                 pr_debug("check %s\n", nvmet_host_name(p->h=
ost));
       |      |                 ^~~~~~~~
       |

vim +25 drivers/nvme/target/auth.c

db1312dd95488b Hannes Reinecke 2022-06-27  21  =

db1312dd95488b Hannes Reinecke 2022-06-27  22  int nvmet_auth_set_key(struc=
t nvmet_host *host, const char *secret,
db1312dd95488b Hannes Reinecke 2022-06-27  23  		       bool set_ctrl)
db1312dd95488b Hannes Reinecke 2022-06-27  24  {
db1312dd95488b Hannes Reinecke 2022-06-27 @25  	unsigned char key_hash;
db1312dd95488b Hannes Reinecke 2022-06-27  26  	char *dhchap_secret;
db1312dd95488b Hannes Reinecke 2022-06-27  27  =

db1312dd95488b Hannes Reinecke 2022-06-27  28  	if (sscanf(secret, "DHHC-1:=
%hhd:%*s", &key_hash) !=3D 1)
db1312dd95488b Hannes Reinecke 2022-06-27  29  		return -EINVAL;
db1312dd95488b Hannes Reinecke 2022-06-27  30  	if (key_hash > 3) {
db1312dd95488b Hannes Reinecke 2022-06-27  31  		pr_warn("Invalid DH-HMAC-C=
HAP hash id %d\n",
db1312dd95488b Hannes Reinecke 2022-06-27  32  			 key_hash);
db1312dd95488b Hannes Reinecke 2022-06-27  33  		return -EINVAL;
db1312dd95488b Hannes Reinecke 2022-06-27  34  	}
db1312dd95488b Hannes Reinecke 2022-06-27  35  	if (key_hash > 0) {
db1312dd95488b Hannes Reinecke 2022-06-27  36  		/* Validate selected hash =
algorithm */
db1312dd95488b Hannes Reinecke 2022-06-27  37  		const char *hmac =3D nvme_=
auth_hmac_name(key_hash);
db1312dd95488b Hannes Reinecke 2022-06-27  38  =

db1312dd95488b Hannes Reinecke 2022-06-27  39  		if (!crypto_has_shash(hmac=
, 0, 0)) {
db1312dd95488b Hannes Reinecke 2022-06-27  40  			pr_err("DH-HMAC-CHAP hash=
 %s unsupported\n", hmac);
db1312dd95488b Hannes Reinecke 2022-06-27  41  			return -ENOTSUPP;
db1312dd95488b Hannes Reinecke 2022-06-27  42  		}
db1312dd95488b Hannes Reinecke 2022-06-27  43  	}
db1312dd95488b Hannes Reinecke 2022-06-27  44  	dhchap_secret =3D kstrdup(s=
ecret, GFP_KERNEL);
db1312dd95488b Hannes Reinecke 2022-06-27  45  	if (!dhchap_secret)
db1312dd95488b Hannes Reinecke 2022-06-27  46  		return -ENOMEM;
db1312dd95488b Hannes Reinecke 2022-06-27  47  	if (set_ctrl) {
db1312dd95488b Hannes Reinecke 2022-06-27  48  		host->dhchap_ctrl_secret =
=3D strim(dhchap_secret);
db1312dd95488b Hannes Reinecke 2022-06-27  49  		host->dhchap_ctrl_key_hash=
 =3D key_hash;
db1312dd95488b Hannes Reinecke 2022-06-27  50  	} else {
db1312dd95488b Hannes Reinecke 2022-06-27  51  		host->dhchap_secret =3D st=
rim(dhchap_secret);
db1312dd95488b Hannes Reinecke 2022-06-27  52  		host->dhchap_key_hash =3D =
key_hash;
db1312dd95488b Hannes Reinecke 2022-06-27  53  	}
db1312dd95488b Hannes Reinecke 2022-06-27  54  	return 0;
db1312dd95488b Hannes Reinecke 2022-06-27  55  }
db1312dd95488b Hannes Reinecke 2022-06-27  56  =


-- =

0-DAY CI Kernel Test Service
https://01.org/lkp
--===============0334568445279287396==--

