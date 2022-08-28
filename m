Content-Type: multipart/mixed; boundary="===============0097225126710966214=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: [martyn:pcal6534-upstreaming 6/6] drivers/gpio/gpio-pca953x.c:451:35: warning: use of uninitialized value 'pinctrl' [CWE-457]
Date: Sun, 28 Aug 2022 20:52:41 +0800
Message-ID: <202208282029.ckscIO8z-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============0097225126710966214==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

:::::: =

:::::: Manual check reason: "low confidence bisect report"
:::::: Manual check reason: "low confidence static check warning: drivers/g=
pio/gpio-pca953x.c:451:35: warning: use of uninitialized value 'pinctrl' [C=
WE-457] [-Wanalyzer-use-of-uninitialized-value]"
:::::: =


BCC: lkp(a)intel.com
CC: kbuild-all(a)lists.01.org
CC: linux-kernel(a)vger.kernel.org
TO: Martyn Welch <martyn.welch@collabora.com>

tree:   https://gitlab.collabora.com/martyn/linux pcal6534-upstreaming
head:   91a124a66bb4c2e3ff10a6e2e43123435eebd0c9
commit: 91a124a66bb4c2e3ff10a6e2e43123435eebd0c9 [6/6] gpio: pca953x: Add s=
upport for PCAL6534 and compatible
:::::: branch date: 2 days ago
:::::: commit date: 2 days ago
config: arm-randconfig-c002-20220828 (https://download.01.org/0day-ci/archi=
ve/20220828/202208282029.ckscIO8z-lkp(a)intel.com/config)
compiler: arm-linux-gnueabi-gcc (GCC) 12.1.0
reproduce (this is a W=3D1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/=
make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        git remote add martyn https://gitlab.collabora.com/martyn/linux
        git fetch --no-tags martyn pcal6534-upstreaming
        git checkout 91a124a66bb4c2e3ff10a6e2e43123435eebd0c9
        # save the config file
        COMPILER_INSTALL_PATH=3D$HOME/0day COMPILER=3Dgcc-12.1.0 make.cross=
 ARCH=3Darm KBUILD_USERCFLAGS=3D'-fanalyzer -Wno-error' =


If you fix the issue, kindly add following tag where applicable
Reported-by: kernel test robot <lkp@intel.com>

gcc-analyzer warnings: (new ones prefixed by >>)
              |      |            ~
              |      |            |
              |      |            (5) following 'false' branch (when 'ret >=
=3D 0')...
              |
            'pca953x_read_regs': event 6
              |
              |cc1:
              | (6): ...to here
              |
            'pca953x_read_regs': events 7-9
              |
              |  492 |         for (i =3D 0; i < NBANK(chip); i++)
              |  493 |                 bitmap_set_value8(val, value[i], i *=
 BANK_SZ);
              |      |                 ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~=
~~~~~~~~~
              |      |                 |
              |      |                 (8) ...to here
              |      |                 (9) calling 'bitmap_set_value8' from=
 'pca953x_read_regs'
              |
              +--> 'bitmap_set_value8': events 10-11
                     |
                     |include/linux/bitmap.h:583:20:
                     |  583 | static inline void bitmap_set_value8(unsigned=
 long *map, unsigned long value,
                     |      |                    ^~~~~~~~~~~~~~~~~
                     |      |                    |
                     |      |                    (10) entry to 'bitmap_set_=
value8'
                     |......
                     |  589 |         map[index] &=3D ~(0xFFUL << offset);
                     |      |         ~~~~~~~~~~  =

                     |      |            |
                     |      |            (11) use of uninitialized value '*=
map_12(D) + _1' here
                     |
   include/linux/bitmap.h:589:12: warning: use of uninitialized value '*map=
_12(D) + _1' [CWE-457] [-Wanalyzer-use-of-uninitialized-value]
     589 |         map[index] &=3D ~(0xFFUL << offset);
         |         ~~~^~~~~~~
     'pca953x_gpio_set_multiple': event 1
       |
       |drivers/gpio/gpio-pca953x.c:598:13:
       |  598 | static void pca953x_gpio_set_multiple(struct gpio_chip *gc,
       |      |             ^~~~~~~~~~~~~~~~~~~~~~~~~
       |      |             |
       |      |             (1) entry to 'pca953x_gpio_set_multiple'
       |
     'pca953x_gpio_set_multiple': event 2
       |
       |  602 |         DECLARE_BITMAP(reg_val, MAX_LINE);
       |      |                        ^~~~~~~
       |      |                        |
       |      |                        (2) region created on stack here
   include/linux/types.h:11:23: note: in definition of macro 'DECLARE_BITMA=
P'
       |   11 |         unsigned long name[BITS_TO_LONGS(bits)]
       |      |                       ^~~~
       |
     'pca953x_gpio_set_multiple': event 3
       |
       |drivers/gpio/gpio-pca953x.c:606:15:
       |  606 |         ret =3D pca953x_read_regs(chip, chip->regs->output,=
 reg_val);
       |      |               ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~=
~~~~~~~
       |      |               |
       |      |               (3) calling 'pca953x_read_regs' from 'pca953x=
_gpio_set_multiple'
       |
       +--> 'pca953x_read_regs': events 4-5
              |
              |  480 | static int pca953x_read_regs(struct pca953x_chip *ch=
ip, int reg, unsigned long *val)
              |      |            ^~~~~~~~~~~~~~~~~
              |      |            |
              |      |            (4) entry to 'pca953x_read_regs'
              |......
              |  487 |         if (ret < 0) {
              |      |            ~
              |      |            |
              |      |            (5) following 'false' branch (when 'ret >=
=3D 0')...
              |
            'pca953x_read_regs': event 6
              |
              |cc1:
              | (6): ...to here
              |
            'pca953x_read_regs': events 7-9
              |
              |  492 |         for (i =3D 0; i < NBANK(chip); i++)
              |  493 |                 bitmap_set_value8(val, value[i], i *=
 BANK_SZ);
              |      |                 ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~=
~~~~~~~~~
              |      |                 |
              |      |                 (8) ...to here
              |      |                 (9) calling 'bitmap_set_value8' from=
 'pca953x_read_regs'
              |
              +--> 'bitmap_set_value8': events 10-11
                     |
                     |include/linux/bitmap.h:583:20:
                     |  583 | static inline void bitmap_set_value8(unsigned=
 long *map, unsigned long value,
                     |      |                    ^~~~~~~~~~~~~~~~~
                     |      |                    |
                     |      |                    (10) entry to 'bitmap_set_=
value8'
                     |......
                     |  589 |         map[index] &=3D ~(0xFFUL << offset);
                     |      |         ~~~~~~~~~~  =

                     |      |            |
                     |      |            (11) use of uninitialized value '*=
map_12(D) + _1' here
                     |
   drivers/gpio/gpio-pca953x.c: In function 'pca953x_recalc_addr':
>> drivers/gpio/gpio-pca953x.c:451:35: warning: use of uninitialized value =
'pinctrl' [CWE-457] [-Wanalyzer-use-of-uninitialized-value]
     451 |                 regaddr =3D pinctrl + addr + (off / BANK_SZ);
         |                           ~~~~~~~~^~~~~~
     'pca953x_recalc_addr': events 1-6
       |
       |  424 |         int pinctrl;
       |      |             ^~~~~~~
       |      |             |
       |      |             (1) region created on stack here
       |......
       |  427 |         if (PCA_CHIP_TYPE(chip->driver_data) =3D=3D PCAL653=
X_TYPE) {
       |      |            ~ =

       |      |            |
       |      |            (2) following 'true' branch...
       |......
       |  431 |                 addr =3D (reg & PCAL_GPIO_MASK) * NBANK(chi=
p);
       |      |                 ~~~~
       |      |                 |
       |      |                 (3) ...to here
       |  432 | =

       |  433 |                 switch(reg) {
       |      |                 ~~~~~~
       |      |                 |
       |      |                 (4) following 'default:' branch...
       |......
       |  451 |                 regaddr =3D pinctrl + addr + (off / BANK_SZ=
);
       |      |                 ~~~~~~~   ~~~~~~~~~~~~~~
       |      |                 |                 |
       |      |                 (5) ...to here    (6) use of uninitialized =
value 'pinctrl' here
       |
>> drivers/gpio/gpio-pca953x.c:451:35: warning: use of uninitialized value =
'pinctrl' [CWE-457] [-Wanalyzer-use-of-uninitialized-value]
     451 |                 regaddr =3D pinctrl + addr + (off / BANK_SZ);
         |                           ~~~~~~~~^~~~~~
     'pca953x_gpio_set_value': events 1-2
       |
       |  550 | static void pca953x_gpio_set_value(struct gpio_chip *gc, un=
signed off, int val)
       |      |             ^~~~~~~~~~~~~~~~~~~~~~
       |      |             |
       |      |             (1) entry to 'pca953x_gpio_set_value'
       |......
       |  553 |         u8 outreg =3D pca953x_recalc_addr(chip, chip->regs-=
>output, off);
       |      |                     ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~=
~~~~~~~~~~~
       |      |                     |
       |      |                     (2) calling 'pca953x_recalc_addr' from =
'pca953x_gpio_set_value'
       |
       +--> 'pca953x_recalc_addr': events 3-9
              |
              |  421 | static u8 pca953x_recalc_addr(struct pca953x_chip *c=
hip, int reg, int off)
              |      |           ^~~~~~~~~~~~~~~~~~~
              |      |           |
              |      |           (3) entry to 'pca953x_recalc_addr'
              |......
              |  424 |         int pinctrl;
              |      |             ~~~~~~~
              |      |             |
              |      |             (4) region created on stack here
              |......
              |  427 |         if (PCA_CHIP_TYPE(chip->driver_data) =3D=3D =
PCAL653X_TYPE) {
              |      |            ~
              |      |            |
              |      |            (5) following 'true' branch...
              |......
              |  431 |                 addr =3D (reg & PCAL_GPIO_MASK) * NB=
ANK(chip);
              |      |                 ~~~~
              |      |                 |
              |      |                 (6) ...to here
              |  432 | =

              |  433 |                 switch(reg) {
              |      |                 ~~~~~~
              |      |                 |
              |      |                 (7) following 'default:' branch...
              |......
              |  451 |                 regaddr =3D pinctrl + addr + (off / =
BANK_SZ);
              |      |                 ~~~~~~~   ~~~~~~~~~~~~~~
              |      |                 |                 |
              |      |                 (8) ...to here    (9) use of uniniti=
alized value 'pinctrl' here
              |
>> drivers/gpio/gpio-pca953x.c:451:35: warning: use of uninitialized value =
'pinctrl' [CWE-457] [-Wanalyzer-use-of-uninitialized-value]
     451 |                 regaddr =3D pinctrl + addr + (off / BANK_SZ);
         |                           ~~~~~~~~^~~~~~
     'pca953x_write_regs': events 1-2
       |
       |  462 | static int pca953x_write_regs(struct pca953x_chip *chip, in=
t reg, unsigned long *val)
       |      |            ^~~~~~~~~~~~~~~~~~
       |      |            |
       |      |            (1) entry to 'pca953x_write_regs'
       |  463 | {
       |  464 |         u8 regaddr =3D pca953x_recalc_addr(chip, reg, 0);
       |      |                      ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
       |      |                      |
       |      |                      (2) calling 'pca953x_recalc_addr' from=
 'pca953x_write_regs'
       |
       +--> 'pca953x_recalc_addr': events 3-9
              |
              |  421 | static u8 pca953x_recalc_addr(struct pca953x_chip *c=
hip, int reg, int off)
              |      |           ^~~~~~~~~~~~~~~~~~~
              |      |           |
              |      |           (3) entry to 'pca953x_recalc_addr'
              |......
              |  424 |         int pinctrl;
              |      |             ~~~~~~~
              |      |             |
              |      |             (4) region created on stack here
              |......
              |  427 |         if (PCA_CHIP_TYPE(chip->driver_data) =3D=3D =
PCAL653X_TYPE) {
              |      |            ~
              |      |            |
              |      |            (5) following 'true' branch...
              |......
              |  431 |                 addr =3D (reg & PCAL_GPIO_MASK) * NB=
ANK(chip);
              |      |                 ~~~~
              |      |                 |
              |      |                 (6) ...to here
              |  432 | =

              |  433 |                 switch(reg) {
              |      |                 ~~~~~~
              |      |                 |
              |      |                 (7) following 'default:' branch...
              |......
              |  451 |                 regaddr =3D pinctrl + addr + (off / =
BANK_SZ);
              |      |                 ~~~~~~~   ~~~~~~~~~~~~~~
              |      |                 |                 |
              |      |                 (8) ...to here    (9) use of uniniti=
alized value 'pinctrl' here
              |
>> drivers/gpio/gpio-pca953x.c:451:35: warning: use of uninitialized value =
'pinctrl' [CWE-457] [-Wanalyzer-use-of-uninitialized-value]
     451 |                 regaddr =3D pinctrl + addr + (off / BANK_SZ);
         |                           ~~~~~~~~^~~~~~
     'pca953x_regcache_sync': events 1-2
       |
       | 1195 | static int pca953x_regcache_sync(struct device *dev)
       |      |            ^~~~~~~~~~~~~~~~~~~~~
       |      |            |
       |      |            (1) entry to 'pca953x_regcache_sync'
       |......
       | 1205 |         regaddr =3D pca953x_recalc_addr(chip, chip->regs->d=
irection, 0);
       |      |                   ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~=
~~~~~~~~~~
       |      |                   |
       |      |                   (2) calling 'pca953x_recalc_addr' from 'p=
ca953x_regcache_sync'
       |
       +--> 'pca953x_recalc_addr': events 3-9
              |
              |  421 | static u8 pca953x_recalc_addr(struct pca953x_chip *c=
hip, int reg, int off)
              |      |           ^~~~~~~~~~~~~~~~~~~
              |      |           |
              |      |           (3) entry to 'pca953x_recalc_addr'
              |......
              |  424 |         int pinctrl;
              |      |             ~~~~~~~
              |      |             |
              |      |             (4) region created on stack here
              |......
              |  427 |         if (PCA_CHIP_TYPE(chip->driver_data) =3D=3D =
PCAL653X_TYPE) {
              |      |            ~
              |      |            |
              |      |            (5) following 'true' branch...
              |......
              |  431 |                 addr =3D (reg & PCAL_GPIO_MASK) * NB=
ANK(chip);
              |      |                 ~~~~
              |      |                 |
              |      |                 (6) ...to here
              |  432 | =

              |  433 |                 switch(reg) {
              |      |                 ~~~~~~
              |      |                 |
              |      |                 (7) following 'default:' branch...
              |......
              |  451 |                 regaddr =3D pinctrl + addr + (off / =
BANK_SZ);
              |      |                 ~~~~~~~   ~~~~~~~~~~~~~~
              |      |                 |                 |
              |      |                 (8) ...to here    (9) use of uniniti=
alized value 'pinctrl' here
              |
>> drivers/gpio/gpio-pca953x.c:451:35: warning: use of uninitialized value =
'pinctrl' [CWE-457] [-Wanalyzer-use-of-uninitialized-value]
     451 |                 regaddr =3D pinctrl + addr + (off / BANK_SZ);
         |                           ~~~~~~~~^~~~~~
     'pca953x_gpio_direction_output': events 1-2
       |
       |  511 | static int pca953x_gpio_direction_output(struct gpio_chip *=
gc,
       |      |            ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~
       |      |            |
       |      |            (1) entry to 'pca953x_gpio_direction_output'
       |......
       |  515 |         u8 dirreg =3D pca953x_recalc_addr(chip, chip->regs-=
>direction, off);
       |      |                     ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~=
~~~~~~~~~~~~~~
       |      |                     |
       |      |                     (2) calling 'pca953x_recalc_addr' from =
'pca953x_gpio_direction_output'
       |
       +--> 'pca953x_recalc_addr': events 3-9
              |
              |  421 | static u8 pca953x_recalc_addr(struct pca953x_chip *c=
hip, int reg, int off)
              |      |           ^~~~~~~~~~~~~~~~~~~
              |      |           |
              |      |           (3) entry to 'pca953x_recalc_addr'
              |......
              |  424 |         int pinctrl;
              |      |             ~~~~~~~
              |      |             |
              |      |             (4) region created on stack here
              |......
              |  427 |         if (PCA_CHIP_TYPE(chip->driver_data) =3D=3D =
PCAL653X_TYPE) {
              |      |            ~
              |      |            |
              |      |            (5) following 'true' branch...
              |......
              |  431 |                 addr =3D (reg & PCAL_GPIO_MASK) * NB=
ANK(chip);
              |      |                 ~~~~
              |      |                 |
              |      |                 (6) ...to here
              |  432 | =

              |  433 |                 switch(reg) {
              |      |                 ~~~~~~
              |      |                 |
              |      |                 (7) following 'default:' branch...
              |......
              |  451 |                 regaddr =3D pinctrl + addr + (off / =
BANK_SZ);
              |      |                 ~~~~~~~   ~~~~~~~~~~~~~~
              |      |                 |                 |
              |      |                 (8) ...to here    (9) use of uniniti=
alized value 'pinctrl' here
              |
>> drivers/gpio/gpio-pca953x.c:451:35: warning: use of uninitialized value =
'pinctrl' [CWE-457] [-Wanalyzer-use-of-uninitialized-value]
     451 |                 regaddr =3D pinctrl + addr + (off / BANK_SZ);
         |                           ~~~~~~~~^~~~~~
     'pca953x_gpio_get_value': events 1-2
       |
       |  533 | static int pca953x_gpio_get_value(struct gpio_chip *gc, uns=
igned off)
       |      |            ^~~~~~~~~~~~~~~~~~~~~~
       |      |            |
       |      |            (1) entry to 'pca953x_gpio_get_value'
       |......
       |  536 |         u8 inreg =3D pca953x_recalc_addr(chip, chip->regs->=
input, off);
       |      |                    ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~=
~~~~~~~~~
       |      |                    |
       |      |                    (2) calling 'pca953x_recalc_addr' from '=
pca953x_gpio_get_value'
       |
       +--> 'pca953x_recalc_addr': events 3-9
              |
              |  421 | static u8 pca953x_recalc_addr(struct pca953x_chip *c=
hip, int reg, int off)
              |      |           ^~~~~~~~~~~~~~~~~~~
              |      |           |
              |      |           (3) entry to 'pca953x_recalc_addr'
              |......
              |  424 |         int pinctrl;
              |      |             ~~~~~~~
              |      |             |
              |      |             (4) region created on stack here
              |......
              |  427 |         if (PCA_CHIP_TYPE(chip->driver_data) =3D=3D =
PCAL653X_TYPE) {
              |      |            ~
              |      |            |
              |      |            (5) following 'true' branch...
              |......
              |  431 |                 addr =3D (reg & PCAL_GPIO_MASK) * NB=
ANK(chip);
              |      |                 ~~~~
              |      |                 |
              |      |                 (6) ...to here
              |  432 | =

              |  433 |                 switch(reg) {
              |      |                 ~~~~~~
              |      |                 |
              |      |                 (7) following 'default:' branch...
              |......
              |  451 |                 regaddr =3D pinctrl + addr + (off / =
BANK_SZ);
              |      |                 ~~~~~~~   ~~~~~~~~~~~~~~
              |      |                 |                 |
              |      |                 (8) ...to here    (9) use of uniniti=
alized value 'pinctrl' here
              |
>> drivers/gpio/gpio-pca953x.c:451:35: warning: use of uninitialized value =
'pinctrl' [CWE-457] [-Wanalyzer-use-of-uninitialized-value]
     451 |                 regaddr =3D pinctrl + addr + (off / BANK_SZ);
         |                           ~~~~~~~~^~~~~~
     'pca953x_read_regs': events 1-2
       |
       |  480 | static int pca953x_read_regs(struct pca953x_chip *chip, int=
 reg, unsigned long *val)
       |      |            ^~~~~~~~~~~~~~~~~
       |      |            |
       |      |            (1) entry to 'pca953x_read_regs'
       |  481 | {
       |  482 |         u8 regaddr =3D pca953x_recalc_addr(chip, reg, 0);
       |      |                      ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
       |      |                      |
       |      |                      (2) calling 'pca953x_recalc_addr' from=
 'pca953x_read_regs'
       |
       +--> 'pca953x_recalc_addr': events 3-9
              |
              |  421 | static u8 pca953x_recalc_addr(struct pca953x_chip *c=
hip, int reg, int off)
              |      |           ^~~~~~~~~~~~~~~~~~~
              |      |           |
              |      |           (3) entry to 'pca953x_recalc_addr'
              |......
              |  424 |         int pinctrl;
              |      |             ~~~~~~~
              |      |             |
              |      |             (4) region created on stack here
              |......
              |  427 |         if (PCA_CHIP_TYPE(chip->driver_data) =3D=3D =
PCAL653X_TYPE) {
              |      |            ~
              |      |            |
              |      |            (5) following 'true' branch...
              |......
              |  431 |                 addr =3D (reg & PCAL_GPIO_MASK) * NB=
ANK(chip);
              |      |                 ~~~~
              |      |                 |
              |      |                 (6) ...to here
              |  432 | =

              |  433 |                 switch(reg) {
              |      |                 ~~~~~~
              |      |                 |
              |      |                 (7) following 'default:' branch...
              |......
              |  451 |                 regaddr =3D pinctrl + addr + (off / =
BANK_SZ);
              |      |                 ~~~~~~~   ~~~~~~~~~~~~~~
              |      |                 |                 |
              |      |                 (8) ...to here    (9) use of uniniti=
alized value 'pinctrl' here
              |
>> drivers/gpio/gpio-pca953x.c:451:35: warning: use of uninitialized value =
'pinctrl' [CWE-457] [-Wanalyzer-use-of-uninitialized-value]
     451 |                 regaddr =3D pinctrl + addr + (off / BANK_SZ);
         |                           ~~~~~~~~^~~~~~
     'pca953x_gpio_direction_input': events 1-2
       |
       |  498 | static int pca953x_gpio_direction_input(struct gpio_chip *g=
c, unsigned off)
       |      |            ^~~~~~~~~~~~~~~~~~~~~~~~~~~~
       |      |            |
       |      |            (1) entry to 'pca953x_gpio_direction_input'
       |......
       |  501 |         u8 dirreg =3D pca953x_recalc_addr(chip, chip->regs-=
>direction, off);
       |      |                     ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~=
~~~~~~~~~~~~~~
       |      |                     |
       |      |                     (2) calling 'pca953x_recalc_addr' from =
'pca953x_gpio_direction_input'
       |
       +--> 'pca953x_recalc_addr': events 3-9
              |
              |  421 | static u8 pca953x_recalc_addr(struct pca953x_chip *c=
hip, int reg, int off)
              |      |           ^~~~~~~~~~~~~~~~~~~
              |      |           |
              |      |           (3) entry to 'pca953x_recalc_addr'
              |......
              |  424 |         int pinctrl;
              |      |             ~~~~~~~
              |      |             |
              |      |             (4) region created on stack here
              |......
              |  427 |         if (PCA_CHIP_TYPE(chip->driver_data) =3D=3D =
PCAL653X_TYPE) {
              |      |            ~
              |      |            |
              |      |            (5) following 'true' branch...
              |......
              |  431 |                 addr =3D (reg & PCAL_GPIO_MASK) * NB=
ANK(chip);
              |      |                 ~~~~
              |      |                 |
              |      |                 (6) ...to here
              |  432 | =

              |  433 |                 switch(reg) {
              |      |                 ~~~~~~
              |      |                 |
              |      |                 (7) following 'default:' branch...
              |......
              |  451 |                 regaddr =3D pinctrl + addr + (off / =
BANK_SZ);
              |      |                 ~~~~~~~   ~~~~~~~~~~~~~~
              |      |                 |                 |
              |      |                 (8) ...to here    (9) use of uniniti=
alized value 'pinctrl' here
              |
>> drivers/gpio/gpio-pca953x.c:451:35: warning: use of uninitialized value =
'pinctrl' [CWE-457] [-Wanalyzer-use-of-uninitialized-value]
     451 |                 regaddr =3D pinctrl + addr + (off / BANK_SZ);
         |                           ~~~~~~~~^~~~~~
     'pca953x_gpio_get_direction': events 1-2
       |
       |  561 | static int pca953x_gpio_get_direction(struct gpio_chip *gc,=
 unsigned off)
       |      |            ^~~~~~~~~~~~~~~~~~~~~~~~~~
       |      |            |
       |      |            (1) entry to 'pca953x_gpio_get_direction'
       |......
       |  564 |         u8 dirreg =3D pca953x_recalc_addr(chip, chip->regs-=
>direction, off);
       |      |                     ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~=
~~~~~~~~~~~~~~
       |      |                     |
       |      |                     (2) calling 'pca953x_recalc_addr' from =
'pca953x_gpio_get_direction'
       |
       +--> 'pca953x_recalc_addr': events 3-9
              |
              |  421 | static u8 pca953x_recalc_addr(struct pca953x_chip *c=
hip, int reg, int off)
              |      |           ^~~~~~~~~~~~~~~~~~~
              |      |           |
              |      |           (3) entry to 'pca953x_recalc_addr'
              |......
              |  424 |         int pinctrl;
              |      |             ~~~~~~~
              |      |             |
              |      |             (4) region created on stack here
              |......
              |  427 |         if (PCA_CHIP_TYPE(chip->driver_data) =3D=3D =
PCAL653X_TYPE) {
              |      |            ~
              |      |            |
              |      |            (5) following 'true' branch...
              |......
              |  431 |                 addr =3D (reg & PCAL_GPIO_MASK) * NB=
ANK(chip);
              |      |                 ~~~~
              |      |                 |
              |      |                 (6) ...to here
              |  432 | =

              |  433 |                 switch(reg) {
              |      |                 ~~~~~~
              |      |                 |
              |      |                 (7) following 'default:' branch...
              |......
              |  451 |                 regaddr =3D pinctrl + addr + (off / =
BANK_SZ);
              |      |                 ~~~~~~~   ~~~~~~~~~~~~~~
              |      |                 |                 |
              |      |                 (8) ...to here    (9) use of uniniti=
alized value 'pinctrl' here
              |
>> drivers/gpio/gpio-pca953x.c:451:35: warning: use of uninitialized value =
'pinctrl' [CWE-457] [-Wanalyzer-use-of-uninitialized-value]
     451 |                 regaddr =3D pinctrl + addr + (off / BANK_SZ);
         |                           ~~~~~~~~^~~~~~
     'device_pca95xx_init': events 1-2
       |
       |  980 | static int device_pca95xx_init(struct pca953x_chip *chip, u=
32 invert)
       |      |            ^~~~~~~~~~~~~~~~~~~
       |      |            |
       |      |            (1) entry to 'device_pca95xx_init'
       |......
       |  986 |         regaddr =3D pca953x_recalc_addr(chip, chip->regs->o=
utput, 0);
       |      |                   ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~=
~~~~~~~
       |      |                   |
       |      |                   (2) calling 'pca953x_recalc_addr' from 'd=
evice_pca95xx_init'
       |
       +--> 'pca953x_recalc_addr': events 3-9
              |
              |  421 | static u8 pca953x_recalc_addr(struct pca953x_chip *c=
hip, int reg, int off)
              |      |           ^~~~~~~~~~~~~~~~~~~
              |      |           |
              |      |           (3) entry to 'pca953x_recalc_addr'
              |......
              |  424 |         int pinctrl;
              |      |             ~~~~~~~
              |      |             |
              |      |             (4) region created on stack here
              |......
              |  427 |         if (PCA_CHIP_TYPE(chip->driver_data) =3D=3D =
PCAL653X_TYPE) {
              |      |            ~
              |      |            |
              |      |            (5) following 'true' branch...
              |......
              |  431 |                 addr =3D (reg & PCAL_GPIO_MASK) * NB=
ANK(chip);
              |      |                 ~~~~
              |      |                 |
              |      |                 (6) ...to here
              |  432 | =

              |  433 |                 switch(reg) {
              |      |                 ~~~~~~
              |      |                 |
              |      |                 (7) following 'default:' branch...
              |......
              |  451 |                 regaddr =3D pinctrl + addr + (off / =
BANK_SZ);
              |      |                 ~~~~~~~   ~~~~~~~~~~~~~~
              |      |                 |                 |
              |      |                 (8) ...to here    (9) use of uniniti=
alized value 'pinctrl' here
              |
>> drivers/gpio/gpio-pca953x.c:451:35: warning: use of uninitialized value =
'pinctrl' [CWE-457] [-Wanalyzer-use-of-uninitialized-value]
     451 |                 regaddr =3D pinctrl + addr + (off / BANK_SZ);
         |                           ~~~~~~~~^~~~~~
     'pca953x_gpio_set_multiple': events 1-2
       |
       |  598 | static void pca953x_gpio_set_multiple(struct gpio_chip *gc,
       |      |             ^~~~~~~~~~~~~~~~~~~~~~~~~
       |      |             |
       |      |             (1) entry to 'pca953x_gpio_set_multiple'
       |......
       |  606 |         ret =3D pca953x_read_regs(chip, chip->regs->output,=
 reg_val);
       |      |               ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~=
~~~~~~~
       |      |               |
       |      |               (2) calling 'pca953x_read_regs' from 'pca953x=
_gpio_set_multiple'
       |
       +--> 'pca953x_read_regs': events 3-4
              |
              |  480 | static int pca953x_read_regs(struct pca953x_chip *ch=
ip, int reg, unsigned long *val)
              |      |            ^~~~~~~~~~~~~~~~~
              |      |            |
              |      |            (3) entry to 'pca953x_read_regs'
              |  481 | {
              |  482 |         u8 regaddr =3D pca953x_recalc_addr(chip, reg=
, 0);
              |      |                      ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~=
~~
              |      |                      |
              |      |                      (4) calling 'pca953x_recalc_add=
r' from 'pca953x_read_regs'
              |
              +--> 'pca953x_recalc_addr': events 5-11
                     |
                     |  421 | static u8 pca953x_recalc_addr(struct pca953x_=
chip *chip, int reg, int off)
                     |      |           ^~~~~~~~~~~~~~~~~~~
                     |      |           |
                     |      |           (5) entry to 'pca953x_recalc_addr'
                     |......
                     |  424 |         int pinctrl;
                     |      |             ~~~~~~~
                     |      |             |
                     |      |             (6) region created on stack here
                     |......
                     |  427 |         if (PCA_CHIP_TYPE(chip->driver_data) =
=3D=3D PCAL653X_TYPE) {
                     |      |            ~
                     |      |            |
                     |      |            (7) following 'true' branch...
                     |......
                     |  431 |                 addr =3D (reg & PCAL_GPIO_MAS=
K) * NBANK(chip);
                     |      |                 ~~~~
                     |      |                 |
                     |      |                 (8) ...to here
                     |  432 | =

                     |  433 |                 switch(reg) {
                     |      |                 ~~~~~~
                     |      |                 |
                     |      |                 (9) following 'default:' bran=
ch...
                     |......
                     |  451 |                 regaddr =3D pinctrl + addr + =
(off / BANK_SZ);
                     |      |                 ~~~~~~~   ~~~~~~~~~~~~~~
                     |      |                 |                 |
                     |      |                 (10) ...to here   (11) use of=
 uninitialized value 'pinctrl' here
                     |
>> drivers/gpio/gpio-pca953x.c:451:35: warning: use of uninitialized value =
'pinctrl' [CWE-457] [-Wanalyzer-use-of-uninitialized-value]
     451 |                 regaddr =3D pinctrl + addr + (off / BANK_SZ);
         |                           ~~~~~~~~^~~~~~
     'pca953x_resume': events 1-2
       |
       | 1258 | static int pca953x_resume(struct device *dev)
       |      |            ^~~~~~~~~~~~~~
       |      |            |
       |      |            (1) entry to 'pca953x_resume'
       |......
       | 1273 |         ret =3D pca953x_regcache_sync(dev);
       |      |               ~~~~~~~~~~~~~~~~~~~~~~~~~~
       |      |               |
       |      |               (2) calling 'pca953x_regcache_sync' from 'pca=
953x_resume'
       |
       +--> 'pca953x_regcache_sync': events 3-4
              |
              | 1195 | static int pca953x_regcache_sync(struct device *dev)
              |      |            ^~~~~~~~~~~~~~~~~~~~~
              |      |            |
              |      |            (3) entry to 'pca953x_regcache_sync'
              |......
              | 1205 |         regaddr =3D pca953x_recalc_addr(chip, chip->=
regs->direction, 0);
              |      |                   ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~=
~~~~~~~~~~~~~~~~~
              |      |                   |
              |      |                   (4) calling 'pca953x_recalc_addr' =
from 'pca953x_regcache_sync'
              |
              +--> 'pca953x_recalc_addr': events 5-11
                     |
                     |  421 | static u8 pca953x_recalc_addr(struct pca953x_=
chip *chip, int reg, int off)
                     |      |           ^~~~~~~~~~~~~~~~~~~
                     |      |           |
                     |      |           (5) entry to 'pca953x_recalc_addr'
                     |......
                     |  424 |         int pinctrl;
                     |      |             ~~~~~~~
                     |      |             |
                     |      |             (6) region created on stack here
                     |......
                     |  427 |         if (PCA_CHIP_TYPE(chip->driver_data) =
=3D=3D PCAL653X_TYPE) {
                     |      |            ~
                     |      |            |
                     |      |            (7) following 'true' branch...
                     |......
                     |  431 |                 addr =3D (reg & PCAL_GPIO_MAS=
K) * NBANK(chip);
                     |      |                 ~~~~
                     |      |                 |
                     |      |                 (8) ...to here
                     |  432 | =

                     |  433 |                 switch(reg) {
                     |      |                 ~~~~~~
                     |      |                 |
                     |      |                 (9) following 'default:' bran=
ch...
                     |......
                     |  451 |                 regaddr =3D pinctrl + addr + =
(off / BANK_SZ);
                     |      |                 ~~~~~~~   ~~~~~~~~~~~~~~
                     |      |                 |                 |
                     |      |                 (10) ...to here   (11) use of=
 uninitialized value 'pinctrl' here
                     |
>> drivers/gpio/gpio-pca953x.c:451:35: warning: use of uninitialized value =
'pinctrl' [CWE-457] [-Wanalyzer-use-of-uninitialized-value]
     451 |                 regaddr =3D pinctrl + addr + (off / BANK_SZ);
         |                           ~~~~~~~~^~~~~~
     'pca953x_gpio_get_multiple': events 1-2
       |
       |  581 | static int pca953x_gpio_get_multiple(struct gpio_chip *gc,
       |      |            ^~~~~~~~~~~~~~~~~~~~~~~~~
       |      |            |
       |      |            (1) entry to 'pca953x_gpio_get_multiple'
       |......
       |  589 |         ret =3D pca953x_read_regs(chip, chip->regs->input, =
reg_val);
       |      |               ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~=
~~~~~~
       |      |               |
       |      |               (2) calling 'pca953x_read_regs' from 'pca953x=
_gpio_get_multiple'
       |
       +--> 'pca953x_read_regs': events 3-4
              |
              |  480 | static int pca953x_read_regs(struct pca953x_chip *ch=
ip, int reg, unsigned long *val)
              |      |            ^~~~~~~~~~~~~~~~~
              |      |            |
              |      |            (3) entry to 'pca953x_read_regs'
              |  481 | {
              |  482 |         u8 regaddr =3D pca953x_recalc_addr(chip, reg=
, 0);
              |      |                      ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~=
~~
              |      |                      |
              |      |                      (4) calling 'pca953x_recalc_add=
r' from 'pca953x_read_regs'
              |
              +--> 'pca953x_recalc_addr': events 5-11
                     |
                     |  421 | static u8 pca953x_recalc_addr(struct pca953x_=
chip *chip, int reg, int off)
                     |      |           ^~~~~~~~~~~~~~~~~~~
                     |      |           |
                     |      |           (5) entry to 'pca953x_recalc_addr'
                     |......
                     |  424 |         int pinctrl;
                     |      |             ~~~~~~~
                     |      |             |
                     |      |             (6) region created on stack here
                     |......
                     |  427 |         if (PCA_CHIP_TYPE(chip->driver_data) =
=3D=3D PCAL653X_TYPE) {
                     |      |            ~
                     |      |            |
                     |      |            (7) following 'true' branch...
                     |......
                     |  431 |                 addr =3D (reg & PCAL_GPIO_MAS=
K) * NBANK(chip);
                     |      |                 ~~~~
                     |      |                 |
                     |      |                 (8) ...to here
                     |  432 | =

                     |  433 |                 switch(reg) {
                     |      |                 ~~~~~~
                     |      |                 |
                     |      |                 (9) following 'default:' bran=
ch...
                     |......
                     |  451 |                 regaddr =3D pinctrl + addr + =
(off / BANK_SZ);
                     |      |                 ~~~~~~~   ~~~~~~~~~~~~~~
                     |      |                 |                 |
                     |      |                 (10) ...to here   (11) use of=
 uninitialized value 'pinctrl' here
                     |
>> drivers/gpio/gpio-pca953x.c:451:35: warning: use of uninitialized value =
'pinctrl' [CWE-457] [-Wanalyzer-use-of-uninitialized-value]
     451 |                 regaddr =3D pinctrl + addr + (off / BANK_SZ);
         |                           ~~~~~~~~^~~~~~
     'device_pca957x_init': events 1-2
       |
       | 1009 | static int device_pca957x_init(struct pca953x_chip *chip, u=
32 invert)
       |      |            ^~~~~~~~~~~~~~~~~~~
       |      |            |
       |      |            (1) entry to 'device_pca957x_init'
       |......
       | 1015 |         ret =3D device_pca95xx_init(chip, invert);
       |      |               ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
       |      |               |
       |      |               (2) calling 'device_pca95xx_init' from 'devic=
e_pca957x_init'
       |
       +--> 'device_pca95xx_init': events 3-4
              |
              |  980 | static int device_pca95xx_init(struct pca953x_chip *=
chip, u32 invert)
              |      |            ^~~~~~~~~~~~~~~~~~~
              |      |            |
              |      |            (3) entry to 'device_pca95xx_init'
              |......
              |  986 |         regaddr =3D pca953x_recalc_addr(chip, chip->=
regs->output, 0);
              |      |                   ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~=
~~~~~~~~~~~~~~
              |      |                   |
              |      |                   (4) calling 'pca953x_recalc_addr' =
from 'device_pca95xx_init'
              |
              +--> 'pca953x_recalc_addr': events 5-11
                     |
                     |  421 | static u8 pca953x_recalc_addr(struct pca953x_=
chip *chip, int reg, int off)
                     |      |           ^~~~~~~~~~~~~~~~~~~
                     |      |           |
                     |      |           (5) entry to 'pca953x_recalc_addr'
                     |......
                     |  424 |         int pinctrl;
                     |      |             ~~~~~~~
                     |      |             |
                     |      |             (6) region created on stack here
                     |......
                     |  427 |         if (PCA_CHIP_TYPE(chip->driver_data) =
=3D=3D PCAL653X_TYPE) {
                     |      |            ~
                     |      |            |
                     |      |            (7) following 'true' branch...
                     |......
                     |  431 |                 addr =3D (reg & PCAL_GPIO_MAS=
K) * NBANK(chip);
                     |      |                 ~~~~
                     |      |                 |
                     |      |                 (8) ...to here
                     |  432 | =

                     |  433 |                 switch(reg) {
                     |      |                 ~~~~~~
                     |      |                 |
                     |      |                 (9) following 'default:' bran=
ch...
                     |......
                     |  451 |                 regaddr =3D pinctrl + addr + =
(off / BANK_SZ);
                     |      |                 ~~~~~~~   ~~~~~~~~~~~~~~
                     |      |                 |                 |
                     |      |                 (10) ...to here   (11) use of=
 uninitialized value 'pinctrl' here
                     |
>> drivers/gpio/gpio-pca953x.c:451:35: warning: use of uninitialized value =
'pinctrl' [CWE-457] [-Wanalyzer-use-of-uninitialized-value]
     451 |                 regaddr =3D pinctrl + addr + (off / BANK_SZ);
         |                           ~~~~~~~~^~~~~~
     'pca953x_probe': events 1-12
       |
       | 1032 | static int pca953x_probe(struct i2c_client *client,
       |      |            ^~~~~~~~~~~~~
       |      |            |
       |      |            (1) entry to 'pca953x_probe'
       |......
       | 1044 |         if (chip =3D=3D NULL)
       |      |            ~
       |      |            |
       |      |            (2) following 'false' branch...
       |......
       | 1047 |         pdata =3D dev_get_platdata(&client->dev);
       |      |         ~~~~~
       |      |         |
       |      |         (3) ...to here
       |......
       | 1075 |         if (IS_ERR(reg))
       |      |            ~
       |      |            |
       |      |            (4) following 'false' branch...
       |......
       | 1078 |         ret =3D regulator_enable(reg);
       |      |         ~~~ =

       |      |         |
       |      |         (5) ...to here
       | 1079 |         if (ret) {
       |      |            ~
       |      |            |
       |      |            (6) following 'false' branch (when 'ret =3D=3D 0=
')...
       |......
       | 1083 |         chip->regulator =3D reg;
       |      |         ~~~~
       |      |         |
       |      |         (7) ...to here
       |......
       | 1112 |         if (IS_ERR(chip->regmap)) {
       |      |            ~
       |      |            |
       |      |            (8) following 'false' branch...
       |......
       | 1117 |         regcache_mark_dirty(chip->regmap);
       |      |         ~~~~~~~~~~~~~~~~~~~
       |      |         |
       |      |         (9) ...to here
       |......
       | 1142 |         if (PCA_CHIP_TYPE(chip->driver_data) =3D=3D PCA957X=
_TYPE) {
       |      |            ~
       |      |            |
       |      |            (10) following 'false' branch...
       |......
       | 1146 |                 chip->regs =3D &pca953x_regs;
       |      |                 ~~~~
       |      |                 |
       |      |                 (11) ...to here
       | 1147 |                 ret =3D device_pca95xx_init(chip, invert);
       |      |                       ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
       |      |                       |
       |      |                       (12) calling 'device_pca95xx_init' fr=
om 'pca953x_probe'
       |
       +--> 'device_pca95xx_init': events 13-14
              |
              |  980 | static int device_pca95xx_init(struct pca953x_chip *=
chip, u32 invert)
              |      |            ^~~~~~~~~~~~~~~~~~~
              |      |            |
              |      |            (13) entry to 'device_pca95xx_init'
              |......
              |  986 |         regaddr =3D pca953x_recalc_addr(chip, chip->=
regs->output, 0);
              |      |                   ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~=
~~~~~~~~~~~~~~
              |      |                   |
              |      |                   (14) calling 'pca953x_recalc_addr'=
 from 'device_pca95xx_init'
              |
              +--> 'pca953x_recalc_addr': events 15-21
                     |
                     |  421 | static u8 pca953x_recalc_addr(struct pca953x_=
chip *chip, int reg, int off)
                     |      |           ^~~~~~~~~~~~~~~~~~~
                     |      |           |
                     |      |           (15) entry to 'pca953x_recalc_addr'
                     |......
                     |  424 |         int pinctrl;
                     |      |             ~~~~~~~
                     |      |             |
                     |      |             (16) region created on stack here
                     |......
                     |  427 |         if (PCA_CHIP_TYPE(chip->driver_data) =
=3D=3D PCAL653X_TYPE) {
                     |      |            ~
                     |      |            |
                     |      |            (17) following 'true' branch...
                     |......
                     |  431 |                 addr =3D (reg & PCAL_GPIO_MAS=
K) * NBANK(chip);
                     |      |                 ~~~~
                     |      |                 |
                     |      |                 (18) ...to here
                     |  432 | =

                     |  433 |                 switch(reg) {
                     |      |                 ~~~~~~
                     |      |                 |
                     |      |                 (19) following 'default:' bra=
nch...
                     |......
                     |  451 |                 regaddr =3D pinctrl + addr + =
(off / BANK_SZ);
                     |      |                 ~~~~~~~   ~~~~~~~~~~~~~~
                     |      |                 |                 |
                     |      |                 (20) ...to here   (21) use of=
 uninitialized value 'pinctrl' here
                     |
>> drivers/gpio/gpio-pca953x.c:451:35: warning: use of uninitialized value =
'pinctrl' [CWE-457] [-Wanalyzer-use-of-uninitialized-value]
     451 |                 regaddr =3D pinctrl + addr + (off / BANK_SZ);
         |                           ~~~~~~~~^~~~~~
     'pca953x_probe': events 1-12
       |
       | 1032 | static int pca953x_probe(struct i2c_client *client,
       |      |            ^~~~~~~~~~~~~
       |      |            |
       |      |            (1) entry to 'pca953x_probe'
       |......
       | 1044 |         if (chip =3D=3D NULL)
       |      |            ~
       |      |            |
       |      |            (2) following 'false' branch...
       |......
       | 1047 |         pdata =3D dev_get_platdata(&client->dev);
       |      |         ~~~~~
       |      |         |
       |      |         (3) ...to here
       |......
       | 1075 |         if (IS_ERR(reg))
       |      |            ~
       |      |            |
       |      |            (4) following 'false' branch...
       |......
       | 1078 |         ret =3D regulator_enable(reg);
       |      |         ~~~ =

       |      |         |
       |      |         (5) ...to here
       | 1079 |         if (ret) {
       |      |            ~
       |      |            |
       |      |            (6) following 'false' branch (when 'ret =3D=3D 0=
')...
       |......
       | 1083 |         chip->regulator =3D reg;
       |      |         ~~~~
       |      |         |
       |      |         (7) ...to here
       |......
       | 1112 |         if (IS_ERR(chip->regmap)) {
       |      |            ~
       |      |            |
       |      |            (8) following 'false' branch...
       |......
       | 1117 |         regcache_mark_dirty(chip->regmap);
       |      |         ~~~~~~~~~~~~~~~~~~~
       |      |         |
       |      |         (9) ...to here
       |......
       | 1142 |         if (PCA_CHIP_TYPE(chip->driver_data) =3D=3D PCA957X=
_TYPE) {
       |      |            ~
       |      |            |
       |      |            (10) following 'true' branch...
       | 1143 |                 chip->regs =3D &pca957x_regs;
       |      |                 ~~~~
       |      |                 |
       |      |                 (11) ...to here
       | 1144 |                 ret =3D device_pca957x_init(chip, invert);
       |      |                       ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
       |      |                       |
       |      |                       (12) calling 'device_pca957x_init' fr=
om 'pca953x_probe'
       |
       +--> 'device_pca957x_init': events 13-14
              |
              | 1009 | static int device_pca957x_init(struct pca953x_chip *=
chip, u32 invert)
              |      |            ^~~~~~~~~~~~~~~~~~~
              |      |            |
              |      |            (13) entry to 'device_pca957x_init'
              |......
              | 1015 |         ret =3D device_pca95xx_init(chip, invert);
              |      |               ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
              |      |               |
              |      |               (14) calling 'device_pca95xx_init' fro=
m 'device_pca957x_init'
              |
              +--> 'device_pca95xx_init': events 15-16
                     |
                     |  980 | static int device_pca95xx_init(struct pca953x=
_chip *chip, u32 invert)
                     |      |            ^~~~~~~~~~~~~~~~~~~
                     |      |            |
                     |      |            (15) entry to 'device_pca95xx_init'
                     |......
                     |  986 |         regaddr =3D pca953x_recalc_addr(chip,=
 chip->regs->output, 0);
                     |      |                   ~~~~~~~~~~~~~~~~~~~~~~~~~~~=
~~~~~~~~~~~~~~~~~~~~~
                     |      |                   |
                     |      |                   (16) calling 'pca953x_recal=
c_addr' from 'device_pca95xx_init'
                     |
                     +--> 'pca953x_recalc_addr': events 17-23
                            |
                            |  421 | static u8 pca953x_recalc_addr(struct p=
ca953x_chip *chip, int reg, int off)
                            |      |           ^~~~~~~~~~~~~~~~~~~
                            |      |           |
                            |      |           (17) entry to 'pca953x_recal=
c_addr'
                            |......
                            |  424 |         int pinctrl;
                            |      |             ~~~~~~~
                            |      |             |
                            |      |             (18) region created on sta=
ck here
                            |......
                            |  427 |         if (PCA_CHIP_TYPE(chip->driver=
_data) =3D=3D PCAL653X_TYPE) {
                            |      |            ~
                            |      |            |
                            |      |            (19) following 'true' branc=
h...
                            |......
                            |  431 |                 addr =3D (reg & PCAL_G=
PIO_MASK) * NBANK(chip);
                            |      |                 ~~~~
                            |      |                 |
                            |      |                 (20) ...to here
                            |  432 | =

                            |  433 |                 switch(reg) {
                            |      |                 ~~~~~~
                            |      |                 |
                            |      |                 (21) following 'defaul=
t:' branch...
                            |......
                            |  451 |                 regaddr =3D pinctrl + =
addr + (off / BANK_SZ);
                            |      |                 ~~~~~~~   ~~~~~~~~~~~~=
~~
                            |      |                 |                 |
                            |      |                 (22) ...to here   (23)=
 use of uninitialized value 'pinctrl' here
                            |
>> drivers/gpio/gpio-pca953x.c:451:35: warning: use of uninitialized value =
'pinctrl' [CWE-457] [-Wanalyzer-use-of-uninitialized-value]
     451 |                 regaddr =3D pinctrl + addr + (off / BANK_SZ);
         |                           ~~~~~~~~^~~~~~
     'device_pca95xx_init': events 1-2
       |
       |  980 | static int device_pca95xx_init(struct pca953x_chip *chip, u=
32 invert)
       |      |            ^~~~~~~~~~~~~~~~~~~
       |      |            |
       |      |            (1) entry to 'device_pca95xx_init'
       |......
       |  986 |         regaddr =3D pca953x_recalc_addr(chip, chip->regs->o=
utput, 0);
       |      |                   ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~=
~~~~~~~
       |      |                   |
       |      |                   (2) calling 'pca953x_recalc_addr' from 'd=
evice_pca95xx_init'
       |
       +--> 'pca953x_recalc_addr': events 3-4
              |
              |  421 | static u8 pca953x_recalc_addr(struct pca953x_chip *c=
hip, int reg, int off)
              |      |           ^~~~~~~~~~~~~~~~~~~
              |      |           |
              |      |           (3) entry to 'pca953x_recalc_addr'
              |......
              |  424 |         int pinctrl;
              |      |             ~~~~~~~
              |      |             |
              |      |             (4) region created on stack here
              |
       <------+
       |
     'device_pca95xx_init': events 5-8
       |
       |  986 |         regaddr =3D pca953x_recalc_addr(chip, chip->regs->o=
utput, 0);
       |      |                   ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~=
~~~~~~~
       |      |                   |
       |      |                   (5) returning to 'device_pca95xx_init' fr=
om 'pca953x_recalc_addr'
       |......
       |  989 |         if (ret)
       |      |            ~       =

       |      |            |
       |      |            (6) following 'false' branch (when 'ret =3D=3D 0=
')...
       |......
       |  992 |         regaddr =3D pca953x_recalc_addr(chip, chip->regs->d=
irection, 0);
       |      |         ~~~~~~~   ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~=
~~~~~~~~~~
       |      |         |         |
       |      |         |         (8) calling 'pca953x_recalc_addr' from 'd=
evice_pca95xx_init'
       |      |         (7) ...to here
       |
       +--> 'pca953x_recalc_addr': events 9-10
              |
              |  421 | static u8 pca953x_recalc_addr(struct pca953x_chip *c=
hip, int reg, int off)
              |      |           ^~~~~~~~~~~~~~~~~~~
              |      |           |
              |      |           (9) entry to 'pca953x_recalc_addr'
              |......
              |  424 |         int pinctrl;
              |      |             ~~~~~~~
              |      |             |
              |      |             (10) region created on stack here
              |
       <------+
       |
     'device_pca95xx_init': events 11-14
       |
       |  992 |         regaddr =3D pca953x_recalc_addr(chip, chip->regs->d=
irection, 0);
       |      |                   ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~=
~~~~~~~~~~
       |      |                   |
       |      |                   (11) returning to 'device_pca95xx_init' f=
rom 'pca953x_recalc_addr'
       |......
       |  995 |         if (ret)
       |      |            ~       =

       |      |            |
       |      |            (12) following 'false' branch (when 'ret =3D=3D =
0')...
       |......
       |  999 |         if (invert)
       |      |         ~~         =

       |      |         |
       |      |         (13) ...to here
       |......
       | 1004 |         ret =3D pca953x_write_regs(chip, chip->regs->invert=
, val);
       |      |               ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~=
~~~~
       |      |               |
       |      |               (14) calling 'pca953x_write_regs' from 'devic=
e_pca95xx_init'
       |
       +--> 'pca953x_write_regs': events 15-16
              |
              |  462 | static int pca953x_write_regs(struct pca953x_chip *c=
hip, int reg, unsigned long *val)
              |      |            ^~~~~~~~~~~~~~~~~~
              |      |            |
              |      |            (15) entry to 'pca953x_write_regs'
              |  463 | {
              |  464 |         u8 regaddr =3D pca953x_recalc_addr(chip, reg=
, 0);
              |      |                      ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~=
~~
              |      |                      |
              |      |                      (16) calling 'pca953x_recalc_ad=
dr' from 'pca953x_write_regs'
              |
              +--> 'pca953x_recalc_addr': events 17-23
                     |
                     |  421 | static u8 pca953x_recalc_addr(struct pca953x_=
chip *chip, int reg, int off)
                     |      |           ^~~~~~~~~~~~~~~~~~~
                     |      |           |
                     |      |           (17) entry to 'pca953x_recalc_addr'
                     |......
                     |  424 |         int pinctrl;
                     |      |             ~~~~~~~
                     |      |             |
                     |      |             (18) region created on stack here
                     |......
                     |  427 |         if (PCA_CHIP_TYPE(chip->driver_data) =
=3D=3D PCAL653X_TYPE) {
                     |      |            ~
                     |      |            |
                     |      |            (19) following 'true' branch...
                     |......
                     |  431 |                 addr =3D (reg & PCAL_GPIO_MAS=
K) * NBANK(chip);
                     |      |                 ~~~~
                     |      |                 |
                     |      |                 (20) ...to here
                     |  432 | =

                     |  433 |                 switch(reg) {
                     |      |                 ~~~~~~
                     |      |                 |
                     |      |                 (21) following 'default:' bra=
nch...
                     |......
                     |  451 |                 regaddr =3D pinctrl + addr + =
(off / BANK_SZ);
                     |      |                 ~~~~~~~   ~~~~~~~~~~~~~~
                     |      |                 |                 |
                     |      |                 (22) ...to here   (23) use of=
 uninitialized value 'pinctrl' here
                     |
>> drivers/gpio/gpio-pca953x.c:451:35: warning: use of uninitialized value =
'pinctrl' [CWE-457] [-Wanalyzer-use-of-uninitialized-value]
     451 |                 regaddr =3D pinctrl + addr + (off / BANK_SZ);
         |                           ~~~~~~~~^~~~~~
     'pca953x_gpio_set_multiple': events 1-2
       |
       |  598 | static void pca953x_gpio_set_multiple(struct gpio_chip *gc,
       |      |             ^~~~~~~~~~~~~~~~~~~~~~~~~
       |      |             |
       |      |             (1) entry to 'pca953x_gpio_set_multiple'
       |......
       |  606 |         ret =3D pca953x_read_regs(chip, chip->regs->output,=
 reg_val);
       |      |               ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~=
~~~~~~~
       |      |               |
       |      |               (2) calling 'pca953x_read_regs' from 'pca953x=
_gpio_set_multiple'
       |
       +--> 'pca953x_read_regs': events 3-4
              |
              |  480 | static int pca953x_read_regs(struct pca953x_chip *ch=
ip, int reg, unsigned long *val)
              |      |            ^~~~~~~~~~~~~~~~~
              |      |            |
              |      |            (3) entry to 'pca953x_read_regs'
              |  481 | {
              |  482 |         u8 regaddr =3D pca953x_recalc_addr(chip, reg=
, 0);
              |      |                      ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~=
~~
              |      |                      |
              |      |                      (4) calling 'pca953x_recalc_add=
r' from 'pca953x_read_regs'
              |
              +--> 'pca953x_recalc_addr': events 5-6
                     |
                     |  421 | static u8 pca953x_recalc_addr(struct pca953x_=
chip *chip, int reg, int off)
                     |      |           ^~~~~~~~~~~~~~~~~~~
                     |      |           |
                     |      |           (5) entry to 'pca953x_recalc_addr'
                     |......
                     |  424 |         int pinctrl;
                     |      |             ~~~~~~~
                     |      |             |
                     |      |             (6) region created on stack here
                     |
              <------+
              |
            'pca953x_read_regs': event 7
              |
              |  482 |         u8 regaddr =3D pca953x_recalc_addr(chip, reg=
, 0);
              |      |                      ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~=
~~
              |      |                      |
              |      |                      (7) returning to 'pca953x_read_=
regs' from 'pca953x_recalc_addr'
              |
       <------+
       |
     'pca953x_gpio_set_multiple': events 8-11
       |
       |  606 |         ret =3D pca953x_read_regs(chip, chip->regs->output,=
 reg_val);
       |      |               ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~=
~~~~~~~
       |      |               |
       |      |               (8) returning to 'pca953x_gpio_set_multiple' =
from 'pca953x_read_regs'
       |  607 |         if (ret)
       |      |            ~   =

       |      |            |
       |      |            (9) following 'false' branch (when 'ret =3D=3D 0=
')...
       |......
       |  610 |         bitmap_replace(reg_val, reg_val, bits, mask, gc->ng=
pio);
       |      |         ~~~~~~~~~~~~~~
       |      |         |
       |      |         (10) ...to here
       |  611 | =

       |  612 |         pca953x_write_regs(chip, chip->regs->output, reg_va=
l);
       |      |         ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~=
~~
       |      |         |
       |      |         (11) calling 'pca953x_write_regs' from 'pca953x_gpi=
o_set_multiple'
       |
       +--> 'pca953x_write_regs': events 12-13
              |
              |  462 | static int pca953x_write_regs(struct pca953x_chip *c=
hip, int reg, unsigned long *val)
              |      |            ^~~~~~~~~~~~~~~~~~
              |      |            |
              |      |            (12) entry to 'pca953x_write_regs'
              |  463 | {
              |  464 |         u8 regaddr =3D pca953x_recalc_addr(chip, reg=
, 0);
              |      |                      ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~=
~~
              |      |                      |
              |      |                      (13) calling 'pca953x_recalc_ad=
dr' from 'pca953x_write_regs'
              |
              +--> 'pca953x_recalc_addr': events 14-20
                     |
                     |  421 | static u8 pca953x_recalc_addr(struct pca953x_=
chip *chip, int reg, int off)
                     |      |           ^~~~~~~~~~~~~~~~~~~
                     |      |           |
                     |      |           (14) entry to 'pca953x_recalc_addr'
                     |......
                     |  424 |         int pinctrl;
                     |      |             ~~~~~~~
                     |      |             |
                     |      |             (15) region created on stack here
                     |......
                     |  427 |         if (PCA_CHIP_TYPE(chip->driver_data) =
=3D=3D PCAL653X_TYPE) {
                     |      |            ~
                     |      |            |
                     |      |            (16) following 'true' branch...
                     |......
                     |  431 |                 addr =3D (reg & PCAL_GPIO_MAS=
K) * NBANK(chip);
                     |      |                 ~~~~
                     |      |                 |
                     |      |                 (17) ...to here
                     |  432 | =

                     |  433 |                 switch(reg) {
                     |      |                 ~~~~~~
                     |      |                 |
                     |      |                 (18) following 'default:' bra=
nch...
                     |......
                     |  451 |                 regaddr =3D pinctrl + addr + =
(off / BANK_SZ);
                     |      |                 ~~~~~~~   ~~~~~~~~~~~~~~
                     |      |                 |                 |
                     |      |                 (19) ...to here   (20) use of=
 uninitialized value 'pinctrl' here
                     |
>> drivers/gpio/gpio-pca953x.c:451:35: warning: use of uninitialized value =
'pinctrl' [CWE-457] [-Wanalyzer-use-of-uninitialized-value]
     451 |                 regaddr =3D pinctrl + addr + (off / BANK_SZ);
         |                           ~~~~~~~~^~~~~~
     'device_pca957x_init': events 1-2
       |
       | 1009 | static int device_pca957x_init(struct pca953x_chip *chip, u=
32 invert)
       |      |            ^~~~~~~~~~~~~~~~~~~
       |      |            |
       |      |            (1) entry to 'device_pca957x_init'
       |......
       | 1015 |         ret =3D device_pca95xx_init(chip, invert);
       |      |               ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
       |      |               |
       |      |               (2) calling 'device_pca95xx_init' from 'devic=
e_pca957x_init'
       |
       +--> 'device_pca95xx_init': events 3-4
              |
              |  980 | static int device_pca95xx_init(struct pca953x_chip *=
chip, u32 invert)
              |      |            ^~~~~~~~~~~~~~~~~~~
              |      |            |
              |      |            (3) entry to 'device_pca95xx_init'
              |......
              |  986 |         regaddr =3D pca953x_recalc_addr(chip, chip->=
regs->output, 0);
              |      |                   ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~=
~~~~~~~~~~~~~~
              |      |                   |
              |      |                   (4) calling 'pca953x_recalc_addr' =
from 'device_pca95xx_init'
              |
              +--> 'pca953x_recalc_addr': events 5-6
                     |
                     |  421 | static u8 pca953x_recalc_addr(struct pca953x_=
chip *chip, int reg, int off)
                     |      |           ^~~~~~~~~~~~~~~~~~~
                     |      |           |
                     |      |           (5) entry to 'pca953x_recalc_addr'
                     |......
                     |  424 |         int pinctrl;
                     |      |             ~~~~~~~
                     |      |             |
                     |      |             (6) region created on stack here
                     |
              <------+
              |
            'device_pca95xx_init': events 7-10
              |
              |  986 |         regaddr =3D pca953x_recalc_addr(chip, chip->=
regs->output, 0);
              |      |                   ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~=
~~~~~~~~~~~~~~
              |      |                   |
              |      |                   (7) returning to 'device_pca95xx_i=
nit' from 'pca953x_recalc_addr'
              |......
              |  989 |         if (ret)
              |      |            ~       =

              |      |            |
              |      |            (8) following 'false' branch (when 'ret =
=3D=3D 0')...
              |......
              |  992 |         regaddr =3D pca953x_recalc_addr(chip, chip->=
regs->direction, 0);
              |      |         ~~~~~~~   ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~=
~~~~~~~~~~~~~~~~~
              |      |         |         |
              |      |         |         (10) calling 'pca953x_recalc_addr'=
 from 'device_pca95xx_init'
              |      |         (9) ...to here
              |
              +--> 'pca953x_recalc_addr': events 11-12
                     |
                     |  421 | static u8 pca953x_recalc_addr(struct pca953x_=
chip *chip, int reg, int off)
                     |      |           ^~~~~~~~~~~~~~~~~~~
                     |      |           |
                     |      |           (11) entry to 'pca953x_recalc_addr'
                     |......
                     |  424 |         int pinctrl;
                     |      |             ~~~~~~~
                     |      |             |
                     |      |             (12) region created on stack here
                     |
              <------+
              |
            'device_pca95xx_init': events 13-16
              |
              |  992 |         regaddr =3D pca953x_recalc_addr(chip, chip->=
regs->direction, 0);
              |      |                   ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~=
~~~~~~~~~~~~~~~~~
              |      |                   |
              |      |                   (13) returning to 'device_pca95xx_=
init' from 'pca953x_recalc_addr'
              |......
              |  995 |         if (ret)
              |      |            ~       =

              |      |            |
              |      |            (14) following 'false' branch (when 'ret =
=3D=3D 0')...
              |......
              |  999 |         if (invert)
              |      |         ~~         =

              |      |         |
              |      |         (15) ...to here
              |......
              | 1004 |         ret =3D pca953x_write_regs(chip, chip->regs-=
>invert, val);
              |      |               ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~=
~~~~~~~~~~~
              |      |               |
              |      |               (16) calling 'pca953x_write_regs' from=
 'device_pca95xx_init'
              |
              +--> 'pca953x_write_regs': events 17-18
                     |
                     |  462 | static int pca953x_write_regs(struct pca953x_=
chip *chip, int reg, unsigned long *val)
                     |      |            ^~~~~~~~~~~~~~~~~~
                     |      |            |
                     |      |            (17) entry to 'pca953x_write_regs'
                     |  463 | {
                     |  464 |         u8 regaddr =3D pca953x_recalc_addr(ch=
ip, reg, 0);
                     |      |                      ~~~~~~~~~~~~~~~~~~~~~~~~=
~~~~~~~~~
                     |      |                      |
                     |      |                      (18) calling 'pca953x_re=
calc_addr' from 'pca953x_write_regs'
                     |
                     +--> 'pca953x_recalc_addr': events 19-25
                            |
                            |  421 | static u8 pca953x_recalc_addr(struct p=
ca953x_chip *chip, int reg, int off)
                            |      |           ^~~~~~~~~~~~~~~~~~~
                            |      |           |
                            |      |           (19) entry to 'pca953x_recal=
c_addr'
                            |......
                            |  424 |         int pinctrl;
                            |      |             ~~~~~~~
                            |      |             |
                            |      |             (20) region created on sta=
ck here
                            |......
                            |  427 |         if (PCA_CHIP_TYPE(chip->driver=
_data) =3D=3D PCAL653X_TYPE) {
                            |      |            ~
                            |      |            |
                            |      |            (21) following 'true' branc=
h...
                            |......
                            |  431 |                 addr =3D (reg & PCAL_G=
PIO_MASK) * NBANK(chip);
                            |      |                 ~~~~
                            |      |                 |
                            |      |                 (22) ...to here
                            |  432 | =

                            |  433 |                 switch(reg) {
                            |      |                 ~~~~~~
                            |      |                 |
                            |      |                 (23) following 'defaul=
t:' branch...
                            |......
                            |  451 |                 regaddr =3D pinctrl + =
addr + (off / BANK_SZ);
                            |      |                 ~~~~~~~   ~~~~~~~~~~~~=
~~
                            |      |                 |                 |
                            |      |                 (24) ...to here   (25)=
 use of uninitialized value 'pinctrl' here
                            |
>> drivers/gpio/gpio-pca953x.c:451:35: warning: use of uninitialized value =
'pinctrl' [CWE-457] [-Wanalyzer-use-of-uninitialized-value]
     451 |                 regaddr =3D pinctrl + addr + (off / BANK_SZ);
         |                           ~~~~~~~~^~~~~~
     'pca953x_probe': events 1-12
       |
       | 1032 | static int pca953x_probe(struct i2c_client *client,
       |      |            ^~~~~~~~~~~~~
       |      |            |
       |      |            (1) entry to 'pca953x_probe'
       |......
       | 1044 |         if (chip =3D=3D NULL)
       |      |            ~
       |      |            |
       |      |            (2) following 'false' branch...
       |......
       | 1047 |         pdata =3D dev_get_platdata(&client->dev);
       |      |         ~~~~~
       |      |         |
       |      |         (3) ...to here
       |......
       | 1075 |         if (IS_ERR(reg))
       |      |            ~
       |      |            |
       |      |            (4) following 'false' branch...
       |......
       | 1078 |         ret =3D regulator_enable(reg);
       |      |         ~~~ =

       |      |         |
       |      |         (5) ...to here
       | 1079 |         if (ret) {
       |      |            ~
       |      |            |
       |      |            (6) following 'false' branch (when 'ret =3D=3D 0=
')...
       |......
       | 1083 |         chip->regulator =3D reg;
       |      |         ~~~~
       |      |         |
       |      |         (7) ...to here
       |......
       | 1112 |         if (IS_ERR(chip->regmap)) {
       |      |            ~
       |      |            |
       |      |            (8) following 'false' branch...
       |......
       | 1117 |         regcache_mark_dirty(chip->regmap);
       |      |         ~~~~~~~~~~~~~~~~~~~
       |      |         |
       |      |         (9) ...to here
       |......
       | 1142 |         if (PCA_CHIP_TYPE(chip->driver_data) =3D=3D PCA957X=
_TYPE) {
       |      |            ~
       |      |            |
       |      |            (10) following 'false' branch...
       |......
       | 1146 |                 chip->regs =3D &pca953x_regs;
       |      |                 ~~~~
       |      |                 |
       |      |                 (11) ...to here
       | 1147 |                 ret =3D device_pca95xx_init(chip, invert);
       |      |                       ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
       |      |                       |
       |      |                       (12) calling 'device_pca95xx_init' fr=
om 'pca953x_probe'
       |
       +--> 'device_pca95xx_init': events 13-14
              |
              |  980 | static int device_pca95xx_init(struct pca953x_chip *=
chip, u32 invert)
              |      |            ^~~~~~~~~~~~~~~~~~~
              |      |            |
              |      |            (13) entry to 'device_pca95xx_init'
              |......
              |  986 |         regaddr =3D pca953x_recalc_addr(chip, chip->=
regs->output, 0);
              |      |                   ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~=
~~~~~~~~~~~~~~
              |      |                   |
              |      |                   (14) calling 'pca953x_recalc_addr'=
 from 'device_pca95xx_init'
              |
              +--> 'pca953x_recalc_addr': events 15-16
                     |
                     |  421 | static u8 pca953x_recalc_addr(struct pca953x_=
chip *chip, int reg, int off)
                     |      |           ^~~~~~~~~~~~~~~~~~~
                     |      |           |
                     |      |           (15) entry to 'pca953x_recalc_addr'
                     |......
                     |  424 |         int pinctrl;
                     |      |             ~~~~~~~
                     |      |             |
                     |      |             (16) region created on stack here
                     |
              <------+
              |
            'device_pca95xx_init': events 17-20
              |
              |  986 |         regaddr =3D pca953x_recalc_addr(chip, chip->=
regs->output, 0);
              |      |                   ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~=
~~~~~~~~~~~~~~
              |      |                   |
              |      |                   (17) returning to 'device_pca95xx_=
init' from 'pca953x_recalc_addr'
              |......
              |  989 |         if (ret)
              |      |            ~       =

              |      |            |
              |      |            (18) following 'false' branch (when 'ret =
=3D=3D 0')...
              |......
              |  992 |         regaddr =3D pca953x_recalc_addr(chip, chip->=
regs->direction, 0);
              |      |         ~~~~~~~   ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~=
~~~~~~~~~~~~~~~~~
              |      |         |         |
              |      |         |         (20) calling 'pca953x_recalc_addr'=
 from 'device_pca95xx_init'
              |      |         (19) ...to here
              |
              +--> 'pca953x_recalc_addr': events 21-22
                     |
                     |  421 | static u8 pca953x_recalc_addr(struct pca953x_=
chip *chip, int reg, int off)
                     |      |           ^~~~~~~~~~~~~~~~~~~
                     |      |           |
                     |      |           (21) entry to 'pca953x_recalc_addr'
                     |......
                     |  424 |         int pinctrl;
                     |      |             ~~~~~~~
                     |      |             |
                     |      |             (22) region created on stack here
                     |
              <------+
              |
            'device_pca95xx_init': events 23-26
              |
              |  992 |         regaddr =3D pca953x_recalc_addr(chip, chip->=
regs->direction, 0);
              |      |                   ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~=
~~~~~~~~~~~~~~~~~
              |      |                   |
              |      |                   (23) returning to 'device_pca95xx_=
init' from 'pca953x_recalc_addr'
              |......
              |  995 |         if (ret)
              |      |            ~       =

              |      |            |
              |      |            (24) following 'false' branch (when 'ret =
=3D=3D 0')...
              |......
              |  999 |         if (invert)
              |      |         ~~         =

              |      |         |
              |      |         (25) ...to here
              |......
              | 1004 |         ret =3D pca953x_write_regs(chip, chip->regs-=
>invert, val);
              |      |               ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~=
~~~~~~~~~~~
              |      |               |
              |      |               (26) calling 'pca953x_write_regs' from=
 'device_pca95xx_init'
              |
              +--> 'pca953x_write_regs': events 27-28
                     |
                     |  462 | static int pca953x_write_regs(struct pca953x_=
chip *chip, int reg, unsigned long *val)
                     |      |            ^~~~~~~~~~~~~~~~~~
                     |      |            |
                     |      |            (27) entry to 'pca953x_write_regs'
                     |  463 | {
                     |  464 |         u8 regaddr =3D pca953x_recalc_addr(ch=
ip, reg, 0);
                     |      |                      ~~~~~~~~~~~~~~~~~~~~~~~~=
~~~~~~~~~
                     |      |                      |
                     |      |                      (28) calling 'pca953x_re=
calc_addr' from 'pca953x_write_regs'
                     |
                     +--> 'pca953x_recalc_addr': events 29-35
                            |
                            |  421 | static u8 pca953x_recalc_addr(struct p=
ca953x_chip *chip, int reg, int off)
                            |      |           ^~~~~~~~~~~~~~~~~~~
                            |      |           |
                            |      |           (29) entry to 'pca953x_recal=
c_addr'
                            |......
                            |  424 |         int pinctrl;
                            |      |             ~~~~~~~
                            |      |             |
                            |      |             (30) region created on sta=
ck here
                            |......
                            |  427 |         if (PCA_CHIP_TYPE(chip->driver=
_data) =3D=3D PCAL653X_TYPE) {
                            |      |            ~
                            |      |            |
                            |      |            (31) following 'true' branc=
h...
                            |......
                            |  431 |                 addr =3D (reg & PCAL_G=
PIO_MASK) * NBANK(chip);
                            |      |                 ~~~~
                            |      |                 |
                            |      |                 (32) ...to here
                            |  432 | =

                            |  433 |                 switch(reg) {
                            |      |                 ~~~~~~
                            |      |                 |
                            |      |                 (33) following 'defaul=
t:' branch...
                            |......
                            |  451 |                 regaddr =3D pinctrl + =
addr + (off / BANK_SZ);
                            |      |                 ~~~~~~~   ~~~~~~~~~~~~=
~~
                            |      |                 |                 |
                            |      |                 (34) ...to here   (35)=
 use of uninitialized value 'pinctrl' here
                            |
>> drivers/gpio/gpio-pca953x.c:451:35: warning: use of uninitialized value =
'pinctrl' [CWE-457] [-Wanalyzer-use-of-uninitialized-value]
     451 |                 regaddr =3D pinctrl + addr + (off / BANK_SZ);
         |                           ~~~~~~~~^~~~~~
     'pca953x_probe': events 1-12
       |
       | 1032 | static int pca953x_probe(struct i2c_client *client,
       |      |            ^~~~~~~~~~~~~
       |      |            |
       |      |            (1) entry to 'pca953x_probe'
       |......
       | 1044 |         if (chip =3D=3D NULL)
       |      |            ~
       |      |            |
       |      |            (2) following 'false' branch...
       |......
       | 1047 |         pdata =3D dev_get_platdata(&client->dev);
       |      |         ~~~~~
       |      |         |
       |      |         (3) ...to here
       |......
       | 1075 |         if (IS_ERR(reg))
       |      |            ~
       |      |            |
       |      |            (4) following 'false' branch...
       |......
       | 1078 |         ret =3D regulator_enable(reg);
       |      |         ~~~ =

       |      |         |
       |      |         (5) ...to here
       | 1079 |         if (ret) {
       |      |            ~
       |      |            |
       |      |            (6) following 'false' branch (when 'ret =3D=3D 0=
')...
       |......
       | 1083 |         chip->regulator =3D reg;
       |      |         ~~~~
       |      |         |
       |      |         (7) ...to here
       |......
       | 1112 |         if (IS_ERR(chip->regmap)) {
       |      |            ~
       |      |            |
       |      |            (8) following 'false' branch...
       |......
       | 1117 |         regcache_mark_dirty(chip->regmap);
       |      |         ~~~~~~~~~~~~~~~~~~~
       |      |         |
       |      |         (9) ...to here
       |......
       | 1142 |         if (PCA_CHIP_TYPE(chip->driver_data) =3D=3D PCA957X=
_TYPE) {
       |      |            ~
       |      |            |
       |      |            (10) following 'true' branch...
       | 1143 |                 chip->regs =3D &pca957x_regs;
       |      |                 ~~~~
       |      |                 |
       |      |                 (11) ...to here
       | 1144 |                 ret =3D device_pca957x_init(chip, invert);
       |      |                       ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
       |      |                       |
       |      |                       (12) calling 'device_pca957x_init' fr=
om 'pca953x_probe'
       |
       +--> 'device_pca957x_init': events 13-14
              |
              | 1009 | static int device_pca957x_init(struct pca953x_chip *=
chip, u32 invert)
              |      |            ^~~~~~~~~~~~~~~~~~~
              |      |            |
              |      |            (13) entry to 'device_pca957x_init'
              |......
              | 1015 |         ret =3D device_pca95xx_init(chip, invert);
              |      |               ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
              |      |               |
              |      |               (14) calling 'device_pca95xx_init' fro=
m 'device_pca957x_init'
              |
              +--> 'device_pca95xx_init': events 15-16
                     |
                     |  980 | static int device_pca95xx_init(struct pca953x=
_chip *chip, u32 invert)
                     |      |            ^~~~~~~~~~~~~~~~~~~
                     |      |            |
                     |      |            (15) entry to 'device_pca95xx_init'
                     |......
                     |  986 |         regaddr =3D pca953x_recalc_addr(chip,=
 chip->regs->output, 0);
                     |      |                   ~~~~~~~~~~~~~~~~~~~~~~~~~~~=
~~~~~~~~~~~~~~~~~~~~~
                     |      |                   |
                     |      |                   (16) calling 'pca953x_recal=
c_addr' from 'device_pca95xx_init'
                     |
                     +--> 'pca953x_recalc_addr': events 17-18
                            |
                            |  421 | static u8 pca953x_recalc_addr(struct p=
ca953x_chip *chip, int reg, int off)
                            |      |           ^~~~~~~~~~~~~~~~~~~
                            |      |           |
                            |      |           (17) entry to 'pca953x_recal=
c_addr'
                            |......
                            |  424 |         int pinctrl;
                            |      |             ~~~~~~~
                            |      |             |
                            |      |             (18) region created on sta=
ck here
                            |
                     <------+
                     |
                   'device_pca95xx_init': events 19-22

vim +/pinctrl +451 drivers/gpio/gpio-pca953x.c

49427232764d62 drivers/gpio/gpio-pca953x.c Marek Vasut         2018-12-12  =
420  =

6fdeb6cbe1ef3b drivers/gpio/gpio-pca953x.c Uwe Kleine-K=C3=B6nig    2020-04=
-20  421  static u8 pca953x_recalc_addr(struct pca953x_chip *chip, int reg,=
 int off)
9e60fdcf0c2905 drivers/gpio/pca9539.c      eric miao           2008-02-04  =
422  {
91a124a66bb4c2 drivers/gpio/gpio-pca953x.c Martyn Welch        2022-08-26  =
423  	int addr;
91a124a66bb4c2 drivers/gpio/gpio-pca953x.c Martyn Welch        2022-08-26  =
424  	int pinctrl;
91a124a66bb4c2 drivers/gpio/gpio-pca953x.c Martyn Welch        2022-08-26  =
425  	u8 regaddr;
91a124a66bb4c2 drivers/gpio/gpio-pca953x.c Martyn Welch        2022-08-26  =
426  =

91a124a66bb4c2 drivers/gpio/gpio-pca953x.c Martyn Welch        2022-08-26  =
427  	if (PCA_CHIP_TYPE(chip->driver_data) =3D=3D PCAL653X_TYPE) {
91a124a66bb4c2 drivers/gpio/gpio-pca953x.c Martyn Welch        2022-08-26  =
428  		/* The PCAL6534 and compatible chips have altered bank alignment tha=
t doesn't
91a124a66bb4c2 drivers/gpio/gpio-pca953x.c Martyn Welch        2022-08-26  =
429  		 * fit within the bit shifting scheme used for other devices.
91a124a66bb4c2 drivers/gpio/gpio-pca953x.c Martyn Welch        2022-08-26  =
430  		 */
91a124a66bb4c2 drivers/gpio/gpio-pca953x.c Martyn Welch        2022-08-26  =
431  		addr =3D (reg & PCAL_GPIO_MASK) * NBANK(chip);
91a124a66bb4c2 drivers/gpio/gpio-pca953x.c Martyn Welch        2022-08-26  =
432  =

91a124a66bb4c2 drivers/gpio/gpio-pca953x.c Martyn Welch        2022-08-26  =
433  		switch(reg) {
91a124a66bb4c2 drivers/gpio/gpio-pca953x.c Martyn Welch        2022-08-26  =
434  		case PCAL953X_OUT_STRENGTH:
91a124a66bb4c2 drivers/gpio/gpio-pca953x.c Martyn Welch        2022-08-26  =
435  		case PCAL953X_IN_LATCH:
91a124a66bb4c2 drivers/gpio/gpio-pca953x.c Martyn Welch        2022-08-26  =
436  		case PCAL953X_PULL_EN:
91a124a66bb4c2 drivers/gpio/gpio-pca953x.c Martyn Welch        2022-08-26  =
437  		case PCAL953X_PULL_SEL:
91a124a66bb4c2 drivers/gpio/gpio-pca953x.c Martyn Welch        2022-08-26  =
438  		case PCAL953X_INT_MASK:
91a124a66bb4c2 drivers/gpio/gpio-pca953x.c Martyn Welch        2022-08-26  =
439  		case PCAL953X_INT_STAT:
91a124a66bb4c2 drivers/gpio/gpio-pca953x.c Martyn Welch        2022-08-26  =
440  		case PCAL953X_OUT_CONF:
91a124a66bb4c2 drivers/gpio/gpio-pca953x.c Martyn Welch        2022-08-26  =
441  			pinctrl =3D ((reg & PCAL_PINCTRL_MASK) >> 1) + 0x20;
91a124a66bb4c2 drivers/gpio/gpio-pca953x.c Martyn Welch        2022-08-26  =
442  			break;
91a124a66bb4c2 drivers/gpio/gpio-pca953x.c Martyn Welch        2022-08-26  =
443  		case PCAL6524_INT_EDGE:
91a124a66bb4c2 drivers/gpio/gpio-pca953x.c Martyn Welch        2022-08-26  =
444  		case PCAL6524_INT_CLR:
91a124a66bb4c2 drivers/gpio/gpio-pca953x.c Martyn Welch        2022-08-26  =
445  		case PCAL6524_IN_STATUS:
91a124a66bb4c2 drivers/gpio/gpio-pca953x.c Martyn Welch        2022-08-26  =
446  		case PCAL6524_OUT_INDCONF:
91a124a66bb4c2 drivers/gpio/gpio-pca953x.c Martyn Welch        2022-08-26  =
447  		case PCAL6524_DEBOUNCE:
91a124a66bb4c2 drivers/gpio/gpio-pca953x.c Martyn Welch        2022-08-26  =
448  			pinctrl =3D ((reg & PCAL_PINCTRL_MASK) >> 1) + 0x1c;
91a124a66bb4c2 drivers/gpio/gpio-pca953x.c Martyn Welch        2022-08-26  =
449  			break;
91a124a66bb4c2 drivers/gpio/gpio-pca953x.c Martyn Welch        2022-08-26  =
450  		}
91a124a66bb4c2 drivers/gpio/gpio-pca953x.c Martyn Welch        2022-08-26 @=
451  		regaddr =3D pinctrl + addr + (off / BANK_SZ);
91a124a66bb4c2 drivers/gpio/gpio-pca953x.c Martyn Welch        2022-08-26  =
452  	} else {
b32cecb46bdc8b drivers/gpio/gpio-pca953x.c Marek Vasut         2018-12-12  =
453  		int bank_shift =3D pca953x_bank_shift(chip);
91a124a66bb4c2 drivers/gpio/gpio-pca953x.c Martyn Welch        2022-08-26  =
454  		addr =3D (reg & PCAL_GPIO_MASK) << bank_shift;
91a124a66bb4c2 drivers/gpio/gpio-pca953x.c Martyn Welch        2022-08-26  =
455  		pinctrl =3D (reg & PCAL_PINCTRL_MASK) << 1;
91a124a66bb4c2 drivers/gpio/gpio-pca953x.c Martyn Welch        2022-08-26  =
456  		regaddr =3D pinctrl | addr | (off / BANK_SZ);
91a124a66bb4c2 drivers/gpio/gpio-pca953x.c Martyn Welch        2022-08-26  =
457  	}
9e60fdcf0c2905 drivers/gpio/pca9539.c      eric miao           2008-02-04  =
458  =

b32cecb46bdc8b drivers/gpio/gpio-pca953x.c Marek Vasut         2018-12-12  =
459  	return regaddr;
c6e3cf01d31d88 drivers/gpio/gpio-pca953x.c Bartosz Golaszewski 2016-09-09  =
460  }
c6e3cf01d31d88 drivers/gpio/gpio-pca953x.c Bartosz Golaszewski 2016-09-09  =
461  =


-- =

0-DAY CI Kernel Test Service
https://01.org/lkp
--===============0097225126710966214==--

