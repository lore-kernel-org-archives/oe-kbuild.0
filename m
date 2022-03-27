Content-Type: multipart/mixed; boundary="===============0939118386830650403=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: drivers/gpio/gpio-tqmx86.c:318:27: warning: Access to field 'domain' results in a dereference of an undefined pointer value (loaded from variable 'girq') [clang-analyzer-core.NullDereference]
Date: Mon, 28 Mar 2022 06:21:17 +0800
Message-ID: <202203280622.pdklJVVE-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============0939118386830650403==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

CC: llvm(a)lists.linux.dev
CC: kbuild-all(a)lists.01.org
BCC: lkp(a)intel.com
CC: linux-kernel(a)vger.kernel.org
TO: Marc Zyngier <maz@kernel.org>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git =
master
head:   7001052160d172f6de06adeffde24dde9935ece8
commit: 924610607f191bee4379bc3775b0fd025ad7e922 gpio: tpmx86: Move PM devi=
ce over to irq domain
date:   7 weeks ago
:::::: branch date: 5 hours ago
:::::: commit date: 7 weeks ago
config: riscv-randconfig-c006-20220323 (https://download.01.org/0day-ci/arc=
hive/20220328/202203280622.pdklJVVE-lkp(a)intel.com/config)
compiler: clang version 15.0.0 (https://github.com/llvm/llvm-project 902f47=
08fe1d03b0de7e5315ef875006a6adc319)
reproduce (this is a W=3D1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/=
make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # install riscv cross compiling tool for clang build
        # apt-get install binutils-riscv64-linux-gnu
        # https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.gi=
t/commit/?id=3D924610607f191bee4379bc3775b0fd025ad7e922
        git remote add linus https://git.kernel.org/pub/scm/linux/kernel/gi=
t/torvalds/linux.git
        git fetch --no-tags linus master
        git checkout 924610607f191bee4379bc3775b0fd025ad7e922
        # save the config file to linux build tree
        COMPILER_INSTALL_PATH=3D$HOME/0day COMPILER=3Dclang make.cross ARCH=
=3Driscv clang-analyzer =


If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>


clang-analyzer warnings: (new ones prefixed by >>)
           ^
   drivers/misc/cardreader/rtsx_usb.c:308:9: note: Calling 'rtsx_usb_get_st=
atus_with_bulk'
                   ret =3D rtsx_usb_get_status_with_bulk(ucr, status);
                         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/misc/cardreader/rtsx_usb.c:273:6: note: 'ret' is 0
           if (ret)
               ^~~
   drivers/misc/cardreader/rtsx_usb.c:273:2: note: Taking false branch
           if (ret)
           ^
   drivers/misc/cardreader/rtsx_usb.c:277:6: note: Assuming 'ret' is not eq=
ual to 0
           if (ret)
               ^~~
   drivers/misc/cardreader/rtsx_usb.c:277:2: note: Taking true branch
           if (ret)
           ^
   drivers/misc/cardreader/rtsx_usb.c:278:3: note: Returning without writin=
g to '*status'
                   return ret;
                   ^
   drivers/misc/cardreader/rtsx_usb.c:308:9: note: Returning from 'rtsx_usb=
_get_status_with_bulk'
                   ret =3D rtsx_usb_get_status_with_bulk(ucr, status);
                         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/misc/cardreader/rtsx_usb.c:312:6: note: Assuming 'ret' is >=3D 0
           if (ret < 0)
               ^~~~~~~
   drivers/misc/cardreader/rtsx_usb.c:312:2: note: Taking false branch
           if (ret < 0)
           ^
   drivers/misc/cardreader/rtsx_usb.c:315:2: note: Returning without writin=
g to '*'
           return 0;
           ^
   drivers/misc/cardreader/rtsx_usb.c:315:2: note: Returning zero, which pa=
rticipates in a condition later
           return 0;
           ^~~~~~~~
   drivers/misc/cardreader/rtsx_usb.c:497:8: note: Returning from 'rtsx_usb=
_get_card_status'
           ret =3D rtsx_usb_get_card_status(ucr, &val);
                 ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/misc/cardreader/rtsx_usb.c:502:6: note: 'ret' is 0
           if (ret)
               ^~~
   drivers/misc/cardreader/rtsx_usb.c:502:2: note: Taking false branch
           if (ret)
           ^
   drivers/misc/cardreader/rtsx_usb.c:505:10: note: The left operand of '&'=
 is a garbage value
           if (val & cd_mask[card])
               ~~~ ^
   Suppressed 7 warnings (7 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   6 warnings generated.
   Suppressed 6 warnings (6 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   7 warnings generated.
   Suppressed 7 warnings (7 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   7 warnings generated.
   Suppressed 7 warnings (7 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   7 warnings generated.
   Suppressed 7 warnings (7 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   7 warnings generated.
   Suppressed 7 warnings (7 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   7 warnings generated.
   Suppressed 7 warnings (7 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   7 warnings generated.
   Suppressed 7 warnings (7 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   7 warnings generated.
   Suppressed 7 warnings (7 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   7 warnings generated.
   Suppressed 7 warnings (7 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   7 warnings generated.
   Suppressed 7 warnings (7 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   7 warnings generated.
   Suppressed 7 warnings (7 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   7 warnings generated.
   Suppressed 7 warnings (7 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   7 warnings generated.
   Suppressed 7 warnings (7 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   7 warnings generated.
   Suppressed 7 warnings (7 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   7 warnings generated.
   Suppressed 7 warnings (7 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   7 warnings generated.
   Suppressed 7 warnings (7 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   7 warnings generated.
   Suppressed 7 warnings (7 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   8 warnings generated.
>> drivers/gpio/gpio-tqmx86.c:318:27: warning: Access to field 'domain' res=
ults in a dereference of an undefined pointer value (loaded from variable '=
girq') [clang-analyzer-core.NullDereference]
           irq_domain_set_pm_device(girq->domain, dev);
                                    ^~~~
   drivers/gpio/gpio-tqmx86.c:234:2: note: 'girq' declared without an initi=
al value
           struct gpio_irq_chip *girq;
           ^~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/gpio/gpio-tqmx86.c:240:6: note: Assuming 'irq' is >=3D 0
           if (irq < 0 && irq !=3D -ENXIO)
               ^~~~~~~
   drivers/gpio/gpio-tqmx86.c:240:14: note: Left side of '&&' is false
           if (irq < 0 && irq !=3D -ENXIO)
                       ^
   drivers/gpio/gpio-tqmx86.c:244:6: note: Assuming 'res' is non-null
           if (!res) {
               ^~~~
   drivers/gpio/gpio-tqmx86.c:244:2: note: Taking false branch
           if (!res) {
           ^
   drivers/gpio/gpio-tqmx86.c:250:6: note: Assuming 'io_base' is non-null
           if (!io_base)
               ^~~~~~~~
   drivers/gpio/gpio-tqmx86.c:250:2: note: Taking false branch
           if (!io_base)
           ^
   drivers/gpio/gpio-tqmx86.c:254:6: note: Assuming 'gpio' is non-null
           if (!gpio)
               ^~~~~
   drivers/gpio/gpio-tqmx86.c:254:2: note: Taking false branch
           if (!gpio)
           ^
   drivers/gpio/gpio-tqmx86.c:257:2: note: Loop condition is false.  Exitin=
g loop
           raw_spin_lock_init(&gpio->spinlock);
           ^
   include/linux/spinlock.h:111:2: note: expanded from macro 'raw_spin_lock=
_init'
           do { *(lock) =3D __RAW_SPIN_LOCK_UNLOCKED(lock); } while (0)
           ^
   drivers/gpio/gpio-tqmx86.c:279:6: note: Assuming 'irq' is <=3D 0
           if (irq > 0) {
               ^~~~~~~
   drivers/gpio/gpio-tqmx86.c:279:2: note: Taking false branch
           if (irq > 0) {
           ^
   drivers/gpio/gpio-tqmx86.c:313:6: note: Assuming 'ret' is 0
           if (ret) {
               ^~~
   drivers/gpio/gpio-tqmx86.c:313:2: note: Taking false branch
           if (ret) {
           ^
   drivers/gpio/gpio-tqmx86.c:318:27: note: Access to field 'domain' result=
s in a dereference of an undefined pointer value (loaded from variable 'gir=
q')
           irq_domain_set_pm_device(girq->domain, dev);
                                    ^~~~
   Suppressed 7 warnings (7 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   7 warnings generated.
   Suppressed 7 warnings (7 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   7 warnings generated.
   Suppressed 7 warnings (7 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   7 warnings generated.
   Suppressed 7 warnings (7 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   7 warnings generated.
   Suppressed 7 warnings (7 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   7 warnings generated.
   Suppressed 7 warnings (7 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   8 warnings generated.
   include/linux/log2.h:57:13: warning: The result of the left shift is und=
efined due to shifting by '32', which is greater or equal to the width of t=
ype 'unsigned long' [clang-analyzer-core.UndefinedBinaryOperatorResult]
           return 1UL << fls_long(n - 1);
                      ^
   drivers/input/evdev.c:473:25: note: Calling 'evdev_compute_buffer_size'
           unsigned int bufsize =3D evdev_compute_buffer_size(evdev->handle=
.dev);
                                  ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~=
~~~
   drivers/input/evdev.c:464:3: note: Assuming '__UNIQUE_ID___x236' is > '_=
_UNIQUE_ID___y237'
                   max(dev->hint_events_per_packet * EVDEV_BUF_PACKETS,
                   ^
   include/linux/minmax.h:52:19: note: expanded from macro 'max'
   #define max(x, y)       __careful_cmp(x, y, >)
                           ^~~~~~~~~~~~~~~~~~~~~~
   include/linux/minmax.h:38:3: note: expanded from macro '__careful_cmp'
                   __cmp_once(x, y, __UNIQUE_ID(__x), __UNIQUE_ID(__y), op))
                   ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/minmax.h:33:3: note: expanded from macro '__cmp_once'
                   __cmp(unique_x, unique_y, op); })
                   ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/minmax.h:28:26: note: expanded from macro '__cmp'
   #define __cmp(x, y, op) ((x) op (y) ? (x) : (y))
                            ^~~~~~~~~~
   drivers/input/evdev.c:464:3: note: '?' condition is true
                   max(dev->hint_events_per_packet * EVDEV_BUF_PACKETS,
                   ^
   include/linux/minmax.h:52:19: note: expanded from macro 'max'
   #define max(x, y)       __careful_cmp(x, y, >)
                           ^
   include/linux/minmax.h:38:3: note: expanded from macro '__careful_cmp'
                   __cmp_once(x, y, __UNIQUE_ID(__x), __UNIQUE_ID(__y), op))
                   ^
   include/linux/minmax.h:33:3: note: expanded from macro '__cmp_once'
                   __cmp(unique_x, unique_y, op); })

vim +318 drivers/gpio/gpio-tqmx86.c

5fbe5b5883f847 Linus Walleij     2019-09-04  228  =

b868db94a6a704 Andrew Lunn       2019-01-25  229  static int tqmx86_gpio_pr=
obe(struct platform_device *pdev)
b868db94a6a704 Andrew Lunn       2019-01-25  230  {
b868db94a6a704 Andrew Lunn       2019-01-25  231  	struct device *dev =3D &=
pdev->dev;
b868db94a6a704 Andrew Lunn       2019-01-25  232  	struct tqmx86_gpio_data =
*gpio;
b868db94a6a704 Andrew Lunn       2019-01-25  233  	struct gpio_chip *chip;
74639d66e1ec06 Linus Walleij     2019-08-09  234  	struct gpio_irq_chip *gi=
rq;
b868db94a6a704 Andrew Lunn       2019-01-25  235  	void __iomem *io_base;
b868db94a6a704 Andrew Lunn       2019-01-25  236  	struct resource *res;
b868db94a6a704 Andrew Lunn       2019-01-25  237  	int ret, irq;
b868db94a6a704 Andrew Lunn       2019-01-25  238  =

9b87f43537acfa Matthias Schiffer 2021-07-16  239  	irq =3D platform_get_irq=
_optional(pdev, 0);
9b87f43537acfa Matthias Schiffer 2021-07-16  240  	if (irq < 0 && irq !=3D =
-ENXIO)
b868db94a6a704 Andrew Lunn       2019-01-25  241  		return irq;
b868db94a6a704 Andrew Lunn       2019-01-25  242  =

b868db94a6a704 Andrew Lunn       2019-01-25  243  	res =3D platform_get_res=
ource(pdev, IORESOURCE_IO, 0);
b868db94a6a704 Andrew Lunn       2019-01-25  244  	if (!res) {
b868db94a6a704 Andrew Lunn       2019-01-25  245  		dev_err(&pdev->dev, "Ca=
nnot get I/O\n");
b868db94a6a704 Andrew Lunn       2019-01-25  246  		return -ENODEV;
b868db94a6a704 Andrew Lunn       2019-01-25  247  	}
b868db94a6a704 Andrew Lunn       2019-01-25  248  =

b868db94a6a704 Andrew Lunn       2019-01-25  249  	io_base =3D devm_ioport_=
map(&pdev->dev, res->start, resource_size(res));
b868db94a6a704 Andrew Lunn       2019-01-25  250  	if (!io_base)
b868db94a6a704 Andrew Lunn       2019-01-25  251  		return -ENOMEM;
b868db94a6a704 Andrew Lunn       2019-01-25  252  =

b868db94a6a704 Andrew Lunn       2019-01-25  253  	gpio =3D devm_kzalloc(de=
v, sizeof(*gpio), GFP_KERNEL);
b868db94a6a704 Andrew Lunn       2019-01-25  254  	if (!gpio)
b868db94a6a704 Andrew Lunn       2019-01-25  255  		return -ENOMEM;
b868db94a6a704 Andrew Lunn       2019-01-25  256  =

b868db94a6a704 Andrew Lunn       2019-01-25  257  	raw_spin_lock_init(&gpio=
->spinlock);
b868db94a6a704 Andrew Lunn       2019-01-25  258  	gpio->io_base =3D io_bas=
e;
b868db94a6a704 Andrew Lunn       2019-01-25  259  =

b868db94a6a704 Andrew Lunn       2019-01-25  260  	tqmx86_gpio_write(gpio, =
(u8)~TQMX86_DIR_INPUT_MASK, TQMX86_GPIODD);
b868db94a6a704 Andrew Lunn       2019-01-25  261  =

b868db94a6a704 Andrew Lunn       2019-01-25  262  	platform_set_drvdata(pde=
v, gpio);
b868db94a6a704 Andrew Lunn       2019-01-25  263  =

b868db94a6a704 Andrew Lunn       2019-01-25  264  	chip =3D &gpio->chip;
b868db94a6a704 Andrew Lunn       2019-01-25  265  	chip->label =3D "gpio-tq=
mx86";
b868db94a6a704 Andrew Lunn       2019-01-25  266  	chip->owner =3D THIS_MOD=
ULE;
b868db94a6a704 Andrew Lunn       2019-01-25  267  	chip->can_sleep =3D fals=
e;
b868db94a6a704 Andrew Lunn       2019-01-25  268  	chip->base =3D -1;
b868db94a6a704 Andrew Lunn       2019-01-25  269  	chip->direction_input =
=3D tqmx86_gpio_direction_input;
b868db94a6a704 Andrew Lunn       2019-01-25  270  	chip->direction_output =
=3D tqmx86_gpio_direction_output;
b868db94a6a704 Andrew Lunn       2019-01-25  271  	chip->get_direction =3D =
tqmx86_gpio_get_direction;
b868db94a6a704 Andrew Lunn       2019-01-25  272  	chip->get =3D tqmx86_gpi=
o_get;
b868db94a6a704 Andrew Lunn       2019-01-25  273  	chip->set =3D tqmx86_gpi=
o_set;
b868db94a6a704 Andrew Lunn       2019-01-25  274  	chip->ngpio =3D TQMX86_N=
GPIO;
b868db94a6a704 Andrew Lunn       2019-01-25  275  	chip->parent =3D pdev->d=
ev.parent;
b868db94a6a704 Andrew Lunn       2019-01-25  276  =

b868db94a6a704 Andrew Lunn       2019-01-25  277  	pm_runtime_enable(&pdev-=
>dev);
b868db94a6a704 Andrew Lunn       2019-01-25  278  =

9b87f43537acfa Matthias Schiffer 2021-07-16  279  	if (irq > 0) {
b868db94a6a704 Andrew Lunn       2019-01-25  280  		struct irq_chip *irq_ch=
ip =3D &gpio->irq_chip;
b868db94a6a704 Andrew Lunn       2019-01-25  281  		u8 irq_status;
b868db94a6a704 Andrew Lunn       2019-01-25  282  =

b868db94a6a704 Andrew Lunn       2019-01-25  283  		irq_chip->name =3D chip=
->label;
b868db94a6a704 Andrew Lunn       2019-01-25  284  		irq_chip->irq_mask =3D =
tqmx86_gpio_irq_mask;
b868db94a6a704 Andrew Lunn       2019-01-25  285  		irq_chip->irq_unmask =
=3D tqmx86_gpio_irq_unmask;
b868db94a6a704 Andrew Lunn       2019-01-25  286  		irq_chip->irq_set_type =
=3D tqmx86_gpio_irq_set_type;
b868db94a6a704 Andrew Lunn       2019-01-25  287  =

b868db94a6a704 Andrew Lunn       2019-01-25  288  		/* Mask all interrupts =
*/
b868db94a6a704 Andrew Lunn       2019-01-25  289  		tqmx86_gpio_write(gpio,=
 0, TQMX86_GPIIC);
b868db94a6a704 Andrew Lunn       2019-01-25  290  =

b868db94a6a704 Andrew Lunn       2019-01-25  291  		/* Clear all pending in=
terrupts */
b868db94a6a704 Andrew Lunn       2019-01-25  292  		irq_status =3D tqmx86_g=
pio_read(gpio, TQMX86_GPIIS);
b868db94a6a704 Andrew Lunn       2019-01-25  293  		tqmx86_gpio_write(gpio,=
 irq_status, TQMX86_GPIIS);
b868db94a6a704 Andrew Lunn       2019-01-25  294  =

74639d66e1ec06 Linus Walleij     2019-08-09  295  		girq =3D &chip->irq;
74639d66e1ec06 Linus Walleij     2019-08-09  296  		girq->chip =3D irq_chip;
74639d66e1ec06 Linus Walleij     2019-08-09  297  		girq->parent_handler =
=3D tqmx86_gpio_irq_handler;
74639d66e1ec06 Linus Walleij     2019-08-09  298  		girq->num_parents =3D 1;
74639d66e1ec06 Linus Walleij     2019-08-09  299  		girq->parents =3D devm_=
kcalloc(&pdev->dev, 1,
74639d66e1ec06 Linus Walleij     2019-08-09  300  					     sizeof(*girq->p=
arents),
74639d66e1ec06 Linus Walleij     2019-08-09  301  					     GFP_KERNEL);
74639d66e1ec06 Linus Walleij     2019-08-09  302  		if (!girq->parents) {
74639d66e1ec06 Linus Walleij     2019-08-09  303  			ret =3D -ENOMEM;
96be65d12d792b Wei Yongjun       2019-02-01  304  			goto out_pm_dis;
b868db94a6a704 Andrew Lunn       2019-01-25  305  		}
74639d66e1ec06 Linus Walleij     2019-08-09  306  		girq->parents[0] =3D ir=
q;
74639d66e1ec06 Linus Walleij     2019-08-09  307  		girq->default_type =3D =
IRQ_TYPE_NONE;
74639d66e1ec06 Linus Walleij     2019-08-09  308  		girq->handler =3D handl=
e_simple_irq;
5fbe5b5883f847 Linus Walleij     2019-09-04  309  		girq->init_valid_mask =
=3D tqmx86_init_irq_valid_mask;
74639d66e1ec06 Linus Walleij     2019-08-09  310  	}
b868db94a6a704 Andrew Lunn       2019-01-25  311  =

74639d66e1ec06 Linus Walleij     2019-08-09  312  	ret =3D devm_gpiochip_ad=
d_data(dev, chip, gpio);
74639d66e1ec06 Linus Walleij     2019-08-09  313  	if (ret) {
74639d66e1ec06 Linus Walleij     2019-08-09  314  		dev_err(dev, "Could not=
 register GPIO chip\n");
74639d66e1ec06 Linus Walleij     2019-08-09  315  		goto out_pm_dis;
b868db94a6a704 Andrew Lunn       2019-01-25  316  	}
b868db94a6a704 Andrew Lunn       2019-01-25  317  =

924610607f191b Marc Zyngier      2022-02-01 @318  	irq_domain_set_pm_device=
(girq->domain, dev);
924610607f191b Marc Zyngier      2022-02-01  319  =

b868db94a6a704 Andrew Lunn       2019-01-25  320  	dev_info(dev, "GPIO func=
tionality initialized with %d pins\n",
b868db94a6a704 Andrew Lunn       2019-01-25  321  		 chip->ngpio);
b868db94a6a704 Andrew Lunn       2019-01-25  322  =

b868db94a6a704 Andrew Lunn       2019-01-25  323  	return 0;
b868db94a6a704 Andrew Lunn       2019-01-25  324  =

b868db94a6a704 Andrew Lunn       2019-01-25  325  out_pm_dis:
b868db94a6a704 Andrew Lunn       2019-01-25  326  	pm_runtime_disable(&pdev=
->dev);
b868db94a6a704 Andrew Lunn       2019-01-25  327  =

b868db94a6a704 Andrew Lunn       2019-01-25  328  	return ret;
b868db94a6a704 Andrew Lunn       2019-01-25  329  }
b868db94a6a704 Andrew Lunn       2019-01-25  330  =


-- =

0-DAY CI Kernel Test Service
https://01.org/lkp
--===============0939118386830650403==--

