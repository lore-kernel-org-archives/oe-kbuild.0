Content-Type: multipart/mixed; boundary="===============5273420653885280529=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: drivers/net/dsa/mt7530.c:1857:17: warning: Local variable 'irq' shadows outer argument [shadowArgument]
Date: Fri, 08 Apr 2022 14:16:24 +0800
Message-ID: <202204081406.KpLUoSwl-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============5273420653885280529==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

CC: kbuild-all(a)lists.01.org
BCC: lkp(a)intel.com
CC: linux-kernel(a)vger.kernel.org
TO: DENG Qingfang <dqfext@gmail.com>
CC: Andrew Lunn <andrew@lunn.ch>
CC: Florian Fainelli <f.fainelli@gmail.com>
CC: Vladimir Oltean <olteanv@gmail.com>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git =
master
head:   42e7a03d3badebd4e70aea5362d6914dfc7c220b
commit: ba751e28d44255744a30190faad0ca09b455c44d net: dsa: mt7530: add inte=
rrupt support
date:   11 months ago
:::::: branch date: 14 hours ago
:::::: commit date: 11 months ago
compiler: riscv64-linux-gcc (GCC) 11.2.0
reproduce (cppcheck warning):
        # apt-get install cppcheck
        git checkout ba751e28d44255744a30190faad0ca09b455c44d
        cppcheck --quiet --enable=3Dstyle,performance,portability --templat=
e=3Dgcc FILE

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>


cppcheck possible warnings: (new ones prefixed by >>, may not real problems)

>> drivers/net/dsa/mt7530.c:1857:17: warning: Local variable 'irq' shadows =
outer argument [shadowArgument]
      unsigned int irq;
                   ^
   drivers/net/dsa/mt7530.c:1843:26: note: Shadowed declaration
   mt7530_irq_thread_fn(int irq, void *dev_id)
                            ^
   drivers/net/dsa/mt7530.c:1857:17: note: Shadow variable
      unsigned int irq;
                   ^
   drivers/net/dsa/mt7530.c:1199:23: warning: Parameter 'bridge' can be dec=
lared with const [constParameter]
      struct net_device *bridge)
                         ^
   drivers/net/dsa/mt7530.c:1305:24: warning: Parameter 'bridge' can be dec=
lared with const [constParameter]
       struct net_device *bridge)
                          ^
>> drivers/net/dsa/mt7530.c:1009:31: warning: Signed integer overflow for e=
xpression '((~0)&0xff)<<24'. [integerOverflow]
    mt7530_rmw(priv, MT7530_MFC, BC_FFP_MASK | UNM_FFP_MASK | UNU_FFP_MASK,
                                 ^

vim +/irq +1857 drivers/net/dsa/mt7530.c

429a0edeefd88c DENG Qingfang 2021-01-25  1841  =

ba751e28d44255 DENG Qingfang 2021-05-19  1842  static irqreturn_t
ba751e28d44255 DENG Qingfang 2021-05-19  1843  mt7530_irq_thread_fn(int irq=
, void *dev_id)
ba751e28d44255 DENG Qingfang 2021-05-19  1844  {
ba751e28d44255 DENG Qingfang 2021-05-19  1845  	struct mt7530_priv *priv =
=3D dev_id;
ba751e28d44255 DENG Qingfang 2021-05-19  1846  	bool handled =3D false;
ba751e28d44255 DENG Qingfang 2021-05-19  1847  	u32 val;
ba751e28d44255 DENG Qingfang 2021-05-19  1848  	int p;
ba751e28d44255 DENG Qingfang 2021-05-19  1849  =

ba751e28d44255 DENG Qingfang 2021-05-19  1850  	mutex_lock_nested(&priv->bu=
s->mdio_lock, MDIO_MUTEX_NESTED);
ba751e28d44255 DENG Qingfang 2021-05-19  1851  	val =3D mt7530_mii_read(pri=
v, MT7530_SYS_INT_STS);
ba751e28d44255 DENG Qingfang 2021-05-19  1852  	mt7530_mii_write(priv, MT75=
30_SYS_INT_STS, val);
ba751e28d44255 DENG Qingfang 2021-05-19  1853  	mutex_unlock(&priv->bus->md=
io_lock);
ba751e28d44255 DENG Qingfang 2021-05-19  1854  =

ba751e28d44255 DENG Qingfang 2021-05-19  1855  	for (p =3D 0; p < MT7530_NU=
M_PHYS; p++) {
ba751e28d44255 DENG Qingfang 2021-05-19  1856  		if (BIT(p) & val) {
ba751e28d44255 DENG Qingfang 2021-05-19 @1857  			unsigned int irq;
ba751e28d44255 DENG Qingfang 2021-05-19  1858  =

ba751e28d44255 DENG Qingfang 2021-05-19  1859  			irq =3D irq_find_mapping(=
priv->irq_domain, p);
ba751e28d44255 DENG Qingfang 2021-05-19  1860  			handle_nested_irq(irq);
ba751e28d44255 DENG Qingfang 2021-05-19  1861  			handled =3D true;
ba751e28d44255 DENG Qingfang 2021-05-19  1862  		}
ba751e28d44255 DENG Qingfang 2021-05-19  1863  	}
ba751e28d44255 DENG Qingfang 2021-05-19  1864  =

ba751e28d44255 DENG Qingfang 2021-05-19  1865  	return IRQ_RETVAL(handled);
ba751e28d44255 DENG Qingfang 2021-05-19  1866  }
ba751e28d44255 DENG Qingfang 2021-05-19  1867  =


-- =

0-DAY CI Kernel Test Service
https://01.org/lkp
--===============5273420653885280529==--

