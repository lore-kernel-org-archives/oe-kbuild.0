Content-Type: multipart/mixed; boundary="===============4848510188564755512=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: drivers/net/ethernet/micrel/ks8851_common.c:276:3: warning: Value stored to 'rxstat' is never read [clang-analyzer-deadcode.DeadStores]
Date: Sun, 02 Jan 2022 08:18:52 +0800
Message-ID: <202201020824.fJb1v637-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============4848510188564755512==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

CC: llvm(a)lists.linux.dev
CC: kbuild-all(a)lists.01.org
CC: linux-kernel(a)vger.kernel.org
TO: Tom Rix <trix@redhat.com>
CC: Jakub Kicinski <kuba@kernel.org>
CC: Marek Vasut <marex@denx.de>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git =
master
head:   278218f6778bc7d6f8b67199446c56cec7ebb841
commit: 3ada665b8fab46bc126b9f0660a86503781ab67c net: ks8851: remove defini=
tion of DEBUG
date:   12 months ago
:::::: branch date: 6 hours ago
:::::: commit date: 12 months ago
config: i386-randconfig-c001-20211206 (https://download.01.org/0day-ci/arch=
ive/20220102/202201020824.fJb1v637-lkp(a)intel.com/config)
compiler: clang version 14.0.0 (https://github.com/llvm/llvm-project f50be8=
eb0a12a61d23db6cda452c693001d76898)
reproduce (this is a W=3D1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/=
make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.gi=
t/commit/?id=3D3ada665b8fab46bc126b9f0660a86503781ab67c
        git remote add linus https://git.kernel.org/pub/scm/linux/kernel/gi=
t/torvalds/linux.git
        git fetch --no-tags linus master
        git checkout 3ada665b8fab46bc126b9f0660a86503781ab67c
        # save the config file to linux build tree
        COMPILER_INSTALL_PATH=3D$HOME/0day COMPILER=3Dclang make.cross ARCH=
=3Di386 clang-analyzer =


If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>


clang-analyzer warnings: (new ones prefixed by >>)
                              ^~~~~~   ~~~~~~~~~~~~~~~~~~
   drivers/media/i2c/st-mipid02.c:679:21: note: Value stored to 'client' du=
ring its initialization is never read
           struct i2c_client *client =3D bridge->i2c_client;
                              ^~~~~~   ~~~~~~~~~~~~~~~~~~
   drivers/media/i2c/st-mipid02.c:747:21: warning: Value stored to 'client'=
 during its initialization is never read [clang-analyzer-deadcode.DeadStore=
s]
           struct i2c_client *client =3D bridge->i2c_client;
                              ^~~~~~   ~~~~~~~~~~~~~~~~~~
   drivers/media/i2c/st-mipid02.c:747:21: note: Value stored to 'client' du=
ring its initialization is never read
           struct i2c_client *client =3D bridge->i2c_client;
                              ^~~~~~   ~~~~~~~~~~~~~~~~~~
   drivers/media/i2c/st-mipid02.c:919:3: warning: Value stored to 'ret' is =
never read [clang-analyzer-deadcode.DeadStores]
                   ret =3D -EINVAL;
                   ^     ~~~~~~~
   drivers/media/i2c/st-mipid02.c:919:3: note: Value stored to 'ret' is nev=
er read
                   ret =3D -EINVAL;
                   ^     ~~~~~~~
   Suppressed 6 warnings (6 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   5 warnings generated.
   Suppressed 5 warnings (5 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   5 warnings generated.
   Suppressed 5 warnings (5 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   5 warnings generated.
   Suppressed 5 warnings (5 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   6 warnings generated.
   drivers/media/tuners/tua9001.c:148:21: warning: Value stored to 'client'=
 during its initialization is never read [clang-analyzer-deadcode.DeadStore=
s]
           struct i2c_client *client =3D dev->client;
                              ^~~~~~   ~~~~~~~~~~~
   drivers/media/tuners/tua9001.c:148:21: note: Value stored to 'client' du=
ring its initialization is never read
           struct i2c_client *client =3D dev->client;
                              ^~~~~~   ~~~~~~~~~~~
   Suppressed 5 warnings (5 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   6 warnings generated.
   drivers/media/tuners/fc0011.c:252:3: warning: Value stored to 'bandwidth=
' is never read [clang-analyzer-deadcode.DeadStores]
                   bandwidth =3D 6000;
                   ^           ~~~~
   drivers/media/tuners/fc0011.c:252:3: note: Value stored to 'bandwidth' i=
s never read
                   bandwidth =3D 6000;
                   ^           ~~~~
   Suppressed 5 warnings (5 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   11 warnings generated.
   Suppressed 11 warnings (11 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   11 warnings generated.
   Suppressed 11 warnings (11 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   13 warnings generated.
   net/ipv4/ipconfig.c:350:2: warning: Call to function 'strcpy' is insecur=
e as it does not provide bounding of the memory buffer. Replace unbounded c=
opy functions with analogous functions that support length arguments such a=
s 'strlcpy'. CWE-119 [clang-analyzer-security.insecureAPI.strcpy]
           strcpy(ir.ifr_ifrn.ifrn_name, ic_dev->dev->name);
           ^~~~~~
   net/ipv4/ipconfig.c:350:2: note: Call to function 'strcpy' is insecure a=
s it does not provide bounding of the memory buffer. Replace unbounded copy=
 functions with analogous functions that support length arguments such as '=
strlcpy'. CWE-119
           strcpy(ir.ifr_ifrn.ifrn_name, ic_dev->dev->name);
           ^~~~~~
   net/ipv4/ipconfig.c:1018:2: warning: Value stored to 'h' is never read [=
clang-analyzer-deadcode.DeadStores]
           h =3D &b->iph;
           ^   ~~~~~~~
   net/ipv4/ipconfig.c:1018:2: note: Value stored to 'h' is never read
           h =3D &b->iph;
           ^   ~~~~~~~
   Suppressed 11 warnings (11 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   11 warnings generated.
   Suppressed 11 warnings (11 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   11 warnings generated.
   Suppressed 11 warnings (11 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   11 warnings generated.
   Suppressed 11 warnings (11 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   11 warnings generated.
   Suppressed 11 warnings (11 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   11 warnings generated.
   Suppressed 11 warnings (11 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   5 warnings generated.
   Suppressed 5 warnings (5 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   6 warnings generated.
   drivers/leds/uleds.c:150:4: warning: Value stored to 'retval' is never r=
ead [clang-analyzer-deadcode.DeadStores]
                           retval =3D copy_to_user(buffer, &udev->brightnes=
s,
                           ^        ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/leds/uleds.c:150:4: note: Value stored to 'retval' is never read
                           retval =3D copy_to_user(buffer, &udev->brightnes=
s,
                           ^        ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   Suppressed 5 warnings (5 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   5 warnings generated.
   Suppressed 5 warnings (5 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   5 warnings generated.
   Suppressed 5 warnings (5 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   14 warnings generated.
>> drivers/net/ethernet/micrel/ks8851_common.c:276:3: warning: Value stored=
 to 'rxstat' is never read [clang-analyzer-deadcode.DeadStores]
                   rxstat =3D ks8851_rdreg16(ks, KS_RXFHSR);
                   ^        ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/net/ethernet/micrel/ks8851_common.c:276:3: note: Value stored to=
 'rxstat' is never read
                   rxstat =3D ks8851_rdreg16(ks, KS_RXFHSR);
                   ^        ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/net/ethernet/micrel/ks8851_common.c:1046:3: warning: Value store=
d to 'ret' is never read [clang-analyzer-deadcode.DeadStores]
                   ret |=3D 2;
                   ^      ~
   drivers/net/ethernet/micrel/ks8851_common.c:1046:3: note: Value stored t=
o 'ret' is never read
                   ret |=3D 2;
                   ^      ~
   Suppressed 12 warnings (11 in non-user code, 1 with check filters).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   5 warnings generated.
   Suppressed 5 warnings (5 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   5 warnings generated.
   Suppressed 5 warnings (5 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   5 warnings generated.
   Suppressed 5 warnings (5 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   5 warnings generated.
   Suppressed 5 warnings (5 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   5 warnings generated.
   Suppressed 5 warnings (5 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   5 warnings generated.
   Suppressed 5 warnings (5 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   5 warnings generated.
   Suppressed 5 warnings (5 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   5 warnings generated.
   Suppressed 5 warnings (5 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   5 warnings generated.
   Suppressed 5 warnings (5 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   5 warnings generated.
   Suppressed 5 warnings (5 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   5 warnings generated.
   Suppressed 5 warnings (5 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   5 warnings generated.
   Suppressed 5 warnings (5 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   5 warnings generated.
   Suppressed 5 warnings (5 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   5 warnings generated.
   Suppressed 5 warnings (5 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   5 warnings generated.
   Suppressed 5 warnings (5 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   5 warnings generated.
   Suppressed 5 warnings (5 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   5 warnings generated.
   Suppressed 5 warnings (5 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   5 warnings generated.
   Suppressed 5 warnings (5 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   5 warnings generated.
   Suppressed 5 warnings (5 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   5 warnings generated.
   Suppressed 5 warnings (5 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   5 warnings generated.
   Suppressed 5 warnings (5 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   5 warnings generated.
   Suppressed 5 warnings (5 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   5 warnings generated.
   Suppressed 5 warnings (5 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   5 warnings generated.
   Suppressed 5 warnings (5 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   5 warnings generated.
   Suppressed 5 warnings (5 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   5 warnings generated.
   Suppressed 5 warnings (5 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   6 warnings generated.
   Suppressed 6 warnings (6 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   5 warnings generated.
   Suppressed 5 warnings (5 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   6 warnings generated.
   drivers/hwmon/lm75.h:30:29: warning: The result of the left shift is und=
efined because the left operand is negative [clang-analyzer-core.UndefinedB=
inaryOperatorResult]
           return (u16)((ntemp / 500) << 7);

vim +/rxstat +276 drivers/net/ethernet/micrel/ks8851_common.c

7a552c850c4581 drivers/net/ethernet/micrel/ks8851.c Marek Vasut     2020-05=
-29  243  =

3ba81f3ece3cfa drivers/net/ks8851.c                 Ben Dooks       2009-07=
-16  244  /**
3ba81f3ece3cfa drivers/net/ks8851.c                 Ben Dooks       2009-07=
-16  245   * ks8851_rx_pkts - receive packets from the host
3ba81f3ece3cfa drivers/net/ks8851.c                 Ben Dooks       2009-07=
-16  246   * @ks: The device information.
3ba81f3ece3cfa drivers/net/ks8851.c                 Ben Dooks       2009-07=
-16  247   *
3ba81f3ece3cfa drivers/net/ks8851.c                 Ben Dooks       2009-07=
-16  248   * This is called from the IRQ work queue when the system detects=
 that there
3ba81f3ece3cfa drivers/net/ks8851.c                 Ben Dooks       2009-07=
-16  249   * are packets in the receive queue. Find out how many packets th=
ere are and
3ba81f3ece3cfa drivers/net/ks8851.c                 Ben Dooks       2009-07=
-16  250   * read them from the FIFO.
3ba81f3ece3cfa drivers/net/ks8851.c                 Ben Dooks       2009-07=
-16  251   */
3ba81f3ece3cfa drivers/net/ks8851.c                 Ben Dooks       2009-07=
-16  252  static void ks8851_rx_pkts(struct ks8851_net *ks)
3ba81f3ece3cfa drivers/net/ks8851.c                 Ben Dooks       2009-07=
-16  253  {
3ba81f3ece3cfa drivers/net/ks8851.c                 Ben Dooks       2009-07=
-16  254  	struct sk_buff *skb;
3ba81f3ece3cfa drivers/net/ks8851.c                 Ben Dooks       2009-07=
-16  255  	unsigned rxfc;
3ba81f3ece3cfa drivers/net/ks8851.c                 Ben Dooks       2009-07=
-16  256  	unsigned rxlen;
3ba81f3ece3cfa drivers/net/ks8851.c                 Ben Dooks       2009-07=
-16  257  	unsigned rxstat;
3ba81f3ece3cfa drivers/net/ks8851.c                 Ben Dooks       2009-07=
-16  258  	u8 *rxpkt;
3ba81f3ece3cfa drivers/net/ks8851.c                 Ben Dooks       2009-07=
-16  259  =

aa39bf6730b72e drivers/net/ethernet/micrel/ks8851.c Marek Vasut     2020-05=
-29  260  	rxfc =3D (ks8851_rdreg16(ks, KS_RXFCTR) >> 8) & 0xff;
3ba81f3ece3cfa drivers/net/ks8851.c                 Ben Dooks       2009-07=
-16  261  =

0dc7d2b3cbfcf4 drivers/net/ks8851.c                 Joe Perches     2010-02=
-27  262  	netif_dbg(ks, rx_status, ks->netdev,
0dc7d2b3cbfcf4 drivers/net/ks8851.c                 Joe Perches     2010-02=
-27  263  		  "%s: %d packets\n", __func__, rxfc);
3ba81f3ece3cfa drivers/net/ks8851.c                 Ben Dooks       2009-07=
-16  264  =

3ba81f3ece3cfa drivers/net/ks8851.c                 Ben Dooks       2009-07=
-16  265  	/* Currently we're issuing a read per packet, but we could possi=
bly
3ba81f3ece3cfa drivers/net/ks8851.c                 Ben Dooks       2009-07=
-16  266  	 * improve the code by issuing a single read, getting the receive
3ba81f3ece3cfa drivers/net/ks8851.c                 Ben Dooks       2009-07=
-16  267  	 * header, allocating the packet and then reading the packet data
3ba81f3ece3cfa drivers/net/ks8851.c                 Ben Dooks       2009-07=
-16  268  	 * out in one go.
3ba81f3ece3cfa drivers/net/ks8851.c                 Ben Dooks       2009-07=
-16  269  	 *
3ba81f3ece3cfa drivers/net/ks8851.c                 Ben Dooks       2009-07=
-16  270  	 * This form of operation would require us to hold the SPI bus'
3ba81f3ece3cfa drivers/net/ks8851.c                 Ben Dooks       2009-07=
-16  271  	 * chipselect low during the entie transaction to avoid any
25985edcedea63 drivers/net/ks8851.c                 Lucas De Marchi 2011-03=
-30  272  	 * reset to the data stream coming from the chip.
3ba81f3ece3cfa drivers/net/ks8851.c                 Ben Dooks       2009-07=
-16  273  	 */
3ba81f3ece3cfa drivers/net/ks8851.c                 Ben Dooks       2009-07=
-16  274  =

3ba81f3ece3cfa drivers/net/ks8851.c                 Ben Dooks       2009-07=
-16  275  	for (; rxfc !=3D 0; rxfc--) {
806f66495e791e drivers/net/ethernet/micrel/ks8851.c Marek Vasut     2020-05=
-29 @276  		rxstat =3D ks8851_rdreg16(ks, KS_RXFHSR);
806f66495e791e drivers/net/ethernet/micrel/ks8851.c Marek Vasut     2020-05=
-29  277  		rxlen =3D ks8851_rdreg16(ks, KS_RXFHBCR) & RXFHBCR_CNT_MASK;
3ba81f3ece3cfa drivers/net/ks8851.c                 Ben Dooks       2009-07=
-16  278  =

0dc7d2b3cbfcf4 drivers/net/ks8851.c                 Joe Perches     2010-02=
-27  279  		netif_dbg(ks, rx_status, ks->netdev,
0dc7d2b3cbfcf4 drivers/net/ks8851.c                 Joe Perches     2010-02=
-27  280  			  "rx: stat 0x%04x, len 0x%04x\n", rxstat, rxlen);
3ba81f3ece3cfa drivers/net/ks8851.c                 Ben Dooks       2009-07=
-16  281  =

3ba81f3ece3cfa drivers/net/ks8851.c                 Ben Dooks       2009-07=
-16  282  		/* the length of the packet includes the 32bit CRC */
3ba81f3ece3cfa drivers/net/ks8851.c                 Ben Dooks       2009-07=
-16  283  =

3ba81f3ece3cfa drivers/net/ks8851.c                 Ben Dooks       2009-07=
-16  284  		/* set dma read address */
3ba81f3ece3cfa drivers/net/ks8851.c                 Ben Dooks       2009-07=
-16  285  		ks8851_wrreg16(ks, KS_RXFDPR, RXFDPR_RXFPAI | 0x00);
3ba81f3ece3cfa drivers/net/ks8851.c                 Ben Dooks       2009-07=
-16  286  =

536d3680fd2dab drivers/net/ethernet/micrel/ks8851.c Lukas Wunner    2019-03=
-20  287  		/* start DMA access */
536d3680fd2dab drivers/net/ethernet/micrel/ks8851.c Lukas Wunner    2019-03=
-20  288  		ks8851_wrreg16(ks, KS_RXQCR, ks->rc_rxqcr | RXQCR_SDA);
3ba81f3ece3cfa drivers/net/ks8851.c                 Ben Dooks       2009-07=
-16  289  =

972c40b5bee429 drivers/net/ks8851.c                 Eric Dumazet    2010-09=
-08  290  		if (rxlen > 4) {
972c40b5bee429 drivers/net/ks8851.c                 Eric Dumazet    2010-09=
-08  291  			unsigned int rxalign;
972c40b5bee429 drivers/net/ks8851.c                 Eric Dumazet    2010-09=
-08  292  =

972c40b5bee429 drivers/net/ks8851.c                 Eric Dumazet    2010-09=
-08  293  			rxlen -=3D 4;
972c40b5bee429 drivers/net/ks8851.c                 Eric Dumazet    2010-09=
-08  294  			rxalign =3D ALIGN(rxlen, 4);
972c40b5bee429 drivers/net/ks8851.c                 Eric Dumazet    2010-09=
-08  295  			skb =3D netdev_alloc_skb_ip_align(ks->netdev, rxalign);
972c40b5bee429 drivers/net/ks8851.c                 Eric Dumazet    2010-09=
-08  296  			if (skb) {
972c40b5bee429 drivers/net/ks8851.c                 Eric Dumazet    2010-09=
-08  297  =

972c40b5bee429 drivers/net/ks8851.c                 Eric Dumazet    2010-09=
-08  298  				/* 4 bytes of status header + 4 bytes of
972c40b5bee429 drivers/net/ks8851.c                 Eric Dumazet    2010-09=
-08  299  				 * garbage: we put them before ethernet
972c40b5bee429 drivers/net/ks8851.c                 Eric Dumazet    2010-09=
-08  300  				 * header, so that they are copied,
972c40b5bee429 drivers/net/ks8851.c                 Eric Dumazet    2010-09=
-08  301  				 * but ignored.
972c40b5bee429 drivers/net/ks8851.c                 Eric Dumazet    2010-09=
-08  302  				 */
3ba81f3ece3cfa drivers/net/ks8851.c                 Ben Dooks       2009-07=
-16  303  =

972c40b5bee429 drivers/net/ks8851.c                 Eric Dumazet    2010-09=
-08  304  				rxpkt =3D skb_put(skb, rxlen) - 8;
3ba81f3ece3cfa drivers/net/ks8851.c                 Ben Dooks       2009-07=
-16  305  =

7a552c850c4581 drivers/net/ethernet/micrel/ks8851.c Marek Vasut     2020-05=
-29  306  				ks->rdfifo(ks, rxpkt, rxalign + 8);
3ba81f3ece3cfa drivers/net/ks8851.c                 Ben Dooks       2009-07=
-16  307  =

3ba81f3ece3cfa drivers/net/ks8851.c                 Ben Dooks       2009-07=
-16  308  				if (netif_msg_pktdata(ks))
3ba81f3ece3cfa drivers/net/ks8851.c                 Ben Dooks       2009-07=
-16  309  					ks8851_dbg_dumpkkt(ks, rxpkt);
3ba81f3ece3cfa drivers/net/ks8851.c                 Ben Dooks       2009-07=
-16  310  =

3ba81f3ece3cfa drivers/net/ks8851.c                 Ben Dooks       2009-07=
-16  311  				skb->protocol =3D eth_type_trans(skb, ks->netdev);
7a552c850c4581 drivers/net/ethernet/micrel/ks8851.c Marek Vasut     2020-05=
-29  312  				ks8851_rx_skb(ks, skb);
3ba81f3ece3cfa drivers/net/ks8851.c                 Ben Dooks       2009-07=
-16  313  =

3ba81f3ece3cfa drivers/net/ks8851.c                 Ben Dooks       2009-07=
-16  314  				ks->netdev->stats.rx_packets++;
972c40b5bee429 drivers/net/ks8851.c                 Eric Dumazet    2010-09=
-08  315  				ks->netdev->stats.rx_bytes +=3D rxlen;
972c40b5bee429 drivers/net/ks8851.c                 Eric Dumazet    2010-09=
-08  316  			}
3ba81f3ece3cfa drivers/net/ks8851.c                 Ben Dooks       2009-07=
-16  317  		}
3ba81f3ece3cfa drivers/net/ks8851.c                 Ben Dooks       2009-07=
-16  318  =

536d3680fd2dab drivers/net/ethernet/micrel/ks8851.c Lukas Wunner    2019-03=
-20  319  		/* end DMA access and dequeue packet */
536d3680fd2dab drivers/net/ethernet/micrel/ks8851.c Lukas Wunner    2019-03=
-20  320  		ks8851_wrreg16(ks, KS_RXQCR, ks->rc_rxqcr | RXQCR_RRXEF);
3ba81f3ece3cfa drivers/net/ks8851.c                 Ben Dooks       2009-07=
-16  321  	}
3ba81f3ece3cfa drivers/net/ks8851.c                 Ben Dooks       2009-07=
-16  322  }
3ba81f3ece3cfa drivers/net/ks8851.c                 Ben Dooks       2009-07=
-16  323  =


:::::: The code at line 276 was first introduced by commit
:::::: 806f66495e791eb349cd3ea286ee411bcf1df4d0 net: ks8851: Remove ks8851_=
rdreg32()

:::::: TO: Marek Vasut <marex@denx.de>
:::::: CC: David S. Miller <davem@davemloft.net>

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all(a)lists.01.org
--===============4848510188564755512==--

