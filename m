Content-Type: multipart/mixed; boundary="===============1784658388398966703=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: [ulfh-mmc:next 22/26] drivers/mmc/host/mmc_spi.c:866:15: warning: Value stored to 'write_or_read' during its initialization is never read [clang-analyzer-deadcode.DeadStores]
Date: Sat, 11 Dec 2021 08:41:32 +0800
Message-ID: <202112110856.IHtDCd1D-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============1784658388398966703==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

CC: llvm(a)lists.linux.dev
CC: kbuild-all(a)lists.01.org
CC: linux-kernel(a)vger.kernel.org
TO: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
CC: Ulf Hansson <ulf.hansson@linaro.org>

tree:   git://git.kernel.org/pub/scm/linux/kernel/git/ulfh/mmc.git next
head:   141edd9e99eb91393e8a4d97742bd98328bff724
commit: 9bd9c67ce7bf89d2c030f6d1f360669960bd2f98 [22/26] mmc: mmc_spi: Use =
write_or_read temporary variable in mmc_spi_data_do()
:::::: branch date: 2 days ago
:::::: commit date: 3 days ago
config: i386-randconfig-c001-20211209 (https://download.01.org/0day-ci/arch=
ive/20211211/202112110856.IHtDCd1D-lkp(a)intel.com/config)
compiler: clang version 14.0.0 (https://github.com/llvm/llvm-project 097a1c=
b1d5ebb3a0ec4bcaed8ba3ff6a8e33c00a)
reproduce (this is a W=3D1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/=
make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://git.kernel.org/pub/scm/linux/kernel/git/ulfh/mmc.git/comm=
it/?id=3D9bd9c67ce7bf89d2c030f6d1f360669960bd2f98
        git remote add ulfh-mmc git://git.kernel.org/pub/scm/linux/kernel/g=
it/ulfh/mmc.git
        git fetch --no-tags ulfh-mmc next
        git checkout 9bd9c67ce7bf89d2c030f6d1f360669960bd2f98
        # save the config file to linux build tree
        COMPILER_INSTALL_PATH=3D$HOME/0day COMPILER=3Dclang make.cross ARCH=
=3Di386 clang-analyzer =


If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>


clang-analyzer warnings: (new ones prefixed by >>)
                           ~~~~~~~~~^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~=
~~~~~~~~~~~~~~~~~
   include/linux/compiler.h:78:42: note: expanded from macro 'unlikely'
   # define unlikely(x)    __builtin_expect(!!(x), 0)
                                               ^
   include/linux/err.h:36:2: note: Returning zero, which participates in a =
condition later
           return IS_ERR_VALUE((unsigned long)ptr);
           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/nvmem/core.c:1691:6: note: Returning from 'IS_ERR'
           if (IS_ERR(buf))
               ^~~~~~~~~~~
   drivers/nvmem/core.c:1691:2: note: Taking false branch
           if (IS_ERR(buf))
           ^
   drivers/nvmem/core.c:1698:6: note: Assuming 'nbits' is 0
           if (nbits)
               ^~~~~
   drivers/nvmem/core.c:1698:2: note: Taking false branch
           if (nbits)
           ^
   drivers/nvmem/core.c:1701:11: note: The left operand of '>' is a garbage=
 value
           if (*len > max_len) {
               ~~~~ ^
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
   13 warnings generated.
   drivers/most/core.c:175:2: warning: Call to function 'strcpy' is insecur=
e as it does not provide bounding of the memory buffer. Replace unbounded c=
opy functions with analogous functions that support length arguments such a=
s 'strlcpy'. CWE-119 [clang-analyzer-security.insecureAPI.strcpy]
           strcpy(buf, "");
           ^~~~~~
   drivers/most/core.c:175:2: note: Call to function 'strcpy' is insecure a=
s it does not provide bounding of the memory buffer. Replace unbounded copy=
 functions with analogous functions that support length arguments such as '=
strlcpy'. CWE-119
           strcpy(buf, "");
           ^~~~~~
   drivers/most/core.c:177:3: warning: Call to function 'strcat' is insecur=
e as it does not provide bounding of the memory buffer. Replace unbounded c=
opy functions with analogous functions that support length arguments such a=
s 'strlcat'. CWE-119 [clang-analyzer-security.insecureAPI.strcpy]
                   strcat(buf, "rx ");
                   ^~~~~~
   drivers/most/core.c:177:3: note: Call to function 'strcat' is insecure a=
s it does not provide bounding of the memory buffer. Replace unbounded copy=
 functions with analogous functions that support length arguments such as '=
strlcat'. CWE-119
                   strcat(buf, "rx ");
                   ^~~~~~
   drivers/most/core.c:179:3: warning: Call to function 'strcat' is insecur=
e as it does not provide bounding of the memory buffer. Replace unbounded c=
opy functions with analogous functions that support length arguments such a=
s 'strlcat'. CWE-119 [clang-analyzer-security.insecureAPI.strcpy]
                   strcat(buf, "tx ");
                   ^~~~~~
   drivers/most/core.c:179:3: note: Call to function 'strcat' is insecure a=
s it does not provide bounding of the memory buffer. Replace unbounded copy=
 functions with analogous functions that support length arguments such as '=
strlcat'. CWE-119
                   strcat(buf, "tx ");
                   ^~~~~~
   drivers/most/core.c:180:2: warning: Call to function 'strcat' is insecur=
e as it does not provide bounding of the memory buffer. Replace unbounded c=
opy functions with analogous functions that support length arguments such a=
s 'strlcat'. CWE-119 [clang-analyzer-security.insecureAPI.strcpy]
           strcat(buf, "\n");
           ^~~~~~
   drivers/most/core.c:180:2: note: Call to function 'strcat' is insecure a=
s it does not provide bounding of the memory buffer. Replace unbounded copy=
 functions with analogous functions that support length arguments such as '=
strlcat'. CWE-119
           strcat(buf, "\n");
           ^~~~~~
   drivers/most/core.c:191:2: warning: Call to function 'strcpy' is insecur=
e as it does not provide bounding of the memory buffer. Replace unbounded c=
opy functions with analogous functions that support length arguments such a=
s 'strlcpy'. CWE-119 [clang-analyzer-security.insecureAPI.strcpy]
           strcpy(buf, "");
           ^~~~~~
   drivers/most/core.c:191:2: note: Call to function 'strcpy' is insecure a=
s it does not provide bounding of the memory buffer. Replace unbounded copy=
 functions with analogous functions that support length arguments such as '=
strlcpy'. CWE-119
           strcpy(buf, "");
           ^~~~~~
   drivers/most/core.c:193:3: warning: Call to function 'strcat' is insecur=
e as it does not provide bounding of the memory buffer. Replace unbounded c=
opy functions with analogous functions that support length arguments such a=
s 'strlcat'. CWE-119 [clang-analyzer-security.insecureAPI.strcpy]
                   strcat(buf, "control ");
                   ^~~~~~
   drivers/most/core.c:193:3: note: Call to function 'strcat' is insecure a=
s it does not provide bounding of the memory buffer. Replace unbounded copy=
 functions with analogous functions that support length arguments such as '=
strlcat'. CWE-119
                   strcat(buf, "control ");
                   ^~~~~~
   drivers/most/core.c:195:3: warning: Call to function 'strcat' is insecur=
e as it does not provide bounding of the memory buffer. Replace unbounded c=
opy functions with analogous functions that support length arguments such a=
s 'strlcat'. CWE-119 [clang-analyzer-security.insecureAPI.strcpy]
                   strcat(buf, "async ");
                   ^~~~~~
   drivers/most/core.c:195:3: note: Call to function 'strcat' is insecure a=
s it does not provide bounding of the memory buffer. Replace unbounded copy=
 functions with analogous functions that support length arguments such as '=
strlcat'. CWE-119
                   strcat(buf, "async ");
                   ^~~~~~
   drivers/most/core.c:197:3: warning: Call to function 'strcat' is insecur=
e as it does not provide bounding of the memory buffer. Replace unbounded c=
opy functions with analogous functions that support length arguments such a=
s 'strlcat'. CWE-119 [clang-analyzer-security.insecureAPI.strcpy]
                   strcat(buf, "sync ");
                   ^~~~~~
   drivers/most/core.c:197:3: note: Call to function 'strcat' is insecure a=
s it does not provide bounding of the memory buffer. Replace unbounded copy=
 functions with analogous functions that support length arguments such as '=
strlcat'. CWE-119
                   strcat(buf, "sync ");
                   ^~~~~~
   drivers/most/core.c:199:3: warning: Call to function 'strcat' is insecur=
e as it does not provide bounding of the memory buffer. Replace unbounded c=
opy functions with analogous functions that support length arguments such a=
s 'strlcat'. CWE-119 [clang-analyzer-security.insecureAPI.strcpy]
                   strcat(buf, "isoc ");
                   ^~~~~~
   drivers/most/core.c:199:3: note: Call to function 'strcat' is insecure a=
s it does not provide bounding of the memory buffer. Replace unbounded copy=
 functions with analogous functions that support length arguments such as '=
strlcat'. CWE-119
                   strcat(buf, "isoc ");
                   ^~~~~~
   drivers/most/core.c:200:2: warning: Call to function 'strcat' is insecur=
e as it does not provide bounding of the memory buffer. Replace unbounded c=
opy functions with analogous functions that support length arguments such a=
s 'strlcat'. CWE-119 [clang-analyzer-security.insecureAPI.strcpy]
           strcat(buf, "\n");
           ^~~~~~
   drivers/most/core.c:200:2: note: Call to function 'strcat' is insecure a=
s it does not provide bounding of the memory buffer. Replace unbounded copy=
 functions with analogous functions that support length arguments such as '=
strlcat'. CWE-119
           strcat(buf, "\n");
           ^~~~~~
   Suppressed 3 warnings (3 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   10 warnings generated.
   drivers/mmc/host/mmc_spi.c:354:4: warning: Value stored to 'end' is neve=
r read [clang-analyzer-deadcode.DeadStores]
                           end =3D cp+1;
                           ^     ~~~~
   drivers/mmc/host/mmc_spi.c:354:4: note: Value stored to 'end' is never r=
ead
                           end =3D cp+1;
                           ^     ~~~~
>> drivers/mmc/host/mmc_spi.c:866:15: warning: Value stored to 'write_or_re=
ad' during its initialization is never read [clang-analyzer-deadcode.DeadSt=
ores]
           const char              *write_or_read =3D (direction =3D=3D DMA=
_TO_DEVICE) ? "write" : "read";
                                    ^~~~~~~~~~~~~   ~~~~~~~~~~~~~~~~~~~~~~~=
~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/mmc/host/mmc_spi.c:866:15: note: Value stored to 'write_or_read'=
 during its initialization is never read
           const char              *write_or_read =3D (direction =3D=3D DMA=
_TO_DEVICE) ? "write" : "read";
                                    ^~~~~~~~~~~~~   ~~~~~~~~~~~~~~~~~~~~~~~=
~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/mmc/host/mmc_spi.c:1076:4: warning: Value stored to 'status' is =
never read [clang-analyzer-deadcode.DeadStores]
                           status =3D mmc_spi_command_send(host, mrq, &stop=
, 0);
                           ^        ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~=
~~
   drivers/mmc/host/mmc_spi.c:1076:4: note: Value stored to 'status' is nev=
er read
                           status =3D mmc_spi_command_send(host, mrq, &stop=
, 0);
                           ^        ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~=
~~
   drivers/mmc/host/mmc_spi.c:1083:4: warning: Value stored to 'status' is =
never read [clang-analyzer-deadcode.DeadStores]
                           status =3D mmc_spi_command_send(host, mrq, mrq->=
stop, 0);
                           ^        ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~=
~~~~~~
   drivers/mmc/host/mmc_spi.c:1083:4: note: Value stored to 'status' is nev=
er read
                           status =3D mmc_spi_command_send(host, mrq, mrq->=
stop, 0);
                           ^        ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~=
~~~~~~
   drivers/mmc/host/mmc_spi.c:1238:3: warning: Value stored to 'status' is =
never read [clang-analyzer-deadcode.DeadStores]
                   status =3D spi_setup(host->spi);
                   ^        ~~~~~~~~~~~~~~~~~~~~
   drivers/mmc/host/mmc_spi.c:1238:3: note: Value stored to 'status' is nev=
er read
                   status =3D spi_setup(host->spi);
                   ^        ~~~~~~~~~~~~~~~~~~~~
   Suppressed 5 warnings (5 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   5 warnings generated.
   Suppressed 5 warnings (5 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   4 warnings generated.
   Suppressed 4 warnings (4 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   7 warnings generated.
   Suppressed 7 warnings (7 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   20 warnings generated.
   Suppressed 20 warnings (8 in non-user code, 12 with check filters).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   9 warnings generated.
   net/ethtool/ioctl.c:2117:4: warning: Called function pointer is null (nu=
ll dereference) [clang-analyzer-core.CallAndMessage]
                           ops->get_ethtool_phy_stats(dev, &stats, data);
                           ^~~~~~~~~~~~~~~~~~~~~~~~~~
   net/ethtool/ioctl.c:2087:6: note: Assuming 'phydev' is non-null
           if (!phydev && (!ops->get_ethtool_phy_stats || !ops->get_sset_co=
unt))
               ^~~~~~~
   net/ethtool/ioctl.c:2087:14: note: Left side of '&&' is false
           if (!phydev && (!ops->get_ethtool_phy_stats || !ops->get_sset_co=
unt))
                       ^
   net/ethtool/ioctl.c:2090:11: note: Field 'phydev' is non-null
           if (dev->phydev && !ops->get_ethtool_phy_stats &&
                    ^
   net/ethtool/ioctl.c:2090:6: note: Left side of '&&' is true
           if (dev->phydev && !ops->get_ethtool_phy_stats &&
               ^
   net/ethtool/ioctl.c:2090:21: note: Assuming field 'get_ethtool_phy_stats=
' is null
           if (dev->phydev && !ops->get_ethtool_phy_stats &&
                              ^~~~~~~~~~~~~~~~~~~~~~~~~~~
   net/ethtool/ioctl.c:2090:6: note: Left side of '&&' is true
           if (dev->phydev && !ops->get_ethtool_phy_stats &&
               ^
   net/ethtool/ioctl.c:2091:6: note: Assuming 'phy_ops' is null
               phy_ops && phy_ops->get_sset_count)
               ^~~~~~~
   net/ethtool/ioctl.c:2091:14: note: Left side of '&&' is false
               phy_ops && phy_ops->get_sset_count)
                       ^
   net/ethtool/ioctl.c:2095:6: note: Assuming 'n_stats' is >=3D 0
           if (n_stats < 0)
               ^~~~~~~~~~~
   net/ethtool/ioctl.c:2095:2: note: Taking false branch
           if (n_stats < 0)
           ^
   net/ethtool/ioctl.c:2097:6: note: Assuming the condition is false
           if (n_stats > S32_MAX / sizeof(u64))
               ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   net/ethtool/ioctl.c:2097:2: note: Taking false branch
           if (n_stats > S32_MAX / sizeof(u64))
           ^
   net/ethtool/ioctl.c:2099:15: note: Assuming 'n_stats' is not equal to 0
           WARN_ON_ONCE(!n_stats);
                        ^
   include/asm-generic/bug.h:104:25: note: expanded from macro 'WARN_ON_ONC=
E'
           int __ret_warn_on =3D !!(condition);                      \
                                  ^~~~~~~~~
   net/ethtool/ioctl.c:2099:2: note: Taking false branch
           WARN_ON_ONCE(!n_stats);
           ^
   include/asm-generic/bug.h:105:2: note: expanded from macro 'WARN_ON_ONCE'
           if (unlikely(__ret_warn_on))                            \
           ^
   net/ethtool/ioctl.c:2101:6: note: Calling 'copy_from_user'
           if (copy_from_user(&stats, useraddr, sizeof(stats)))
               ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/uaccess.h:191:6: note: Assuming the condition is false
           if (likely(check_copy_size(to, n, false)))
               ^
   include/linux/compiler.h:77:38: note: expanded from macro 'likely'
   # define likely(x)      __builtin_expect(!!(x), 1)
                                             ^~~~
   include/linux/uaccess.h:191:2: note: Taking true branch
           if (likely(check_copy_size(to, n, false)))

vim +/write_or_read +866 drivers/mmc/host/mmc_spi.c

15a0580ced081a David Brownell     2007-08-08   849  =

15a0580ced081a David Brownell     2007-08-08   850  /*
15a0580ced081a David Brownell     2007-08-08   851   * An MMC/SD data stage=
 includes one or more blocks, optional CRCs,
15a0580ced081a David Brownell     2007-08-08   852   * and inline handshaki=
ng.  That handhaking makes it unlike most
15a0580ced081a David Brownell     2007-08-08   853   * other SPI protocol s=
tacks.
15a0580ced081a David Brownell     2007-08-08   854   */
15a0580ced081a David Brownell     2007-08-08   855  static void
15a0580ced081a David Brownell     2007-08-08   856  mmc_spi_data_do(struct =
mmc_spi_host *host, struct mmc_command *cmd,
15a0580ced081a David Brownell     2007-08-08   857  		struct mmc_data *data=
, u32 blk_size)
15a0580ced081a David Brownell     2007-08-08   858  {
15a0580ced081a David Brownell     2007-08-08   859  	struct spi_device	*spi=
 =3D host->spi;
15a0580ced081a David Brownell     2007-08-08   860  	struct device		*dma_de=
v =3D host->dma_dev;
15a0580ced081a David Brownell     2007-08-08   861  	struct spi_transfer	*t;
9bd9c67ce7bf89 Andy Shevchenko    2021-12-06   862  	enum dma_data_directio=
n	direction =3D mmc_get_dma_dir(data);
15a0580ced081a David Brownell     2007-08-08   863  	struct scatterlist	*sg;
15a0580ced081a David Brownell     2007-08-08   864  	unsigned		n_sg;
8eb6b82c80c8bd Andy Shevchenko    2021-12-06   865  	bool			multiple =3D (d=
ata->blocks > 1);
9bd9c67ce7bf89 Andy Shevchenko    2021-12-06  @866  	const char		*write_or_=
read =3D (direction =3D=3D DMA_TO_DEVICE) ? "write" : "read";
162350eb75fcb8 Matthew Fleming    2008-10-02   867  	u32			clock_rate;
56e303ebeec7ef Wolfgang Muees     2009-04-07   868  	unsigned long		timeout;
15a0580ced081a David Brownell     2007-08-08   869  =

15a0580ced081a David Brownell     2007-08-08   870  	mmc_spi_setup_data_mes=
sage(host, multiple, direction);
15a0580ced081a David Brownell     2007-08-08   871  	t =3D &host->t;
15a0580ced081a David Brownell     2007-08-08   872  =

162350eb75fcb8 Matthew Fleming    2008-10-02   873  	if (t->speed_hz)
162350eb75fcb8 Matthew Fleming    2008-10-02   874  		clock_rate =3D t->spe=
ed_hz;
162350eb75fcb8 Matthew Fleming    2008-10-02   875  	else
162350eb75fcb8 Matthew Fleming    2008-10-02   876  		clock_rate =3D spi->m=
ax_speed_hz;
162350eb75fcb8 Matthew Fleming    2008-10-02   877  =

81e41be92ad43b Tobias Schramm     2020-08-14   878  	timeout =3D data->time=
out_ns / 1000 +
56e303ebeec7ef Wolfgang Muees     2009-04-07   879  		  data->timeout_clks =
* 1000000 / clock_rate;
81e41be92ad43b Tobias Schramm     2020-08-14   880  	timeout =3D usecs_to_j=
iffies((unsigned int)timeout) + 1;
162350eb75fcb8 Matthew Fleming    2008-10-02   881  =

15a0580ced081a David Brownell     2007-08-08   882  	/* Handle scatterlist =
segments one at a time, with synch for
15a0580ced081a David Brownell     2007-08-08   883  	 * each 512-byte block
15a0580ced081a David Brownell     2007-08-08   884  	 */
b8deb11dbab03d Andy Shevchenko    2019-08-30   885  	for_each_sg(data->sg, =
sg, data->sg_len, n_sg) {
15a0580ced081a David Brownell     2007-08-08   886  		int			status =3D 0;
15a0580ced081a David Brownell     2007-08-08   887  		dma_addr_t		dma_addr =
=3D 0;
15a0580ced081a David Brownell     2007-08-08   888  		void			*kmap_addr;
15a0580ced081a David Brownell     2007-08-08   889  		unsigned		length =3D =
sg->length;
15a0580ced081a David Brownell     2007-08-08   890  		enum dma_data_directi=
on	dir =3D direction;
15a0580ced081a David Brownell     2007-08-08   891  =

15a0580ced081a David Brownell     2007-08-08   892  		/* set up dma mapping=
 for controller drivers that might
15a0580ced081a David Brownell     2007-08-08   893  		 * use DMA ... though=
 they may fall back to PIO
15a0580ced081a David Brownell     2007-08-08   894  		 */
15a0580ced081a David Brownell     2007-08-08   895  		if (dma_dev) {
15a0580ced081a David Brownell     2007-08-08   896  			/* never invalidate =
whole *shared* pages ... */
15a0580ced081a David Brownell     2007-08-08   897  			if ((sg->offset !=3D=
 0 || length !=3D PAGE_SIZE)
15a0580ced081a David Brownell     2007-08-08   898  					&& dir =3D=3D DMA_=
FROM_DEVICE)
15a0580ced081a David Brownell     2007-08-08   899  				dir =3D DMA_BIDIREC=
TIONAL;
15a0580ced081a David Brownell     2007-08-08   900  =

45711f1af6eff1 Jens Axboe         2007-10-22   901  			dma_addr =3D dma_map=
_page(dma_dev, sg_page(sg), 0,
15a0580ced081a David Brownell     2007-08-08   902  						PAGE_SIZE, dir);
b00663124c76f6 Alexey Khoroshilov 2016-02-06   903  			if (dma_mapping_erro=
r(dma_dev, dma_addr)) {
b00663124c76f6 Alexey Khoroshilov 2016-02-06   904  				data->error =3D -EF=
AULT;
b00663124c76f6 Alexey Khoroshilov 2016-02-06   905  				break;
b00663124c76f6 Alexey Khoroshilov 2016-02-06   906  			}
15a0580ced081a David Brownell     2007-08-08   907  			if (direction =3D=3D=
 DMA_TO_DEVICE)
15a0580ced081a David Brownell     2007-08-08   908  				t->tx_dma =3D dma_a=
ddr + sg->offset;
15a0580ced081a David Brownell     2007-08-08   909  			else
15a0580ced081a David Brownell     2007-08-08   910  				t->rx_dma =3D dma_a=
ddr + sg->offset;
15a0580ced081a David Brownell     2007-08-08   911  		}
15a0580ced081a David Brownell     2007-08-08   912  =

15a0580ced081a David Brownell     2007-08-08   913  		/* allow pio too; we =
don't allow highmem */
45711f1af6eff1 Jens Axboe         2007-10-22   914  		kmap_addr =3D kmap(sg=
_page(sg));
15a0580ced081a David Brownell     2007-08-08   915  		if (direction =3D=3D =
DMA_TO_DEVICE)
15a0580ced081a David Brownell     2007-08-08   916  			t->tx_buf =3D kmap_a=
ddr + sg->offset;
15a0580ced081a David Brownell     2007-08-08   917  		else
15a0580ced081a David Brownell     2007-08-08   918  			t->rx_buf =3D kmap_a=
ddr + sg->offset;
15a0580ced081a David Brownell     2007-08-08   919  =

15a0580ced081a David Brownell     2007-08-08   920  		/* transfer each bloc=
k, and update request status */
15a0580ced081a David Brownell     2007-08-08   921  		while (length) {
15a0580ced081a David Brownell     2007-08-08   922  			t->len =3D min(lengt=
h, blk_size);
15a0580ced081a David Brownell     2007-08-08   923  =

9bd9c67ce7bf89 Andy Shevchenko    2021-12-06   924  			dev_dbg(&spi->dev, "=
    %s block, %d bytes\n", write_or_read, t->len);
15a0580ced081a David Brownell     2007-08-08   925  =

15a0580ced081a David Brownell     2007-08-08   926  			if (direction =3D=3D=
 DMA_TO_DEVICE)
162350eb75fcb8 Matthew Fleming    2008-10-02   927  				status =3D mmc_spi_=
writeblock(host, t, timeout);
15a0580ced081a David Brownell     2007-08-08   928  			else
162350eb75fcb8 Matthew Fleming    2008-10-02   929  				status =3D mmc_spi_=
readblock(host, t, timeout);
15a0580ced081a David Brownell     2007-08-08   930  			if (status < 0)
15a0580ced081a David Brownell     2007-08-08   931  				break;
15a0580ced081a David Brownell     2007-08-08   932  =

15a0580ced081a David Brownell     2007-08-08   933  			data->bytes_xfered +=
=3D t->len;
15a0580ced081a David Brownell     2007-08-08   934  			length -=3D t->len;
15a0580ced081a David Brownell     2007-08-08   935  =

15a0580ced081a David Brownell     2007-08-08   936  			if (!multiple)
15a0580ced081a David Brownell     2007-08-08   937  				break;
15a0580ced081a David Brownell     2007-08-08   938  		}
15a0580ced081a David Brownell     2007-08-08   939  =

15a0580ced081a David Brownell     2007-08-08   940  		/* discard mappings */
15a0580ced081a David Brownell     2007-08-08   941  		if (direction =3D=3D =
DMA_FROM_DEVICE)
64a05fe645e27a Christoph Hellwig  2021-09-02   942  			flush_dcache_page(sg=
_page(sg));
45711f1af6eff1 Jens Axboe         2007-10-22   943  		kunmap(sg_page(sg));
15a0580ced081a David Brownell     2007-08-08   944  		if (dma_dev)
15a0580ced081a David Brownell     2007-08-08   945  			dma_unmap_page(dma_d=
ev, dma_addr, PAGE_SIZE, dir);
15a0580ced081a David Brownell     2007-08-08   946  =

15a0580ced081a David Brownell     2007-08-08   947  		if (status < 0) {
15a0580ced081a David Brownell     2007-08-08   948  			data->error =3D stat=
us;
9bd9c67ce7bf89 Andy Shevchenko    2021-12-06   949  			dev_dbg(&spi->dev, "=
%s status %d\n", write_or_read, status);
15a0580ced081a David Brownell     2007-08-08   950  			break;
15a0580ced081a David Brownell     2007-08-08   951  		}
15a0580ced081a David Brownell     2007-08-08   952  	}
15a0580ced081a David Brownell     2007-08-08   953  =

15a0580ced081a David Brownell     2007-08-08   954  	/* NOTE some docs desc=
ribe an MMC-only SET_BLOCK_COUNT (CMD23) that
15a0580ced081a David Brownell     2007-08-08   955  	 * can be issued befor=
e multiblock writes.  Unlike its more widely
15a0580ced081a David Brownell     2007-08-08   956  	 * documented analogue=
 for SD cards (SET_WR_BLK_ERASE_COUNT, ACMD23),
15a0580ced081a David Brownell     2007-08-08   957  	 * that can affect the=
 STOP_TRAN logic.   Complete (and current)
15a0580ced081a David Brownell     2007-08-08   958  	 * MMC specs should so=
rt that out before Linux starts using CMD23.
15a0580ced081a David Brownell     2007-08-08   959  	 */
15a0580ced081a David Brownell     2007-08-08   960  	if (direction =3D=3D D=
MA_TO_DEVICE && multiple) {
15a0580ced081a David Brownell     2007-08-08   961  		struct scratch	*scrat=
ch =3D host->data;
15a0580ced081a David Brownell     2007-08-08   962  		int		tmp;
15a0580ced081a David Brownell     2007-08-08   963  		const unsigned	statle=
n =3D sizeof(scratch->status);
15a0580ced081a David Brownell     2007-08-08   964  =

91445d5eed6b19 Andy Shevchenko    2021-05-28   965  		dev_dbg(&spi->dev, " =
   STOP_TRAN\n");
15a0580ced081a David Brownell     2007-08-08   966  =

15a0580ced081a David Brownell     2007-08-08   967  		/* Tweak the per-bloc=
k message we set up earlier by morphing
15a0580ced081a David Brownell     2007-08-08   968  		 * it to hold single =
buffer with the token followed by some
15a0580ced081a David Brownell     2007-08-08   969  		 * all-ones bytes ...=
 skip N(BR) (0..1), scan the rest for
15a0580ced081a David Brownell     2007-08-08   970  		 * "not busy any long=
er" status, and leave chip selected.
15a0580ced081a David Brownell     2007-08-08   971  		 */
15a0580ced081a David Brownell     2007-08-08   972  		INIT_LIST_HEAD(&host-=
>m.transfers);
15a0580ced081a David Brownell     2007-08-08   973  		list_add(&host->early=
_status.transfer_list,
15a0580ced081a David Brownell     2007-08-08   974  				&host->m.transfers);
15a0580ced081a David Brownell     2007-08-08   975  =

15a0580ced081a David Brownell     2007-08-08   976  		memset(scratch->statu=
s, 0xff, statlen);
15a0580ced081a David Brownell     2007-08-08   977  		scratch->status[0] =
=3D SPI_TOKEN_STOP_TRAN;
15a0580ced081a David Brownell     2007-08-08   978  =

15a0580ced081a David Brownell     2007-08-08   979  		host->early_status.tx=
_buf =3D host->early_status.rx_buf;
15a0580ced081a David Brownell     2007-08-08   980  		host->early_status.tx=
_dma =3D host->early_status.rx_dma;
15a0580ced081a David Brownell     2007-08-08   981  		host->early_status.le=
n =3D statlen;
15a0580ced081a David Brownell     2007-08-08   982  =

15a0580ced081a David Brownell     2007-08-08   983  		if (host->dma_dev)
15a0580ced081a David Brownell     2007-08-08   984  			dma_sync_single_for_=
device(host->dma_dev,
15a0580ced081a David Brownell     2007-08-08   985  					host->data_dma, si=
zeof(*scratch),
15a0580ced081a David Brownell     2007-08-08   986  					DMA_BIDIRECTIONAL);
15a0580ced081a David Brownell     2007-08-08   987  =

4751c1c74bc7b5 Ernst Schwab       2010-02-18   988  		tmp =3D spi_sync_lock=
ed(spi, &host->m);
15a0580ced081a David Brownell     2007-08-08   989  =

15a0580ced081a David Brownell     2007-08-08   990  		if (host->dma_dev)
15a0580ced081a David Brownell     2007-08-08   991  			dma_sync_single_for_=
cpu(host->dma_dev,
15a0580ced081a David Brownell     2007-08-08   992  					host->data_dma, si=
zeof(*scratch),
15a0580ced081a David Brownell     2007-08-08   993  					DMA_BIDIRECTIONAL);
15a0580ced081a David Brownell     2007-08-08   994  =

15a0580ced081a David Brownell     2007-08-08   995  		if (tmp < 0) {
15a0580ced081a David Brownell     2007-08-08   996  			if (!data->error)
15a0580ced081a David Brownell     2007-08-08   997  				data->error =3D tmp;
15a0580ced081a David Brownell     2007-08-08   998  			return;
15a0580ced081a David Brownell     2007-08-08   999  		}
15a0580ced081a David Brownell     2007-08-08  1000  =

15a0580ced081a David Brownell     2007-08-08  1001  		/* Ideally we collect=
ed "not busy" status with one I/O,
15a0580ced081a David Brownell     2007-08-08  1002  		 * avoiding wasteful =
byte-at-a-time scanning... but more
15a0580ced081a David Brownell     2007-08-08  1003  		 * I/O is often neede=
d.
15a0580ced081a David Brownell     2007-08-08  1004  		 */
15a0580ced081a David Brownell     2007-08-08  1005  		for (tmp =3D 2; tmp <=
 statlen; tmp++) {
15a0580ced081a David Brownell     2007-08-08  1006  			if (scratch->status[=
tmp] !=3D 0)
15a0580ced081a David Brownell     2007-08-08  1007  				return;
15a0580ced081a David Brownell     2007-08-08  1008  		}
162350eb75fcb8 Matthew Fleming    2008-10-02  1009  		tmp =3D mmc_spi_wait_=
unbusy(host, timeout);
15a0580ced081a David Brownell     2007-08-08  1010  		if (tmp < 0 && !data-=
>error)
15a0580ced081a David Brownell     2007-08-08  1011  			data->error =3D tmp;
15a0580ced081a David Brownell     2007-08-08  1012  	}
15a0580ced081a David Brownell     2007-08-08  1013  }
15a0580ced081a David Brownell     2007-08-08  1014  =


---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all(a)lists.01.org
--===============1784658388398966703==--

