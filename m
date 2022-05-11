Content-Type: multipart/mixed; boundary="===============4995064605435214637=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: Re: [PATCH 1/8] counter: 104-quad-8: Utilize iomap interface
Date: Wed, 11 May 2022 16:11:57 +0800
Message-ID: <202205111619.HUf31X6P-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============4995064605435214637==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

CC: kbuild-all(a)lists.01.org
BCC: lkp(a)intel.com
In-Reply-To: <861c003318dce3d2bef4061711643bb04f5ec14f.1652201921.git.willi=
am.gray@linaro.org>
References: <861c003318dce3d2bef4061711643bb04f5ec14f.1652201921.git.willia=
m.gray@linaro.org>
TO: William Breathitt Gray <william.gray@linaro.org>
TO: linux-iio(a)vger.kernel.org
CC: linux-kernel(a)vger.kernel.org
CC: linux-gpio(a)vger.kernel.org
CC: linus.walleij(a)linaro.org
CC: schnelle(a)linux.ibm.com
CC: David.Laight(a)ACULAB.COM
CC: macro(a)orcam.me.uk
CC: William Breathitt Gray <william.gray@linaro.org>
CC: Syed Nayyar Waris <syednwaris@gmail.com>

Hi William,

I love your patch! Perhaps something to improve:

[auto build test WARNING on ce522ba9ef7e2d9fb22a39eb3371c0c64e2a433e]

url:    https://github.com/intel-lab-lkp/linux/commits/William-Breathitt-Gr=
ay/Utilize-iomap-interface-for-PC104-and-friends/20220511-013247
base:   ce522ba9ef7e2d9fb22a39eb3371c0c64e2a433e
:::::: branch date: 15 hours ago
:::::: commit date: 15 hours ago
config: i386-randconfig-m021-20220509 (https://download.01.org/0day-ci/arch=
ive/20220511/202205111619.HUf31X6P-lkp(a)intel.com/config)
compiler: gcc-11 (Debian 11.2.0-20) 11.2.0

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>
Reported-by: Dan Carpenter <dan.carpenter@oracle.com>

smatch warnings:
drivers/counter/104-quad-8.c:154 quad8_count_read() warn: should 'ioread8(b=
ase_offset) << (8 * i)' be a 64 bit type?

vim +154 drivers/counter/104-quad-8.c

f1d8a071d45bf1 William Breathitt Gray 2019-04-02  128  =

f1d8a071d45bf1 William Breathitt Gray 2019-04-02  129  static int quad8_cou=
nt_read(struct counter_device *counter,
aaec1a0f76ec25 William Breathitt Gray 2021-08-27  130  			    struct counte=
r_count *count, u64 *val)
f1d8a071d45bf1 William Breathitt Gray 2019-04-02  131  {
aea8334b24feb0 Uwe Kleine-K=C3=B6nig       2021-12-30  132  	struct quad8 *=
const priv =3D counter_priv(counter);
744c2317cf8c1f William Breathitt Gray 2022-05-10  133  	void __iomem *const=
 base_offset =3D priv->base + 2 * count->id;
f1d8a071d45bf1 William Breathitt Gray 2019-04-02  134  	unsigned int flags;
f1d8a071d45bf1 William Breathitt Gray 2019-04-02  135  	unsigned int borrow;
f1d8a071d45bf1 William Breathitt Gray 2019-04-02  136  	unsigned int carry;
09db4678bfbb42 William Breathitt Gray 2021-09-29  137  	unsigned long irqfl=
ags;
f1d8a071d45bf1 William Breathitt Gray 2019-04-02  138  	int i;
f1d8a071d45bf1 William Breathitt Gray 2019-04-02  139  =

744c2317cf8c1f William Breathitt Gray 2022-05-10  140  	flags =3D ioread8(b=
ase_offset + 1);
f1d8a071d45bf1 William Breathitt Gray 2019-04-02  141  	borrow =3D flags & =
QUAD8_FLAG_BT;
f1d8a071d45bf1 William Breathitt Gray 2019-04-02  142  	carry =3D !!(flags =
& QUAD8_FLAG_CT);
f1d8a071d45bf1 William Breathitt Gray 2019-04-02  143  =

f1d8a071d45bf1 William Breathitt Gray 2019-04-02  144  	/* Borrow XOR Carry=
 effectively doubles count range */
d49e6ee2d6c2b6 William Breathitt Gray 2019-10-06  145  	*val =3D (unsigned =
long)(borrow ^ carry) << 24;
f1d8a071d45bf1 William Breathitt Gray 2019-04-02  146  =

09db4678bfbb42 William Breathitt Gray 2021-09-29  147  	spin_lock_irqsave(&=
priv->lock, irqflags);
fc069262261c43 Syed Nayyar Waris      2020-03-16  148  =

f1d8a071d45bf1 William Breathitt Gray 2019-04-02  149  	/* Reset Byte Point=
er; transfer Counter to Output Latch */
744c2317cf8c1f William Breathitt Gray 2022-05-10  150  	iowrite8(QUAD8_CTR_=
RLD | QUAD8_RLD_RESET_BP | QUAD8_RLD_CNTR_OUT,
f1d8a071d45bf1 William Breathitt Gray 2019-04-02  151  		 base_offset + 1);
f1d8a071d45bf1 William Breathitt Gray 2019-04-02  152  =

f1d8a071d45bf1 William Breathitt Gray 2019-04-02  153  	for (i =3D 0; i < 3=
; i++)
744c2317cf8c1f William Breathitt Gray 2022-05-10 @154  		*val |=3D (unsigne=
d long)ioread8(base_offset) << (8 * i);
f1d8a071d45bf1 William Breathitt Gray 2019-04-02  155  =

09db4678bfbb42 William Breathitt Gray 2021-09-29  156  	spin_unlock_irqrest=
ore(&priv->lock, irqflags);
fc069262261c43 Syed Nayyar Waris      2020-03-16  157  =

f1d8a071d45bf1 William Breathitt Gray 2019-04-02  158  	return 0;
f1d8a071d45bf1 William Breathitt Gray 2019-04-02  159  }
f1d8a071d45bf1 William Breathitt Gray 2019-04-02  160  =


-- =

0-DAY CI Kernel Test Service
https://01.org/lkp
--===============4995064605435214637==--

