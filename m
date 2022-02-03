Content-Type: multipart/mixed; boundary="===============1054010757810675291=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: Re: [PATCH 09/12] gpio: tpmx86: Move PM device over to irq domain
Date: Thu, 03 Feb 2022 22:06:02 +0800
Message-ID: <202202031546.sh6HZWFF-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============1054010757810675291==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

CC: llvm(a)lists.linux.dev
CC: kbuild-all(a)lists.01.org
In-Reply-To: <20220201120310.878267-10-maz@kernel.org>
References: <20220201120310.878267-10-maz@kernel.org>
TO: Marc Zyngier <maz@kernel.org>

Hi Marc,

I love your patch! Perhaps something to improve:

[auto build test WARNING on linusw-pinctrl/devel]
[also build test WARNING on v5.17-rc2 next-20220202]
[cannot apply to tip/irq/core linusw-gpio/for-next]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch]

url:    https://github.com/0day-ci/linux/commits/Marc-Zyngier/genirq-Move-i=
rqchip-runtime-PM-over-to-irq-domain/20220201-202124
base:   https://git.kernel.org/pub/scm/linux/kernel/git/linusw/linux-pinctr=
l.git devel
:::::: branch date: 2 days ago
:::::: commit date: 2 days ago
config: riscv-randconfig-c006-20220201 (https://download.01.org/0day-ci/arc=
hive/20220203/202202031546.sh6HZWFF-lkp(a)intel.com/config)
compiler: clang version 14.0.0 (https://github.com/llvm/llvm-project 6b1e84=
4b69f15bb7dffaf9365cd2b355d2eb7579)
reproduce (this is a W=3D1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/=
make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # install riscv cross compiling tool for clang build
        # apt-get install binutils-riscv64-linux-gnu
        # https://github.com/0day-ci/linux/commit/1c989f3d9b5302895c7b31b2c=
2462d2096b39231
        git remote add linux-review https://github.com/0day-ci/linux
        git fetch --no-tags linux-review Marc-Zyngier/genirq-Move-irqchip-r=
untime-PM-over-to-irq-domain/20220201-202124
        git checkout 1c989f3d9b5302895c7b31b2c2462d2096b39231
        # save the config file to linux build tree
        COMPILER_INSTALL_PATH=3D$HOME/0day COMPILER=3Dclang make.cross ARCH=
=3Driscv clang-analyzer =


If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>


clang-analyzer warnings: (new ones prefixed by >>)
           return __d_entry_type(dentry) =3D=3D DCACHE_DIRECTORY_TYPE;
                                 ^~~~~~
   include/linux/dcache.h:400:9: note: Calling '__d_entry_type'
           return __d_entry_type(dentry) =3D=3D DCACHE_DIRECTORY_TYPE;
                  ^~~~~~~~~~~~~~~~~~~~~~
   include/linux/dcache.h:385:9: note: Access to field 'd_flags' results in=
 a dereference of a null pointer (loaded from variable 'dentry')
           return dentry->d_flags & DCACHE_ENTRY_TYPE;
                  ^~~~~~
   Suppressed 4 warnings (4 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   2 warnings generated.
   Suppressed 2 warnings (2 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   4 warnings generated.
   kernel/locking/locktorture.c:749:17: warning: Dereference of null pointe=
r [clang-analyzer-core.NullDereference]
                   if (data_race(statp[i].n_lock_fail))
                                 ^
   kernel/locking/locktorture.c:818:2: note: Assuming 'verbose' is 0
           VERBOSE_TOROUT_STRING("lock_torture_stats task started");
           ^
   include/linux/torture.h:36:6: note: expanded from macro 'VERBOSE_TOROUT_=
STRING'
           if (verbose) {                                                  =
        \
               ^~~~~~~
   kernel/locking/locktorture.c:818:2: note: Taking false branch
           VERBOSE_TOROUT_STRING("lock_torture_stats task started");
           ^
   include/linux/torture.h:36:2: note: expanded from macro 'VERBOSE_TOROUT_=
STRING'
           if (verbose) {                                                  =
        \
           ^
   kernel/locking/locktorture.c:818:2: note: Loop condition is false.  Exit=
ing loop
           VERBOSE_TOROUT_STRING("lock_torture_stats task started");
           ^
   include/linux/torture.h:34:34: note: expanded from macro 'VERBOSE_TOROUT=
_STRING'
   #define VERBOSE_TOROUT_STRING(s) \
                                    ^
   kernel/locking/locktorture.c:821:3: note: Calling 'lock_torture_stats_pr=
int'
                   lock_torture_stats_print();
                   ^~~~~~~~~~~~~~~~~~~~~~~~~~
   kernel/locking/locktorture.c:781:6: note: Assuming field 'readlock' is n=
ull
           if (cxt.cur_ops->readlock)
               ^~~~~~~~~~~~~~~~~~~~~
   kernel/locking/locktorture.c:781:2: note: Taking false branch
           if (cxt.cur_ops->readlock)
           ^
   kernel/locking/locktorture.c:784:8: note: Calling 'kmalloc'
           buf =3D kmalloc(size, GFP_KERNEL);
                 ^~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/slab.h:569:2: note: Taking false branch
           if (__builtin_constant_p(size)) {
           ^
   include/linux/slab.h:586:9: note: Value assigned to 'cxt.lwsa'
           return __kmalloc(size, flags);
                  ^~~~~~~~~~~~~~~~~~~~~~
   include/linux/slab.h:586:2: note: Returning pointer, which participates =
in a condition later
           return __kmalloc(size, flags);
           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   kernel/locking/locktorture.c:784:8: note: Returning from 'kmalloc'
           buf =3D kmalloc(size, GFP_KERNEL);
                 ^~~~~~~~~~~~~~~~~~~~~~~~~
   kernel/locking/locktorture.c:785:6: note: Assuming 'buf' is non-null
           if (!buf) {
               ^~~~
   kernel/locking/locktorture.c:785:2: note: Taking false branch
           if (!buf) {
           ^
   kernel/locking/locktorture.c:791:29: note: Passing value via 2nd paramet=
er 'statp'
           __torture_print_stats(buf, cxt.lwsa, true);
                                      ^~~~~~~~
   kernel/locking/locktorture.c:791:2: note: Calling '__torture_print_stats'
           __torture_print_stats(buf, cxt.lwsa, true);
           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   kernel/locking/locktorture.c:744:22: note: Assuming 'statp' is null
           long max =3D 0, min =3D statp ? data_race(statp[0].n_lock_acquir=
ed) : 0;
                               ^~~~~
   kernel/locking/locktorture.c:744:22: note: '?' condition is false
   kernel/locking/locktorture.c:747:13: note: 'write' is true
           n_stress =3D write ? cxt.nrealwriters_stress : cxt.nrealreaders_=
stress;
                      ^~~~~
   kernel/locking/locktorture.c:747:13: note: '?' condition is true
   kernel/locking/locktorture.c:748:14: note: Assuming 'i' is < 'n_stress'
           for (i =3D 0; i < n_stress; i++) {
                       ^~~~~~~~~~~~
   kernel/locking/locktorture.c:748:2: note: Loop condition is true.  Enter=
ing loop body
           for (i =3D 0; i < n_stress; i++) {
           ^
   kernel/locking/locktorture.c:749:17: note: Dereference of null pointer
                   if (data_race(statp[i].n_lock_fail))
                                 ^
   include/linux/compiler.h:218:3: note: expanded from macro 'data_race'
                   expr;                                                   \
                   ^~~~
   kernel/locking/locktorture.c:758:2: warning: Value stored to 'page' is n=
ever read [clang-analyzer-deadcode.DeadStores]
           page +=3D sprintf(page,
           ^       ~~~~~~~~~~~~~
   kernel/locking/locktorture.c:758:2: note: Value stored to 'page' is neve=
r read
           page +=3D sprintf(page,
           ^       ~~~~~~~~~~~~~
   Suppressed 2 warnings (2 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   3 warnings generated.
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
   include/linux/spinlock.h:102:39: note: expanded from macro 'raw_spin_loc=
k_init'
   # define raw_spin_lock_init(lock)                                       \
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
   Suppressed 2 warnings (2 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   2 warnings generated.
   Suppressed 2 warnings (2 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   2 warnings generated.
   Suppressed 2 warnings (2 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   2 warnings generated.
   Suppressed 2 warnings (2 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   2 warnings generated.
   Suppressed 2 warnings (2 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   2 warnings generated.
   Suppressed 2 warnings (2 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   2 warnings generated.
   Suppressed 2 warnings (2 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   3 warnings generated.
   Suppressed 3 warnings (3 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   3 warnings generated.
   Suppressed 3 warnings (3 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   3 warnings generated.
   Suppressed 3 warnings (3 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   5 warnings generated.
   fs/ext4/fast_commit.c:1623:2: warning: Value stored to 'ret' is never re=
ad [clang-analyzer-deadcode.DeadStores]
           ret =3D ext4_fc_record_modified_inode(sb, inode->i_ino);
           ^     ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   fs/ext4/fast_commit.c:1623:2: note: Value stored to 'ret' is never read
           ret =3D ext4_fc_record_modified_inode(sb, inode->i_ino);
           ^     ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   fs/ext4/fast_commit.c:1748:2: warning: Value stored to 'ret' is never re=
ad [clang-analyzer-deadcode.DeadStores]
           ret =3D ext4_fc_record_modified_inode(sb, inode->i_ino);
           ^     ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   fs/ext4/fast_commit.c:1748:2: note: Value stored to 'ret' is never read
           ret =3D ext4_fc_record_modified_inode(sb, inode->i_ino);
           ^     ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   Suppressed 3 warnings (3 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   3 warnings generated.
   Suppressed 3 warnings (3 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   3 warnings generated.
   Suppressed 3 warnings (3 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.

vim +318 drivers/gpio/gpio-tqmx86.c

5fbe5b5883f8473 Linus Walleij     2019-09-04  228  =

b868db94a6a7047 Andrew Lunn       2019-01-25  229  static int tqmx86_gpio_p=
robe(struct platform_device *pdev)
b868db94a6a7047 Andrew Lunn       2019-01-25  230  {
b868db94a6a7047 Andrew Lunn       2019-01-25  231  	struct device *dev =3D =
&pdev->dev;
b868db94a6a7047 Andrew Lunn       2019-01-25  232  	struct tqmx86_gpio_data=
 *gpio;
b868db94a6a7047 Andrew Lunn       2019-01-25  233  	struct gpio_chip *chip;
74639d66e1ec069 Linus Walleij     2019-08-09  234  	struct gpio_irq_chip *g=
irq;
b868db94a6a7047 Andrew Lunn       2019-01-25  235  	void __iomem *io_base;
b868db94a6a7047 Andrew Lunn       2019-01-25  236  	struct resource *res;
b868db94a6a7047 Andrew Lunn       2019-01-25  237  	int ret, irq;
b868db94a6a7047 Andrew Lunn       2019-01-25  238  =

9b87f43537acfa2 Matthias Schiffer 2021-07-16  239  	irq =3D platform_get_ir=
q_optional(pdev, 0);
9b87f43537acfa2 Matthias Schiffer 2021-07-16  240  	if (irq < 0 && irq !=3D=
 -ENXIO)
b868db94a6a7047 Andrew Lunn       2019-01-25  241  		return irq;
b868db94a6a7047 Andrew Lunn       2019-01-25  242  =

b868db94a6a7047 Andrew Lunn       2019-01-25  243  	res =3D platform_get_re=
source(pdev, IORESOURCE_IO, 0);
b868db94a6a7047 Andrew Lunn       2019-01-25  244  	if (!res) {
b868db94a6a7047 Andrew Lunn       2019-01-25  245  		dev_err(&pdev->dev, "C=
annot get I/O\n");
b868db94a6a7047 Andrew Lunn       2019-01-25  246  		return -ENODEV;
b868db94a6a7047 Andrew Lunn       2019-01-25  247  	}
b868db94a6a7047 Andrew Lunn       2019-01-25  248  =

b868db94a6a7047 Andrew Lunn       2019-01-25  249  	io_base =3D devm_ioport=
_map(&pdev->dev, res->start, resource_size(res));
b868db94a6a7047 Andrew Lunn       2019-01-25  250  	if (!io_base)
b868db94a6a7047 Andrew Lunn       2019-01-25  251  		return -ENOMEM;
b868db94a6a7047 Andrew Lunn       2019-01-25  252  =

b868db94a6a7047 Andrew Lunn       2019-01-25  253  	gpio =3D devm_kzalloc(d=
ev, sizeof(*gpio), GFP_KERNEL);
b868db94a6a7047 Andrew Lunn       2019-01-25  254  	if (!gpio)
b868db94a6a7047 Andrew Lunn       2019-01-25  255  		return -ENOMEM;
b868db94a6a7047 Andrew Lunn       2019-01-25  256  =

b868db94a6a7047 Andrew Lunn       2019-01-25  257  	raw_spin_lock_init(&gpi=
o->spinlock);
b868db94a6a7047 Andrew Lunn       2019-01-25  258  	gpio->io_base =3D io_ba=
se;
b868db94a6a7047 Andrew Lunn       2019-01-25  259  =

b868db94a6a7047 Andrew Lunn       2019-01-25  260  	tqmx86_gpio_write(gpio,=
 (u8)~TQMX86_DIR_INPUT_MASK, TQMX86_GPIODD);
b868db94a6a7047 Andrew Lunn       2019-01-25  261  =

b868db94a6a7047 Andrew Lunn       2019-01-25  262  	platform_set_drvdata(pd=
ev, gpio);
b868db94a6a7047 Andrew Lunn       2019-01-25  263  =

b868db94a6a7047 Andrew Lunn       2019-01-25  264  	chip =3D &gpio->chip;
b868db94a6a7047 Andrew Lunn       2019-01-25  265  	chip->label =3D "gpio-t=
qmx86";
b868db94a6a7047 Andrew Lunn       2019-01-25  266  	chip->owner =3D THIS_MO=
DULE;
b868db94a6a7047 Andrew Lunn       2019-01-25  267  	chip->can_sleep =3D fal=
se;
b868db94a6a7047 Andrew Lunn       2019-01-25  268  	chip->base =3D -1;
b868db94a6a7047 Andrew Lunn       2019-01-25  269  	chip->direction_input =
=3D tqmx86_gpio_direction_input;
b868db94a6a7047 Andrew Lunn       2019-01-25  270  	chip->direction_output =
=3D tqmx86_gpio_direction_output;
b868db94a6a7047 Andrew Lunn       2019-01-25  271  	chip->get_direction =3D=
 tqmx86_gpio_get_direction;
b868db94a6a7047 Andrew Lunn       2019-01-25  272  	chip->get =3D tqmx86_gp=
io_get;
b868db94a6a7047 Andrew Lunn       2019-01-25  273  	chip->set =3D tqmx86_gp=
io_set;
b868db94a6a7047 Andrew Lunn       2019-01-25  274  	chip->ngpio =3D TQMX86_=
NGPIO;
b868db94a6a7047 Andrew Lunn       2019-01-25  275  	chip->parent =3D pdev->=
dev.parent;
b868db94a6a7047 Andrew Lunn       2019-01-25  276  =

b868db94a6a7047 Andrew Lunn       2019-01-25  277  	pm_runtime_enable(&pdev=
->dev);
b868db94a6a7047 Andrew Lunn       2019-01-25  278  =

9b87f43537acfa2 Matthias Schiffer 2021-07-16  279  	if (irq > 0) {
b868db94a6a7047 Andrew Lunn       2019-01-25  280  		struct irq_chip *irq_c=
hip =3D &gpio->irq_chip;
b868db94a6a7047 Andrew Lunn       2019-01-25  281  		u8 irq_status;
b868db94a6a7047 Andrew Lunn       2019-01-25  282  =

b868db94a6a7047 Andrew Lunn       2019-01-25  283  		irq_chip->name =3D chi=
p->label;
b868db94a6a7047 Andrew Lunn       2019-01-25  284  		irq_chip->irq_mask =3D=
 tqmx86_gpio_irq_mask;
b868db94a6a7047 Andrew Lunn       2019-01-25  285  		irq_chip->irq_unmask =
=3D tqmx86_gpio_irq_unmask;
b868db94a6a7047 Andrew Lunn       2019-01-25  286  		irq_chip->irq_set_type=
 =3D tqmx86_gpio_irq_set_type;
b868db94a6a7047 Andrew Lunn       2019-01-25  287  =

b868db94a6a7047 Andrew Lunn       2019-01-25  288  		/* Mask all interrupts=
 */
b868db94a6a7047 Andrew Lunn       2019-01-25  289  		tqmx86_gpio_write(gpio=
, 0, TQMX86_GPIIC);
b868db94a6a7047 Andrew Lunn       2019-01-25  290  =

b868db94a6a7047 Andrew Lunn       2019-01-25  291  		/* Clear all pending i=
nterrupts */
b868db94a6a7047 Andrew Lunn       2019-01-25  292  		irq_status =3D tqmx86_=
gpio_read(gpio, TQMX86_GPIIS);
b868db94a6a7047 Andrew Lunn       2019-01-25  293  		tqmx86_gpio_write(gpio=
, irq_status, TQMX86_GPIIS);
b868db94a6a7047 Andrew Lunn       2019-01-25  294  =

74639d66e1ec069 Linus Walleij     2019-08-09  295  		girq =3D &chip->irq;
74639d66e1ec069 Linus Walleij     2019-08-09  296  		girq->chip =3D irq_chi=
p;
74639d66e1ec069 Linus Walleij     2019-08-09  297  		girq->parent_handler =
=3D tqmx86_gpio_irq_handler;
74639d66e1ec069 Linus Walleij     2019-08-09  298  		girq->num_parents =3D =
1;
74639d66e1ec069 Linus Walleij     2019-08-09  299  		girq->parents =3D devm=
_kcalloc(&pdev->dev, 1,
74639d66e1ec069 Linus Walleij     2019-08-09  300  					     sizeof(*girq->=
parents),
74639d66e1ec069 Linus Walleij     2019-08-09  301  					     GFP_KERNEL);
74639d66e1ec069 Linus Walleij     2019-08-09  302  		if (!girq->parents) {
74639d66e1ec069 Linus Walleij     2019-08-09  303  			ret =3D -ENOMEM;
96be65d12d792b3 Wei Yongjun       2019-02-01  304  			goto out_pm_dis;
b868db94a6a7047 Andrew Lunn       2019-01-25  305  		}
74639d66e1ec069 Linus Walleij     2019-08-09  306  		girq->parents[0] =3D i=
rq;
74639d66e1ec069 Linus Walleij     2019-08-09  307  		girq->default_type =3D=
 IRQ_TYPE_NONE;
74639d66e1ec069 Linus Walleij     2019-08-09  308  		girq->handler =3D hand=
le_simple_irq;
5fbe5b5883f8473 Linus Walleij     2019-09-04  309  		girq->init_valid_mask =
=3D tqmx86_init_irq_valid_mask;
74639d66e1ec069 Linus Walleij     2019-08-09  310  	}
b868db94a6a7047 Andrew Lunn       2019-01-25  311  =

74639d66e1ec069 Linus Walleij     2019-08-09  312  	ret =3D devm_gpiochip_a=
dd_data(dev, chip, gpio);
74639d66e1ec069 Linus Walleij     2019-08-09  313  	if (ret) {
74639d66e1ec069 Linus Walleij     2019-08-09  314  		dev_err(dev, "Could no=
t register GPIO chip\n");
74639d66e1ec069 Linus Walleij     2019-08-09  315  		goto out_pm_dis;
b868db94a6a7047 Andrew Lunn       2019-01-25  316  	}
b868db94a6a7047 Andrew Lunn       2019-01-25  317  =

1c989f3d9b53028 Marc Zyngier      2022-02-01 @318  	irq_domain_set_pm_devic=
e(girq->domain, dev);
1c989f3d9b53028 Marc Zyngier      2022-02-01  319  =

b868db94a6a7047 Andrew Lunn       2019-01-25  320  	dev_info(dev, "GPIO fun=
ctionality initialized with %d pins\n",
b868db94a6a7047 Andrew Lunn       2019-01-25  321  		 chip->ngpio);
b868db94a6a7047 Andrew Lunn       2019-01-25  322  =

b868db94a6a7047 Andrew Lunn       2019-01-25  323  	return 0;
b868db94a6a7047 Andrew Lunn       2019-01-25  324  =

b868db94a6a7047 Andrew Lunn       2019-01-25  325  out_pm_dis:
b868db94a6a7047 Andrew Lunn       2019-01-25  326  	pm_runtime_disable(&pde=
v->dev);
b868db94a6a7047 Andrew Lunn       2019-01-25  327  =

b868db94a6a7047 Andrew Lunn       2019-01-25  328  	return ret;
b868db94a6a7047 Andrew Lunn       2019-01-25  329  }
b868db94a6a7047 Andrew Lunn       2019-01-25  330  =


---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all(a)lists.01.org
--===============1054010757810675291==--

