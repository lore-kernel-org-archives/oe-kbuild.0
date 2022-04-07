Content-Type: multipart/mixed; boundary="===============8323583100743572857=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: drivers/media/platform/atmel/atmel-isc-clk.c:125:18: warning: Value stored to 'isc_clk' during its initialization is never read [clang-analyzer-deadcode.DeadStores]
Date: Thu, 07 Apr 2022 20:51:38 +0800
Message-ID: <202204072054.8OocMxHK-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============8323583100743572857==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

CC: llvm(a)lists.linux.dev
CC: kbuild-all(a)lists.01.org
BCC: lkp(a)intel.com
CC: linux-kernel(a)vger.kernel.org
TO: Eugen Hristev <eugen.hristev@microchip.com>
CC: Mauro Carvalho Chehab <mchehab@kernel.org>
CC: linux-media(a)vger.kernel.org
CC: Jacopo Mondi <jacopo+renesas@jmondi.org>
CC: Hans Verkuil <hverkuil@xs4all.nl>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git =
master
head:   3e732ebf7316ac83e8562db7e64cc68aec390a18
commit: 118bf76a35bc2ed061cd1454fe5e57d1c7bcd8d0 media: atmel: atmel-isc: s=
plit the clock code into separate source file
date:   2 months ago
:::::: branch date: 2 days ago
:::::: commit date: 2 months ago
config: arm-randconfig-c002-20220407 (https://download.01.org/0day-ci/archi=
ve/20220407/202204072054.8OocMxHK-lkp(a)intel.com/config)
compiler: clang version 15.0.0 (https://github.com/llvm/llvm-project 6b3062=
33f78876a1d197ed6e1f05785505de7c63)
reproduce (this is a W=3D1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/=
make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # install arm cross compiling tool for clang build
        # apt-get install binutils-arm-linux-gnueabi
        # https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.gi=
t/commit/?id=3D118bf76a35bc2ed061cd1454fe5e57d1c7bcd8d0
        git remote add linus https://git.kernel.org/pub/scm/linux/kernel/gi=
t/torvalds/linux.git
        git fetch --no-tags linus master
        git checkout 118bf76a35bc2ed061cd1454fe5e57d1c7bcd8d0
        # save the config file to linux build tree
        COMPILER_INSTALL_PATH=3D$HOME/0day COMPILER=3Dclang make.cross ARCH=
=3Darm clang-analyzer =


If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>


clang-analyzer warnings: (new ones prefixed by >>)
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   1 warning generated.
   Suppressed 1 warnings (1 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   1 warning generated.
   Suppressed 1 warnings (1 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   2 warnings generated.
   drivers/iio/adc/ti-ads8688.c:64:8: warning: Excessive padding in 'struct=
 ads8688_state' (44 padding bytes, where 12 is optimal). =

   Optimal fields order: =

   data, =

   chip_info, =

   spi, =

   reg, =

   vref_mv, =

   lock, =

   range, =

   consider reordering the fields or adding explicit padding members [clang=
-analyzer-optin.performance.Padding]
   struct ads8688_state {
   ~~~~~~~^~~~~~~~~~~~~~~
   drivers/iio/adc/ti-ads8688.c:64:8: note: Excessive padding in 'struct ad=
s8688_state' (44 padding bytes, where 12 is optimal). Optimal fields order:=
 data, chip_info, spi, reg, vref_mv, lock, range, consider reordering the f=
ields or adding explicit padding members
   struct ads8688_state {
   ~~~~~~~^~~~~~~~~~~~~~~
   Suppressed 1 warnings (1 with check filters).
   1 warning generated.
   drivers/iio/adc/twl6030-gpadc.c:911:2: warning: Value stored to 'ret' is=
 never read [clang-analyzer-deadcode.DeadStores]
           ret =3D devm_request_threaded_irq(dev, irq, NULL,
           ^     ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/iio/adc/twl6030-gpadc.c:911:2: note: Value stored to 'ret' is ne=
ver read
           ret =3D devm_request_threaded_irq(dev, irq, NULL,
           ^     ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   2 warnings generated.
   Suppressed 2 warnings (1 in non-user code, 1 with check filters).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   2 warnings generated.
   Suppressed 2 warnings (1 in non-user code, 1 with check filters).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   3 warnings generated.
   net/strparser/strparser.c:161:5: warning: Value stored to 'head' is neve=
r read [clang-analyzer-deadcode.DeadStores]
                                   head =3D skb;
                                   ^      ~~~
   net/strparser/strparser.c:161:5: note: Value stored to 'head' is never r=
ead
                                   head =3D skb;
                                   ^      ~~~
   Suppressed 2 warnings (1 in non-user code, 1 with check filters).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   3 warnings generated.
   fs/ext4/page-io.c:325:11: warning: Value stored to 'bi_sector' during it=
s initialization is never read [clang-analyzer-deadcode.DeadStores]
           sector_t bi_sector =3D bio->bi_iter.bi_sector;
                    ^~~~~~~~~   ~~~~~~~~~~~~~~~~~~~~~~
   fs/ext4/page-io.c:325:11: note: Value stored to 'bi_sector' during its i=
nitialization is never read
           sector_t bi_sector =3D bio->bi_iter.bi_sector;
                    ^~~~~~~~~   ~~~~~~~~~~~~~~~~~~~~~~
   Suppressed 2 warnings (2 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   1 warning generated.
   Suppressed 1 warnings (1 with check filters).
   1 warning generated.
   drivers/iio/proximity/vcnl3020.c:76:8: warning: Excessive padding in 'st=
ruct vcnl3020_data' (57 padding bytes, where 25 is optimal). =

   Optimal fields order: =

   buf, =

   rev, =

   regmap, =

   dev, =

   lock, =

   consider reordering the fields or adding explicit padding members [clang=
-analyzer-optin.performance.Padding]
   struct vcnl3020_data {
   ~~~~~~~^~~~~~~~~~~~~~~
   drivers/iio/proximity/vcnl3020.c:76:8: note: Excessive padding in 'struc=
t vcnl3020_data' (57 padding bytes, where 25 is optimal). Optimal fields or=
der: buf, rev, regmap, dev, lock, consider reordering the fields or adding =
explicit padding members
   struct vcnl3020_data {
   ~~~~~~~^~~~~~~~~~~~~~~
   5 warnings generated.
   Suppressed 5 warnings (1 in non-user code, 4 with check filters).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   4 warnings generated.
   Suppressed 4 warnings (4 with check filters).
   1 warning generated.
   Suppressed 1 warnings (1 with check filters).
   3 warnings generated.
   net/unix/af_unix.c:1684:3: warning: Value stored to 'err' is never read =
[clang-analyzer-deadcode.DeadStores]
                   err =3D 0;
                   ^     ~
   net/unix/af_unix.c:1684:3: note: Value stored to 'err' is never read
                   err =3D 0;
                   ^     ~
   net/unix/af_unix.c:2689:3: warning: Value stored to 'err' is never read =
[clang-analyzer-deadcode.DeadStores]
                   err =3D -EOPNOTSUPP;
                   ^     ~~~~~~~~~~~
   net/unix/af_unix.c:2689:3: note: Value stored to 'err' is never read
                   err =3D -EOPNOTSUPP;
                   ^     ~~~~~~~~~~~
   Suppressed 1 warnings (1 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   1 warning generated.
   Suppressed 1 warnings (1 with check filters).
   1 warning generated.
   Suppressed 1 warnings (1 with check filters).
   1 warning generated.
   Suppressed 1 warnings (1 with check filters).
   2 warnings generated.
>> drivers/media/platform/atmel/atmel-isc-clk.c:125:18: warning: Value stor=
ed to 'isc_clk' during its initialization is never read [clang-analyzer-dea=
dcode.DeadStores]
           struct isc_clk *isc_clk =3D to_isc_clk(hw);
                           ^~~~~~~
   drivers/media/platform/atmel/atmel-isc-clk.c:125:18: note: Value stored =
to 'isc_clk' during its initialization is never read
           struct isc_clk *isc_clk =3D to_isc_clk(hw);
                           ^~~~~~~
   Suppressed 1 warnings (1 with check filters).
   1 warning generated.
   Suppressed 1 warnings (1 with check filters).
   1 warning generated.
   Suppressed 1 warnings (1 with check filters).
   1 warning generated.
   Suppressed 1 warnings (1 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   1 warning generated.
   net/ieee802154/nl-mac.c:529:2: warning: Value stored to 'rc' is never re=
ad [clang-analyzer-deadcode.DeadStores]
           rc =3D ops->set_mac_params(dev, &params);
           ^    ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   net/ieee802154/nl-mac.c:529:2: note: Value stored to 'rc' is never read
           rc =3D ops->set_mac_params(dev, &params);
           ^    ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   1 warning generated.
   Suppressed 1 warnings (1 with check filters).
   3 warnings generated.
   net/ipv4/udp.c:742:2: warning: Value stored to 'err' is never read [clan=
g-analyzer-deadcode.DeadStores]
           err =3D 0;
           ^     ~
   net/ipv4/udp.c:742:2: note: Value stored to 'err' is never read
           err =3D 0;
           ^     ~
   Suppressed 2 warnings (1 in non-user code, 1 with check filters).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   1 warning generated.
   Suppressed 1 warnings (1 with check filters).
   1 warning generated.
   drivers/iio/potentiometer/ad5272.c:49:8: warning: Excessive padding in '=
struct ad5272_data' (58 padding bytes, where 26 is optimal). =

   Optimal fields order: =

   buf, =

   client, =

   cfg, =

   lock, =

   consider reordering the fields or adding explicit padding members [clang=
-analyzer-optin.performance.Padding]
   struct ad5272_data {
   ~~~~~~~^~~~~~~~~~~~~
   drivers/iio/potentiometer/ad5272.c:49:8: note: Excessive padding in 'str=
uct ad5272_data' (58 padding bytes, where 26 is optimal). Optimal fields or=
der: buf, client, cfg, lock, consider reordering the fields or adding expli=
cit padding members
   struct ad5272_data {
   ~~~~~~~^~~~~~~~~~~~~
   1 warning generated.
   Suppressed 1 warnings (1 with check filters).
   4 warnings generated.
   net/ipv4/route.c:879:2: warning: Value stored to 'log_martians' is never=
 read [clang-analyzer-deadcode.DeadStores]
           log_martians =3D IN_DEV_LOG_MARTIANS(in_dev);
           ^
   net/ipv4/route.c:879:2: note: Value stored to 'log_martians' is never re=
ad
   Suppressed 3 warnings (1 in non-user code, 2 with check filters).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   1 warning generated.
   Suppressed 1 warnings (1 with check filters).
   1 warning generated.
   Suppressed 1 warnings (1 with check filters).
   2 warnings generated.
   net/ipv4/ip_fragment.c:619:3: warning: Argument to kfree() is the addres=
s of the global variable 'ip4_frags_ns_ctl_table', which is not memory allo=
cated by malloc() [clang-analyzer-unix.Malloc]
                   kfree(table);
                   ^
   net/ipv4/ip_fragment.c:657:6: note: Assuming 'res' is >=3D 0
           if (res < 0)
               ^~~~~~~
   net/ipv4/ip_fragment.c:657:2: note: Taking false branch
           if (res < 0)
           ^
   net/ipv4/ip_fragment.c:684:8: note: Calling 'ip4_frags_ns_ctl_register'
           res =3D ip4_frags_ns_ctl_register(net);
                 ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   net/ipv4/ip_fragment.c:597:6: note: Assuming the condition is false
           if (!net_eq(net, &init_net)) {
               ^~~~~~~~~~~~~~~~~~~~~~~
   net/ipv4/ip_fragment.c:597:2: note: Taking false branch
           if (!net_eq(net, &init_net)) {
           ^
   net/ipv4/ip_fragment.c:611:6: note: Assuming 'hdr' is null
           if (!hdr)
               ^~~~
   net/ipv4/ip_fragment.c:611:2: note: Taking true branch
           if (!hdr)
           ^
   net/ipv4/ip_fragment.c:612:3: note: Control jumps to line 618
                   goto err_reg;
                   ^
   net/ipv4/ip_fragment.c:618:6: note: Assuming the condition is true
           if (!net_eq(net, &init_net))
               ^~~~~~~~~~~~~~~~~~~~~~~
   net/ipv4/ip_fragment.c:618:2: note: Taking true branch
           if (!net_eq(net, &init_net))
           ^
   net/ipv4/ip_fragment.c:619:3: note: Argument to kfree() is the address o=
f the global variable 'ip4_frags_ns_ctl_table', which is not memory allocat=
ed by malloc()
                   kfree(table);
                   ^     ~~~~~
   Suppressed 1 warnings (1 with check filters).
   14 warnings generated.
   Suppressed 14 warnings (1 in non-user code, 13 with check filters).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.

vim +/isc_clk +125 drivers/media/platform/atmel/atmel-isc-clk.c

118bf76a35bc2e Eugen Hristev 2021-12-13  121  =

118bf76a35bc2e Eugen Hristev 2021-12-13  122  static int isc_clk_determine_=
rate(struct clk_hw *hw,
118bf76a35bc2e Eugen Hristev 2021-12-13  123  				  struct clk_rate_request=
 *req)
118bf76a35bc2e Eugen Hristev 2021-12-13  124  {
118bf76a35bc2e Eugen Hristev 2021-12-13 @125  	struct isc_clk *isc_clk =3D =
to_isc_clk(hw);
118bf76a35bc2e Eugen Hristev 2021-12-13  126  	long best_rate =3D -EINVAL;
118bf76a35bc2e Eugen Hristev 2021-12-13  127  	int best_diff =3D -1;
118bf76a35bc2e Eugen Hristev 2021-12-13  128  	unsigned int i, div;
118bf76a35bc2e Eugen Hristev 2021-12-13  129  =

118bf76a35bc2e Eugen Hristev 2021-12-13  130  	for (i =3D 0; i < clk_hw_get=
_num_parents(hw); i++) {
118bf76a35bc2e Eugen Hristev 2021-12-13  131  		struct clk_hw *parent;
118bf76a35bc2e Eugen Hristev 2021-12-13  132  		unsigned long parent_rate;
118bf76a35bc2e Eugen Hristev 2021-12-13  133  =

118bf76a35bc2e Eugen Hristev 2021-12-13  134  		parent =3D clk_hw_get_paren=
t_by_index(hw, i);
118bf76a35bc2e Eugen Hristev 2021-12-13  135  		if (!parent)
118bf76a35bc2e Eugen Hristev 2021-12-13  136  			continue;
118bf76a35bc2e Eugen Hristev 2021-12-13  137  =

118bf76a35bc2e Eugen Hristev 2021-12-13  138  		parent_rate =3D clk_hw_get_=
rate(parent);
118bf76a35bc2e Eugen Hristev 2021-12-13  139  		if (!parent_rate)
118bf76a35bc2e Eugen Hristev 2021-12-13  140  			continue;
118bf76a35bc2e Eugen Hristev 2021-12-13  141  =

118bf76a35bc2e Eugen Hristev 2021-12-13  142  		for (div =3D 1; div < ISC_C=
LK_MAX_DIV + 2; div++) {
118bf76a35bc2e Eugen Hristev 2021-12-13  143  			unsigned long rate;
118bf76a35bc2e Eugen Hristev 2021-12-13  144  			int diff;
118bf76a35bc2e Eugen Hristev 2021-12-13  145  =

118bf76a35bc2e Eugen Hristev 2021-12-13  146  			rate =3D DIV_ROUND_CLOSEST=
(parent_rate, div);
118bf76a35bc2e Eugen Hristev 2021-12-13  147  			diff =3D abs(req->rate - r=
ate);
118bf76a35bc2e Eugen Hristev 2021-12-13  148  =

118bf76a35bc2e Eugen Hristev 2021-12-13  149  			if (best_diff < 0 || best_=
diff > diff) {
118bf76a35bc2e Eugen Hristev 2021-12-13  150  				best_rate =3D rate;
118bf76a35bc2e Eugen Hristev 2021-12-13  151  				best_diff =3D diff;
118bf76a35bc2e Eugen Hristev 2021-12-13  152  				req->best_parent_rate =3D=
 parent_rate;
118bf76a35bc2e Eugen Hristev 2021-12-13  153  				req->best_parent_hw =3D p=
arent;
118bf76a35bc2e Eugen Hristev 2021-12-13  154  			}
118bf76a35bc2e Eugen Hristev 2021-12-13  155  =

118bf76a35bc2e Eugen Hristev 2021-12-13  156  			if (!best_diff || rate < r=
eq->rate)
118bf76a35bc2e Eugen Hristev 2021-12-13  157  				break;
118bf76a35bc2e Eugen Hristev 2021-12-13  158  		}
118bf76a35bc2e Eugen Hristev 2021-12-13  159  =

118bf76a35bc2e Eugen Hristev 2021-12-13  160  		if (!best_diff)
118bf76a35bc2e Eugen Hristev 2021-12-13  161  			break;
118bf76a35bc2e Eugen Hristev 2021-12-13  162  	}
118bf76a35bc2e Eugen Hristev 2021-12-13  163  =

118bf76a35bc2e Eugen Hristev 2021-12-13  164  	dev_dbg(isc_clk->dev,
118bf76a35bc2e Eugen Hristev 2021-12-13  165  		"ISC CLK: %s, best_rate =3D=
 %ld, parent clk: %s @ %ld\n",
118bf76a35bc2e Eugen Hristev 2021-12-13  166  		__func__, best_rate,
118bf76a35bc2e Eugen Hristev 2021-12-13  167  		__clk_get_name((req->best_p=
arent_hw)->clk),
118bf76a35bc2e Eugen Hristev 2021-12-13  168  		req->best_parent_rate);
118bf76a35bc2e Eugen Hristev 2021-12-13  169  =

118bf76a35bc2e Eugen Hristev 2021-12-13  170  	if (best_rate < 0)
118bf76a35bc2e Eugen Hristev 2021-12-13  171  		return best_rate;
118bf76a35bc2e Eugen Hristev 2021-12-13  172  =

118bf76a35bc2e Eugen Hristev 2021-12-13  173  	req->rate =3D best_rate;
118bf76a35bc2e Eugen Hristev 2021-12-13  174  =

118bf76a35bc2e Eugen Hristev 2021-12-13  175  	return 0;
118bf76a35bc2e Eugen Hristev 2021-12-13  176  }
118bf76a35bc2e Eugen Hristev 2021-12-13  177  =


-- =

0-DAY CI Kernel Test Service
https://01.org/lkp
--===============8323583100743572857==--

