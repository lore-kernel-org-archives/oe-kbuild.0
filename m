Content-Type: multipart/mixed; boundary="===============8965209131967917267=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: drivers/gpio/gpio-sim.c:574:20: warning: dereference of NULL '0' [CWE-476]
Date: Wed, 15 Jun 2022 06:11:15 +0800
Message-ID: <202206150639.0W2adCRO-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============8965209131967917267==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

:::::: =

:::::: Manual check reason: "low confidence bisect report"
:::::: Manual check reason: "low confidence static check warning: drivers/g=
pio/gpio-sim.c:574:20: warning: dereference of NULL '0' [CWE-476] [-Wanalyz=
er-null-dereference]"
:::::: =


CC: kbuild-all(a)lists.01.org
BCC: lkp(a)intel.com
CC: linux-kernel(a)vger.kernel.org
TO: Bartosz Golaszewski <brgl@bgdev.pl>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git =
master
head:   018ab4fabddd94f1c96f3b59e180691b9e88d5d8
commit: cb8c474e79be458f58e9df073f51ca159f3a2aa0 gpio: sim: new testing mod=
ule
date:   6 months ago
:::::: branch date: 4 hours ago
:::::: commit date: 6 months ago
config: arm-randconfig-c002-20220611 (https://download.01.org/0day-ci/archi=
ve/20220615/202206150639.0W2adCRO-lkp(a)intel.com/config)
compiler: arm-linux-gnueabi-gcc (GCC) 11.3.0
reproduce (this is a W=3D1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/=
make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.gi=
t/commit/?id=3Dcb8c474e79be458f58e9df073f51ca159f3a2aa0
        git remote add linus https://git.kernel.org/pub/scm/linux/kernel/gi=
t/torvalds/linux.git
        git fetch --no-tags linus master
        git checkout cb8c474e79be458f58e9df073f51ca159f3a2aa0
        # save the config file
         ARCH=3Darm KBUILD_USERCFLAGS=3D'-fanalyzer -Wno-error' =


If you fix the issue, kindly add following tag where applicable
Reported-by: kernel test robot <lkp@intel.com>


gcc-analyzer warnings: (new ones prefixed by >>)
   drivers/gpio/gpio-sim.c: In function 'gpio_sim_bank_config_group_release=
':
>> drivers/gpio/gpio-sim.c:574:20: warning: dereference of NULL '0' [CWE-47=
6] [-Wanalyzer-null-dereference]
     574 |         return bank->parent;
         |                ~~~~^~~~~~~~
     'gpio_sim_bank_config_group_release': event 1
       |
       |include/linux/configfs.h:92:70:
       |   92 |         return item ? container_of(item,struct config_group=
,cg_item) : NULL;
       |
     'gpio_sim_bank_config_group_release': event 2
       |
       |cc1:
       | (2): ...to here
       |
     'gpio_sim_bank_config_group_release': event 3
       |
       |drivers/gpio/gpio-sim.c:574:20:
       |  574 |         return bank->parent;
       |      |                ~~~~^~~~~~~~
       |      |                    |
       |      |                    (3) dereference of NULL '<unknown>'
       |
   drivers/gpio/gpio-sim.c: In function 'gpio_sim_bank_config_num_lines_sho=
w':
>> drivers/gpio/gpio-sim.c:574:20: warning: dereference of NULL '0' [CWE-47=
6] [-Wanalyzer-null-dereference]
     574 |         return bank->parent;
         |                ~~~~^~~~~~~~
     'gpio_sim_bank_config_num_lines_show': event 1
       |
       |include/linux/configfs.h:92:70:
       |   92 |         return item ? container_of(item,struct config_group=
,cg_item) : NULL;
       |
     'gpio_sim_bank_config_num_lines_show': event 2
       |
       |cc1:
       | (2): ...to here
       |
     'gpio_sim_bank_config_num_lines_show': event 3
       |
       |drivers/gpio/gpio-sim.c:574:20:
       |  574 |         return bank->parent;
       |      |                ~~~~^~~~~~~~
       |      |                    |
       |      |                    (3) dereference of NULL '<unknown>'
       |
   drivers/gpio/gpio-sim.c: In function 'gpio_sim_bank_config_chip_name_sho=
w':
>> drivers/gpio/gpio-sim.c:574:20: warning: dereference of NULL '0' [CWE-47=
6] [-Wanalyzer-null-dereference]
     574 |         return bank->parent;
         |                ~~~~^~~~~~~~
     'gpio_sim_bank_config_chip_name_show': event 1
       |
       |include/linux/configfs.h:92:70:
       |   92 |         return item ? container_of(item,struct config_group=
,cg_item) : NULL;
       |
     'gpio_sim_bank_config_chip_name_show': event 2
       |
       |cc1:
       | (2): ...to here
       |
     'gpio_sim_bank_config_chip_name_show': event 3
       |
       |drivers/gpio/gpio-sim.c:574:20:
       |  574 |         return bank->parent;
       |      |                ~~~~^~~~~~~~
       |      |                    |
       |      |                    (3) dereference of NULL '<unknown>'
       |
   drivers/gpio/gpio-sim.c: In function 'gpio_sim_bank_config_label_show':
>> drivers/gpio/gpio-sim.c:574:20: warning: dereference of NULL '0' [CWE-47=
6] [-Wanalyzer-null-dereference]
     574 |         return bank->parent;
         |                ~~~~^~~~~~~~
     'gpio_sim_bank_config_label_show': event 1
       |
       |include/linux/configfs.h:92:70:
       |   92 |         return item ? container_of(item,struct config_group=
,cg_item) : NULL;
       |
     'gpio_sim_bank_config_label_show': event 2
       |
       |cc1:
       | (2): ...to here
       |
     'gpio_sim_bank_config_label_show': event 3
       |
       |drivers/gpio/gpio-sim.c:574:20:
       |  574 |         return bank->parent;
       |      |                ~~~~^~~~~~~~
       |      |                    |
       |      |                    (3) dereference of NULL '<unknown>'
       |
   drivers/gpio/gpio-sim.c: In function 'gpio_sim_bank_config_label_store':
>> drivers/gpio/gpio-sim.c:574:20: warning: dereference of NULL '0' [CWE-47=
6] [-Wanalyzer-null-dereference]
     574 |         return bank->parent;
         |                ~~~~^~~~~~~~
     'gpio_sim_bank_config_label_store': event 1
       |
       |include/linux/configfs.h:92:70:
       |   92 |         return item ? container_of(item,struct config_group=
,cg_item) : NULL;
       |
     'gpio_sim_bank_config_label_store': event 2
       |
       |cc1:
       | (2): ...to here
       |
     'gpio_sim_bank_config_label_store': event 3
       |
       |drivers/gpio/gpio-sim.c:574:20:
       |  574 |         return bank->parent;
       |      |                ~~~~^~~~~~~~
       |      |                    |
       |      |                    (3) dereference of NULL '<unknown>'
       |
   drivers/gpio/gpio-sim.c: In function 'gpio_sim_bank_config_num_lines_sto=
re':
>> drivers/gpio/gpio-sim.c:574:20: warning: dereference of NULL '0' [CWE-47=
6] [-Wanalyzer-null-dereference]
     574 |         return bank->parent;
         |                ~~~~^~~~~~~~
     'gpio_sim_bank_config_num_lines_store': event 1
       |
       |include/linux/configfs.h:92:70:
       |   92 |         return item ? container_of(item,struct config_group=
,cg_item) : NULL;
       |
     'gpio_sim_bank_config_num_lines_store': event 2
       |
       |cc1:
       | (2): ...to here
       |
     'gpio_sim_bank_config_num_lines_store': event 3
       |
       |drivers/gpio/gpio-sim.c:574:20:
       |  574 |         return bank->parent;
       |      |                ~~~~^~~~~~~~
       |      |                    |
       |      |                    (3) dereference of NULL '<unknown>'
       |
   drivers/gpio/gpio-sim.c: In function 'gpio_sim_line_config_name_show':
   drivers/gpio/gpio-sim.c:602:31: warning: dereference of NULL '0' [CWE-47=
6] [-Wanalyzer-null-dereference]
     602 |         struct gpio_sim_bank *bank =3D line->parent;
         |                               ^~~~
     'gpio_sim_line_config_name_show': event 1
       |
       |include/linux/configfs.h:92:70:
       |   92 |         return item ? container_of(item,struct config_group=
,cg_item) : NULL;
       |
     'gpio_sim_line_config_name_show': event 2
       |
       |cc1:
       | (2): ...to here
       |
     'gpio_sim_line_config_name_show': event 3
       |
       |drivers/gpio/gpio-sim.c:602:31:
       |  602 |         struct gpio_sim_bank *bank =3D line->parent;
       |      |                               ^~~~
       |      |                               |
       |      |                               (3) dereference of NULL '<unk=
nown>'
       |
   drivers/gpio/gpio-sim.c: In function 'gpio_sim_line_config_group_release=
':
   drivers/gpio/gpio-sim.c:602:31: warning: dereference of NULL '0' [CWE-47=
6] [-Wanalyzer-null-dereference]
     602 |         struct gpio_sim_bank *bank =3D line->parent;
         |                               ^~~~
     'gpio_sim_line_config_group_release': event 1
       |
       |include/linux/configfs.h:92:70:
       |   92 |         return item ? container_of(item,struct config_group=
,cg_item) : NULL;
       |
     'gpio_sim_line_config_group_release': event 2
       |
       |cc1:
       | (2): ...to here
       |
     'gpio_sim_line_config_group_release': event 3
       |
       |drivers/gpio/gpio-sim.c:602:31:
       |  602 |         struct gpio_sim_bank *bank =3D line->parent;
       |      |                               ^~~~
       |      |                               |
       |      |                               (3) dereference of NULL '<unk=
nown>'
       |
   drivers/gpio/gpio-sim.c: In function 'gpio_sim_line_config_name_store':
   drivers/gpio/gpio-sim.c:602:31: warning: dereference of NULL '0' [CWE-47=
6] [-Wanalyzer-null-dereference]
     602 |         struct gpio_sim_bank *bank =3D line->parent;
         |                               ^~~~
     'gpio_sim_line_config_name_store': event 1
       |
       |include/linux/configfs.h:92:70:
       |   92 |         return item ? container_of(item,struct config_group=
,cg_item) : NULL;
       |
     'gpio_sim_line_config_name_store': event 2
       |
       |cc1:
       | (2): ...to here
       |
     'gpio_sim_line_config_name_store': event 3
       |
       |drivers/gpio/gpio-sim.c:602:31:
       |  602 |         struct gpio_sim_bank *bank =3D line->parent;
       |      |                               ^~~~
       |      |                               |
       |      |                               (3) dereference of NULL '<unk=
nown>'
       |
   drivers/gpio/gpio-sim.c: In function 'gpio_sim_device_config_group_relea=
se':
   drivers/gpio/gpio-sim.c:629:21: warning: dereference of NULL '0' [CWE-47=
6] [-Wanalyzer-null-dereference]
     629 |         return !!dev->pdev;
         |                  ~~~^~~~~~
     'gpio_sim_device_config_group_release': event 1
       |
       |include/linux/configfs.h:92:70:
       |   92 |         return item ? container_of(item,struct config_group=
,cg_item) : NULL;
       |
     'gpio_sim_device_config_group_release': event 2
       |
       |cc1:
       | (2): ...to here
       |
--
       |      |                     (3) dereference of NULL '<unknown>'
       |
   drivers/gpio/gpio-sim.c: In function 'gpio_sim_device_config_live_store':
   drivers/gpio/gpio-sim.c:629:21: warning: dereference of NULL '0' [CWE-47=
6] [-Wanalyzer-null-dereference]
     629 |         return !!dev->pdev;
         |                  ~~~^~~~~~
     'gpio_sim_device_config_live_store': event 1
       |
       |include/linux/configfs.h:92:70:
       |   92 |         return item ? container_of(item,struct config_group=
,cg_item) : NULL;
       |
     'gpio_sim_device_config_live_store': event 2
       |
       |cc1:
       | (2): ...to here
       |
     'gpio_sim_device_config_live_store': events 3-7
       |
       |drivers/gpio/gpio-sim.c:953:12:
       |  629 |         return !!dev->pdev;
       |      |                  ~~~~~~~~~
       |      |                     |
       |      |                     (6) ...to here
       |      |                     (7) dereference of NULL '<unknown>'
       |......
       |  953 |         if (ret)
       |      |            ^
       |      |            |
       |      |            (3) following 'false' branch (when 'ret =3D=3D 0=
')...
       |......
       |  956 |         mutex_lock(&dev->lock);
       |      |         ~~~~~~~~~~~~~~~~~~~~~~
       |      |         |
       |      |         (4) ...to here
       |  957 | =

       |  958 |         if ((!live && !gpio_sim_device_is_live_unlocked(dev=
)) ||
       |      |            ~
       |      |            |
       |      |            (5) following 'false' branch...
       |
   drivers/gpio/gpio-sim.c:629:21: warning: dereference of NULL '0' [CWE-47=
6] [-Wanalyzer-null-dereference]
     629 |         return !!dev->pdev;
         |                  ~~~^~~~~~
     'gpio_sim_device_config_live_store': event 1
       |
       |include/linux/configfs.h:92:70:
       |   92 |         return item ? container_of(item,struct config_group=
,cg_item) : NULL;
       |
     'gpio_sim_device_config_live_store': event 2
       |
       |cc1:
       | (2): ...to here
       |
     'gpio_sim_device_config_live_store': events 3-7
       |
       |drivers/gpio/gpio-sim.c:953:12:
       |  629 |         return !!dev->pdev;
       |      |                  ~~~~~~~~~
       |      |                     |
       |      |                     (6) ...to here
       |      |                     (7) dereference of NULL '<unknown>'
       |......
       |  953 |         if (ret)
       |      |            ^
       |      |            |
       |      |            (3) following 'false' branch (when 'ret =3D=3D 0=
')...
       |......
       |  956 |         mutex_lock(&dev->lock);
       |      |         ~~~~~~~~~~~~~~~~~~~~~~
       |      |         |
       |      |         (4) ...to here
       |  957 | =

       |  958 |         if ((!live && !gpio_sim_device_is_live_unlocked(dev=
)) ||
       |      |            ~
       |      |            |
       |      |            (5) following 'true' branch...
       |
   drivers/gpio/gpio-sim.c: In function 'gpio_sim_device_config_dev_name_sh=
ow':
   drivers/gpio/gpio-sim.c:654:14: warning: dereference of NULL '0' [CWE-47=
6] [-Wanalyzer-null-dereference]
     654 |         pdev =3D dev->pdev;
         |         ~~~~~^~~~~~~~~~~
     'gpio_sim_device_config_dev_name_show': event 1
       |
       |include/linux/configfs.h:92:70:
       |   92 |         return item ? container_of(item,struct config_group=
,cg_item) : NULL;
       |
     'gpio_sim_device_config_dev_name_show': event 2
       |
       |cc1:
       | (2): ...to here
       |
     'gpio_sim_device_config_dev_name_show': event 3
       |
       |drivers/gpio/gpio-sim.c:654:14:
       |  654 |         pdev =3D dev->pdev;
       |      |         ~~~~~^~~~~~~~~~~
       |      |              |
       |      |              (3) dereference of NULL '<unknown>'
       |
   drivers/gpio/gpio-sim.c: In function 'gpio_sim_remove_hogs':
>> drivers/gpio/gpio-sim.c:723:17: warning: dereference of NULL 'dev' [CWE-=
476] [-Wanalyzer-null-dereference]
     723 |         if (!dev->hogs)
         |              ~~~^~~~~~
     'gpio_sim_device_config_group_release': event 1
       |
       | 1479 | static void gpio_sim_device_config_group_release(struct con=
fig_item *item)
       |      |             ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
       |      |             |
       |      |             (1) entry to 'gpio_sim_device_config_group_rele=
ase'
       |
     'gpio_sim_device_config_group_release': event 2
       |
       |include/linux/configfs.h:92:70:
       |   92 |         return item ? container_of(item,struct config_group=
,cg_item) : NULL;
       |
     'gpio_sim_device_config_group_release': event 3
       |
       |cc1:
       | (3): ...to here
       |
     'gpio_sim_device_config_group_release': events 4-6
       |
       |drivers/gpio/gpio-sim.c:1484:12:
       | 1484 |         if (gpio_sim_device_is_live_unlocked(dev))
       |      |            ^
       |      |            |
       |      |            (4) following 'true' branch...
       | 1485 |                 gpio_sim_device_deactivate_unlocked(dev);
       |      |                 ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
       |      |                 |
       |      |                 (5) ...to here
       |      |                 (6) calling 'gpio_sim_device_deactivate_unl=
ocked' from 'gpio_sim_device_config_group_release'
       |
       +--> 'gpio_sim_device_deactivate_unlocked': events 7-8
              |
              |  933 | static void gpio_sim_device_deactivate_unlocked(stru=
ct gpio_sim_device *dev)
              |      |             ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
              |      |             |
              |      |             (7) entry to 'gpio_sim_device_deactivate=
_unlocked'
              |......
              |  941 |         gpio_sim_remove_hogs(dev);
              |      |         ~~~~~~~~~~~~~~~~~~~~~~~~~
              |      |         |
              |      |         (8) calling 'gpio_sim_remove_hogs' from 'gpi=
o_sim_device_deactivate_unlocked'
              |
              +--> 'gpio_sim_remove_hogs': events 9-10
                     |
                     |  719 | static void gpio_sim_remove_hogs(struct gpio_=
sim_device *dev)
                     |      |             ^~~~~~~~~~~~~~~~~~~~
                     |      |             |
                     |      |             (9) entry to 'gpio_sim_remove_hog=
s'
                     |......
                     |  723 |         if (!dev->hogs)
                     |      |              ~~~~~~~~~
                     |      |                 |
                     |      |                 (10) dereference of NULL 'dev'
                     |
   drivers/gpio/gpio-sim.c: In function 'gpio_sim_device_config_group_relea=
se':
   drivers/gpio/gpio-sim.c:1489:36: warning: dereference of NULL '0' [CWE-4=
76] [-Wanalyzer-null-dereference]
    1489 |         ida_free(&gpio_sim_ida, dev->id);
         |                                 ~~~^~~~
     'gpio_sim_device_config_group_release': event 1
       |
       | 1479 | static void gpio_sim_device_config_group_release(struct con=
fig_item *item)
       |      |             ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
       |      |             |
       |      |             (1) entry to 'gpio_sim_device_config_group_rele=
ase'
       |
     'gpio_sim_device_config_group_release': event 2
       |
       |include/linux/configfs.h:92:70:
       |   92 |         return item ? container_of(item,struct config_group=
,cg_item) : NULL;
       |
     'gpio_sim_device_config_group_release': event 3
       |
       |cc1:
       | (3): ...to here
       |
     'gpio_sim_device_config_group_release': events 4-6
       |
       |drivers/gpio/gpio-sim.c:1484:12:
       | 1484 |         if (gpio_sim_device_is_live_unlocked(dev))
       |      |            ^
       |      |            |
       |      |            (4) following 'true' branch...
       | 1485 |                 gpio_sim_device_deactivate_unlocked(dev);
       |      |                 ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
       |      |                 |
       |      |                 (5) ...to here
       |      |                 (6) calling 'gpio_sim_device_deactivate_unl=
ocked' from 'gpio_sim_device_config_group_release'
       |
       +--> 'gpio_sim_device_deactivate_unlocked': events 7-8
              |
              |  933 | static void gpio_sim_device_deactivate_unlocked(stru=
ct gpio_sim_device *dev)
              |      |             ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
              |      |             |
              |      |             (7) entry to 'gpio_sim_device_deactivate=
_unlocked'
              |......
              |  941 |         gpio_sim_remove_hogs(dev);
              |      |         ~~~~~~~~~~~~~~~~~~~~~~~~~
              |      |         |

vim +/0 +574 drivers/gpio/gpio-sim.c

cb8c474e79be45 Bartosz Golaszewski 2021-12-07  570  =

cb8c474e79be45 Bartosz Golaszewski 2021-12-07  571  static struct gpio_sim_=
device *
cb8c474e79be45 Bartosz Golaszewski 2021-12-07  572  gpio_sim_bank_get_devic=
e(struct gpio_sim_bank *bank)
cb8c474e79be45 Bartosz Golaszewski 2021-12-07  573  {
cb8c474e79be45 Bartosz Golaszewski 2021-12-07 @574  	return bank->parent;
cb8c474e79be45 Bartosz Golaszewski 2021-12-07  575  }
cb8c474e79be45 Bartosz Golaszewski 2021-12-07  576  =

cb8c474e79be45 Bartosz Golaszewski 2021-12-07  577  struct gpio_sim_hog;
cb8c474e79be45 Bartosz Golaszewski 2021-12-07  578  =

cb8c474e79be45 Bartosz Golaszewski 2021-12-07  579  struct gpio_sim_line {
cb8c474e79be45 Bartosz Golaszewski 2021-12-07  580  	struct config_group gr=
oup;
cb8c474e79be45 Bartosz Golaszewski 2021-12-07  581  =

cb8c474e79be45 Bartosz Golaszewski 2021-12-07  582  	struct gpio_sim_bank *=
parent;
cb8c474e79be45 Bartosz Golaszewski 2021-12-07  583  	struct list_head sibli=
ngs;
cb8c474e79be45 Bartosz Golaszewski 2021-12-07  584  =

cb8c474e79be45 Bartosz Golaszewski 2021-12-07  585  	unsigned int offset;
cb8c474e79be45 Bartosz Golaszewski 2021-12-07  586  	char *name;
cb8c474e79be45 Bartosz Golaszewski 2021-12-07  587  =

cb8c474e79be45 Bartosz Golaszewski 2021-12-07  588  	/* There can only be o=
ne hog per line. */
cb8c474e79be45 Bartosz Golaszewski 2021-12-07  589  	struct gpio_sim_hog *h=
og;
cb8c474e79be45 Bartosz Golaszewski 2021-12-07  590  };
cb8c474e79be45 Bartosz Golaszewski 2021-12-07  591  =

cb8c474e79be45 Bartosz Golaszewski 2021-12-07  592  static struct gpio_sim_=
line *to_gpio_sim_line(struct config_item *item)
cb8c474e79be45 Bartosz Golaszewski 2021-12-07  593  {
cb8c474e79be45 Bartosz Golaszewski 2021-12-07  594  	struct config_group *g=
roup =3D to_config_group(item);
cb8c474e79be45 Bartosz Golaszewski 2021-12-07  595  =

cb8c474e79be45 Bartosz Golaszewski 2021-12-07  596  	return container_of(gr=
oup, struct gpio_sim_line, group);
cb8c474e79be45 Bartosz Golaszewski 2021-12-07  597  }
cb8c474e79be45 Bartosz Golaszewski 2021-12-07  598  =

cb8c474e79be45 Bartosz Golaszewski 2021-12-07  599  static struct gpio_sim_=
device *
cb8c474e79be45 Bartosz Golaszewski 2021-12-07  600  gpio_sim_line_get_devic=
e(struct gpio_sim_line *line)
cb8c474e79be45 Bartosz Golaszewski 2021-12-07  601  {
cb8c474e79be45 Bartosz Golaszewski 2021-12-07  602  	struct gpio_sim_bank *=
bank =3D line->parent;
cb8c474e79be45 Bartosz Golaszewski 2021-12-07  603  =

cb8c474e79be45 Bartosz Golaszewski 2021-12-07  604  	return gpio_sim_bank_g=
et_device(bank);
cb8c474e79be45 Bartosz Golaszewski 2021-12-07  605  }
cb8c474e79be45 Bartosz Golaszewski 2021-12-07  606  =

cb8c474e79be45 Bartosz Golaszewski 2021-12-07  607  struct gpio_sim_hog {
cb8c474e79be45 Bartosz Golaszewski 2021-12-07  608  	struct config_item ite=
m;
cb8c474e79be45 Bartosz Golaszewski 2021-12-07  609  	struct gpio_sim_line *=
parent;
cb8c474e79be45 Bartosz Golaszewski 2021-12-07  610  =

cb8c474e79be45 Bartosz Golaszewski 2021-12-07  611  	char *name;
cb8c474e79be45 Bartosz Golaszewski 2021-12-07  612  	int dir;
cb8c474e79be45 Bartosz Golaszewski 2021-12-07  613  };
cb8c474e79be45 Bartosz Golaszewski 2021-12-07  614  =

cb8c474e79be45 Bartosz Golaszewski 2021-12-07  615  static struct gpio_sim_=
hog *to_gpio_sim_hog(struct config_item *item)
cb8c474e79be45 Bartosz Golaszewski 2021-12-07  616  {
cb8c474e79be45 Bartosz Golaszewski 2021-12-07  617  	return container_of(it=
em, struct gpio_sim_hog, item);
cb8c474e79be45 Bartosz Golaszewski 2021-12-07  618  }
cb8c474e79be45 Bartosz Golaszewski 2021-12-07  619  =

cb8c474e79be45 Bartosz Golaszewski 2021-12-07  620  static struct gpio_sim_=
device *gpio_sim_hog_get_device(struct gpio_sim_hog *hog)
cb8c474e79be45 Bartosz Golaszewski 2021-12-07  621  {
cb8c474e79be45 Bartosz Golaszewski 2021-12-07  622  	struct gpio_sim_line *=
line =3D hog->parent;
cb8c474e79be45 Bartosz Golaszewski 2021-12-07  623  =

cb8c474e79be45 Bartosz Golaszewski 2021-12-07  624  	return gpio_sim_line_g=
et_device(line);
cb8c474e79be45 Bartosz Golaszewski 2021-12-07  625  }
cb8c474e79be45 Bartosz Golaszewski 2021-12-07  626  =

cb8c474e79be45 Bartosz Golaszewski 2021-12-07  627  static bool gpio_sim_de=
vice_is_live_unlocked(struct gpio_sim_device *dev)
cb8c474e79be45 Bartosz Golaszewski 2021-12-07  628  {
cb8c474e79be45 Bartosz Golaszewski 2021-12-07  629  	return !!dev->pdev;
cb8c474e79be45 Bartosz Golaszewski 2021-12-07  630  }
cb8c474e79be45 Bartosz Golaszewski 2021-12-07  631  =

cb8c474e79be45 Bartosz Golaszewski 2021-12-07  632  static char *gpio_sim_s=
trdup_trimmed(const char *str, size_t count)
cb8c474e79be45 Bartosz Golaszewski 2021-12-07  633  {
cb8c474e79be45 Bartosz Golaszewski 2021-12-07  634  	char *dup, *trimmed;
cb8c474e79be45 Bartosz Golaszewski 2021-12-07  635  =

cb8c474e79be45 Bartosz Golaszewski 2021-12-07  636  	dup =3D kstrndup(str, =
count, GFP_KERNEL);
cb8c474e79be45 Bartosz Golaszewski 2021-12-07  637  	if (!dup)
cb8c474e79be45 Bartosz Golaszewski 2021-12-07  638  		return NULL;
cb8c474e79be45 Bartosz Golaszewski 2021-12-07  639  =

cb8c474e79be45 Bartosz Golaszewski 2021-12-07  640  	trimmed =3D strstrip(d=
up);
cb8c474e79be45 Bartosz Golaszewski 2021-12-07  641  	memmove(dup, trimmed, =
strlen(trimmed) + 1);
cb8c474e79be45 Bartosz Golaszewski 2021-12-07  642  =

cb8c474e79be45 Bartosz Golaszewski 2021-12-07  643  	return dup;
cb8c474e79be45 Bartosz Golaszewski 2021-12-07  644  }
cb8c474e79be45 Bartosz Golaszewski 2021-12-07  645  =

cb8c474e79be45 Bartosz Golaszewski 2021-12-07  646  static ssize_t gpio_sim=
_device_config_dev_name_show(struct config_item *item,
cb8c474e79be45 Bartosz Golaszewski 2021-12-07  647  						    char *page)
cb8c474e79be45 Bartosz Golaszewski 2021-12-07  648  {
cb8c474e79be45 Bartosz Golaszewski 2021-12-07  649  	struct gpio_sim_device=
 *dev =3D to_gpio_sim_device(item);
cb8c474e79be45 Bartosz Golaszewski 2021-12-07  650  	struct platform_device=
 *pdev;
cb8c474e79be45 Bartosz Golaszewski 2021-12-07  651  	int ret;
cb8c474e79be45 Bartosz Golaszewski 2021-12-07  652  =

cb8c474e79be45 Bartosz Golaszewski 2021-12-07  653  	mutex_lock(&dev->lock);
cb8c474e79be45 Bartosz Golaszewski 2021-12-07 @654  	pdev =3D dev->pdev;
cb8c474e79be45 Bartosz Golaszewski 2021-12-07  655  	if (pdev)
cb8c474e79be45 Bartosz Golaszewski 2021-12-07  656  		ret =3D sprintf(page,=
 "%s\n", dev_name(&pdev->dev));
cb8c474e79be45 Bartosz Golaszewski 2021-12-07  657  	else
cb8c474e79be45 Bartosz Golaszewski 2021-12-07  658  		ret =3D sprintf(page,=
 "gpio-sim.%d\n", dev->id);
cb8c474e79be45 Bartosz Golaszewski 2021-12-07  659  	mutex_unlock(&dev->loc=
k);
cb8c474e79be45 Bartosz Golaszewski 2021-12-07  660  =

cb8c474e79be45 Bartosz Golaszewski 2021-12-07  661  	return ret;
cb8c474e79be45 Bartosz Golaszewski 2021-12-07  662  }
cb8c474e79be45 Bartosz Golaszewski 2021-12-07  663  =

cb8c474e79be45 Bartosz Golaszewski 2021-12-07  664  CONFIGFS_ATTR_RO(gpio_s=
im_device_config_, dev_name);
cb8c474e79be45 Bartosz Golaszewski 2021-12-07  665  =

cb8c474e79be45 Bartosz Golaszewski 2021-12-07  666  static ssize_t
cb8c474e79be45 Bartosz Golaszewski 2021-12-07  667  gpio_sim_device_config_=
live_show(struct config_item *item, char *page)
cb8c474e79be45 Bartosz Golaszewski 2021-12-07  668  {
cb8c474e79be45 Bartosz Golaszewski 2021-12-07  669  	struct gpio_sim_device=
 *dev =3D to_gpio_sim_device(item);
cb8c474e79be45 Bartosz Golaszewski 2021-12-07  670  	bool live;
cb8c474e79be45 Bartosz Golaszewski 2021-12-07  671  =

cb8c474e79be45 Bartosz Golaszewski 2021-12-07  672  	mutex_lock(&dev->lock);
cb8c474e79be45 Bartosz Golaszewski 2021-12-07  673  	live =3D gpio_sim_devi=
ce_is_live_unlocked(dev);
cb8c474e79be45 Bartosz Golaszewski 2021-12-07  674  	mutex_unlock(&dev->loc=
k);
cb8c474e79be45 Bartosz Golaszewski 2021-12-07  675  =

cb8c474e79be45 Bartosz Golaszewski 2021-12-07  676  	return sprintf(page, "=
%c\n", live ? '1' : '0');
cb8c474e79be45 Bartosz Golaszewski 2021-12-07  677  }
cb8c474e79be45 Bartosz Golaszewski 2021-12-07  678  =

cb8c474e79be45 Bartosz Golaszewski 2021-12-07  679  static char **gpio_sim_=
make_line_names(struct gpio_sim_bank *bank,
cb8c474e79be45 Bartosz Golaszewski 2021-12-07  680  				       unsigned int=
 *line_names_size)
cb8c474e79be45 Bartosz Golaszewski 2021-12-07  681  {
cb8c474e79be45 Bartosz Golaszewski 2021-12-07  682  	unsigned int max_offse=
t =3D 0;
cb8c474e79be45 Bartosz Golaszewski 2021-12-07  683  	bool has_line_names =
=3D false;
cb8c474e79be45 Bartosz Golaszewski 2021-12-07  684  	struct gpio_sim_line *=
line;
cb8c474e79be45 Bartosz Golaszewski 2021-12-07  685  	char **line_names;
cb8c474e79be45 Bartosz Golaszewski 2021-12-07  686  =

cb8c474e79be45 Bartosz Golaszewski 2021-12-07  687  	list_for_each_entry(li=
ne, &bank->line_list, siblings) {
cb8c474e79be45 Bartosz Golaszewski 2021-12-07  688  		if (line->name) {
cb8c474e79be45 Bartosz Golaszewski 2021-12-07  689  			if (line->offset > m=
ax_offset)
cb8c474e79be45 Bartosz Golaszewski 2021-12-07  690  				max_offset =3D line=
->offset;
cb8c474e79be45 Bartosz Golaszewski 2021-12-07  691  =

cb8c474e79be45 Bartosz Golaszewski 2021-12-07  692  			/*
cb8c474e79be45 Bartosz Golaszewski 2021-12-07  693  			 * max_offset can st=
ay at 0 so it's not an indicator
cb8c474e79be45 Bartosz Golaszewski 2021-12-07  694  			 * of whether line n=
ames were configured at all.
cb8c474e79be45 Bartosz Golaszewski 2021-12-07  695  			 */
cb8c474e79be45 Bartosz Golaszewski 2021-12-07  696  			has_line_names =3D t=
rue;
cb8c474e79be45 Bartosz Golaszewski 2021-12-07  697  		}
cb8c474e79be45 Bartosz Golaszewski 2021-12-07  698  	}
cb8c474e79be45 Bartosz Golaszewski 2021-12-07  699  =

cb8c474e79be45 Bartosz Golaszewski 2021-12-07  700  	if (!has_line_names)
cb8c474e79be45 Bartosz Golaszewski 2021-12-07  701  		/*
cb8c474e79be45 Bartosz Golaszewski 2021-12-07  702  		 * This is not an err=
or - NULL means, there are no line
cb8c474e79be45 Bartosz Golaszewski 2021-12-07  703  		 * names configured.
cb8c474e79be45 Bartosz Golaszewski 2021-12-07  704  		 */
cb8c474e79be45 Bartosz Golaszewski 2021-12-07  705  		return NULL;
cb8c474e79be45 Bartosz Golaszewski 2021-12-07  706  =

cb8c474e79be45 Bartosz Golaszewski 2021-12-07  707  	*line_names_size =3D m=
ax_offset + 1;
cb8c474e79be45 Bartosz Golaszewski 2021-12-07  708  =

cb8c474e79be45 Bartosz Golaszewski 2021-12-07  709  	line_names =3D kcalloc=
(*line_names_size, sizeof(*line_names), GFP_KERNEL);
cb8c474e79be45 Bartosz Golaszewski 2021-12-07  710  	if (!line_names)
cb8c474e79be45 Bartosz Golaszewski 2021-12-07  711  		return ERR_PTR(-ENOME=
M);
cb8c474e79be45 Bartosz Golaszewski 2021-12-07  712  =

cb8c474e79be45 Bartosz Golaszewski 2021-12-07  713  	list_for_each_entry(li=
ne, &bank->line_list, siblings)
cb8c474e79be45 Bartosz Golaszewski 2021-12-07  714  		line_names[line->offs=
et] =3D line->name;
cb8c474e79be45 Bartosz Golaszewski 2021-12-07  715  =

cb8c474e79be45 Bartosz Golaszewski 2021-12-07  716  	return line_names;
cb8c474e79be45 Bartosz Golaszewski 2021-12-07  717  }
cb8c474e79be45 Bartosz Golaszewski 2021-12-07  718  =

cb8c474e79be45 Bartosz Golaszewski 2021-12-07  719  static void gpio_sim_re=
move_hogs(struct gpio_sim_device *dev)
cb8c474e79be45 Bartosz Golaszewski 2021-12-07  720  {
cb8c474e79be45 Bartosz Golaszewski 2021-12-07  721  	struct gpiod_hog *hog;
cb8c474e79be45 Bartosz Golaszewski 2021-12-07  722  =

cb8c474e79be45 Bartosz Golaszewski 2021-12-07 @723  	if (!dev->hogs)
cb8c474e79be45 Bartosz Golaszewski 2021-12-07  724  		return;
cb8c474e79be45 Bartosz Golaszewski 2021-12-07  725  =

cb8c474e79be45 Bartosz Golaszewski 2021-12-07  726  	gpiod_remove_hogs(dev-=
>hogs);
cb8c474e79be45 Bartosz Golaszewski 2021-12-07  727  =

cb8c474e79be45 Bartosz Golaszewski 2021-12-07  728  	for (hog =3D dev->hogs=
; !hog->chip_label; hog++) {
cb8c474e79be45 Bartosz Golaszewski 2021-12-07  729  		kfree(hog->chip_label=
);
cb8c474e79be45 Bartosz Golaszewski 2021-12-07  730  		kfree(hog->line_name);
cb8c474e79be45 Bartosz Golaszewski 2021-12-07  731  	}
cb8c474e79be45 Bartosz Golaszewski 2021-12-07  732  =

cb8c474e79be45 Bartosz Golaszewski 2021-12-07  733  	kfree(dev->hogs);
cb8c474e79be45 Bartosz Golaszewski 2021-12-07  734  	dev->hogs =3D NULL;
cb8c474e79be45 Bartosz Golaszewski 2021-12-07  735  }
cb8c474e79be45 Bartosz Golaszewski 2021-12-07  736  =


-- =

0-DAY CI Kernel Test Service
https://01.org/lkp
--===============8965209131967917267==--

