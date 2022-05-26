Content-Type: multipart/mixed; boundary="===============2295401903171944136=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: Re: [PATCH v3 2/3] phy: handle optional regulator for PHY
Date: Thu, 26 May 2022 21:30:55 +0800
Message-ID: <202205262148.yIpMLEH0-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============2295401903171944136==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

CC: llvm(a)lists.linux.dev
CC: kbuild-all(a)lists.01.org
BCC: lkp(a)intel.com
In-Reply-To: <20220523052807.4044800-3-clabbe@baylibre.com>
References: <20220523052807.4044800-3-clabbe@baylibre.com>
TO: Corentin Labbe <clabbe@baylibre.com>
TO: andrew(a)lunn.ch
TO: broonie(a)kernel.org
TO: calvin.johnson(a)oss.nxp.com
TO: davem(a)davemloft.net
TO: edumazet(a)google.com
TO: hkallweit1(a)gmail.com
TO: jernej.skrabec(a)gmail.com
TO: krzysztof.kozlowski+dt(a)linaro.org
TO: kuba(a)kernel.org
TO: lgirdwood(a)gmail.com
TO: linux(a)armlinux.org.uk
TO: pabeni(a)redhat.com
TO: robh+dt(a)kernel.org
TO: samuel(a)sholland.org
TO: wens(a)csie.org
CC: devicetree(a)vger.kernel.org
CC: linux-arm-kernel(a)lists.infradead.org
CC: linux-kernel(a)vger.kernel.org
CC: linux-sunxi(a)lists.linux.dev
CC: netdev(a)vger.kernel.org
CC: Corentin Labbe <clabbe@baylibre.com>

Hi Corentin,

I love your patch! Perhaps something to improve:

[auto build test WARNING on broonie-regulator/for-next]
[also build test WARNING on sunxi/sunxi/for-next linus/master v5.18 next-20=
220525]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch]

url:    https://github.com/intel-lab-lkp/linux/commits/Corentin-Labbe/arm64=
-add-ethernet-to-orange-pi-3/20220523-133344
base:   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/regulator.g=
it for-next
:::::: branch date: 3 days ago
:::::: commit date: 3 days ago
config: arm-randconfig-c002-20220522 (https://download.01.org/0day-ci/archi=
ve/20220526/202205262148.yIpMLEH0-lkp(a)intel.com/config)
compiler: clang version 15.0.0 (https://github.com/llvm/llvm-project 10c9ec=
ce9f6096e18222a331c5e7d085bd813f75)
reproduce (this is a W=3D1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/=
make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # install arm cross compiling tool for clang build
        # apt-get install binutils-arm-linux-gnueabi
        # https://github.com/intel-lab-lkp/linux/commit/7ae2ab7d1efe8091f6b=
7ea048a7ac495afba9e46
        git remote add linux-review https://github.com/intel-lab-lkp/linux
        git fetch --no-tags linux-review Corentin-Labbe/arm64-add-ethernet-=
to-orange-pi-3/20220523-133344
        git checkout 7ae2ab7d1efe8091f6b7ea048a7ac495afba9e46
        # save the config file
        COMPILER_INSTALL_PATH=3D$HOME/0day COMPILER=3Dclang make.cross ARCH=
=3Darm clang-analyzer =


If you fix the issue, kindly add following tag where applicable
Reported-by: kernel test robot <lkp@intel.com>


clang-analyzer warnings: (new ones prefixed by >>)
           ^
   kernel/bpf/lpm_trie.c:704:24: note: Access to field 'prefixlen' results =
in a dereference of a null pointer (loaded from variable 'next_node')
           next_key->prefixlen =3D next_node->prefixlen;
                                 ^~~~~~~~~
   kernel/bpf/lpm_trie.c:705:2: warning: Call to function 'memcpy' is insec=
ure as it does not provide security checks introduced in the C11 standard. =
Replace with analogous functions that support length arguments or provides =
boundary checks such as 'memcpy_s' in case of C11 [clang-analyzer-security.=
insecureAPI.DeprecatedOrUnsafeBufferHandling]
           memcpy((void *)next_key + offsetof(struct bpf_lpm_trie_key, data=
),
           ^~~~~~
   kernel/bpf/lpm_trie.c:705:2: note: Call to function 'memcpy' is insecure=
 as it does not provide security checks introduced in the C11 standard. Rep=
lace with analogous functions that support length arguments or provides bou=
ndary checks such as 'memcpy_s' in case of C11
           memcpy((void *)next_key + offsetof(struct bpf_lpm_trie_key, data=
),
           ^~~~~~
   Suppressed 94 warnings (94 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   58 warnings generated.
   arch/arm/kernel/signal.c:173:2: warning: Value stored to 'aux' is never =
read [clang-analyzer-deadcode.DeadStores]
           aux =3D (char __user *) sf->uc.uc_regspace;
           ^     ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   arch/arm/kernel/signal.c:173:2: note: Value stored to 'aux' is never read
           aux =3D (char __user *) sf->uc.uc_regspace;
           ^     ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   arch/arm/kernel/signal.c:662:2: warning: Call to function 'memcpy' is in=
secure as it does not provide security checks introduced in the C11 standar=
d. Replace with analogous functions that support length arguments or provid=
es boundary checks such as 'memcpy_s' in case of C11 [clang-analyzer-securi=
ty.insecureAPI.DeprecatedOrUnsafeBufferHandling]
           memcpy(addr + offset, sigreturn_codes, sizeof(sigreturn_codes));
           ^~~~~~
   arch/arm/kernel/signal.c:662:2: note: Call to function 'memcpy' is insec=
ure as it does not provide security checks introduced in the C11 standard. =
Replace with analogous functions that support length arguments or provides =
boundary checks such as 'memcpy_s' in case of C11
           memcpy(addr + offset, sigreturn_codes, sizeof(sigreturn_codes));
           ^~~~~~
   Suppressed 56 warnings (52 in non-user code, 4 with check filters).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   43 warnings generated.
   Suppressed 43 warnings (43 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   44 warnings generated.
   Suppressed 44 warnings (43 in non-user code, 1 with check filters).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   16 warnings generated.
   Suppressed 16 warnings (15 in non-user code, 1 with check filters).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   61 warnings generated.
   arch/arm/kernel/traps.c:105:9: warning: Call to function 'sprintf' is in=
secure as it does not provide security checks introduced in the C11 standar=
d. Replace with analogous functions that support length arguments or provid=
es boundary checks such as 'sprintf_s' in case of C11 [clang-analyzer-secur=
ity.insecureAPI.DeprecatedOrUnsafeBufferHandling]
                           p +=3D sprintf(p, " r%d:%08x", reg, *stack--);
                                ^~~~~~~
   arch/arm/kernel/traps.c:105:9: note: Call to function 'sprintf' is insec=
ure as it does not provide security checks introduced in the C11 standard. =
Replace with analogous functions that support length arguments or provides =
boundary checks such as 'sprintf_s' in case of C11
                           p +=3D sprintf(p, " r%d:%08x", reg, *stack--);
                                ^~~~~~~
   arch/arm/kernel/traps.c:149:3: warning: Call to function 'memset' is ins=
ecure as it does not provide security checks introduced in the C11 standard=
. Replace with analogous functions that support length arguments or provide=
s boundary checks such as 'memset_s' in case of C11 [clang-analyzer-securit=
y.insecureAPI.DeprecatedOrUnsafeBufferHandling]
                   memset(str, ' ', sizeof(str));
                   ^~~~~~
   arch/arm/kernel/traps.c:149:3: note: Call to function 'memset' is insecu=
re as it does not provide security checks introduced in the C11 standard. R=
eplace with analogous functions that support length arguments or provides b=
oundary checks such as 'memset_s' in case of C11
                   memset(str, ' ', sizeof(str));
                   ^~~~~~
   arch/arm/kernel/traps.c:156:6: warning: Call to function 'sprintf' is in=
secure as it does not provide security checks introduced in the C11 standar=
d. Replace with analogous functions that support length arguments or provid=
es boundary checks such as 'sprintf_s' in case of C11 [clang-analyzer-secur=
ity.insecureAPI.DeprecatedOrUnsafeBufferHandling]
                                           sprintf(str + i * 9, " %08lx", v=
al);
                                           ^~~~~~~
   arch/arm/kernel/traps.c:156:6: note: Call to function 'sprintf' is insec=
ure as it does not provide security checks introduced in the C11 standard. =
Replace with analogous functions that support length arguments or provides =
boundary checks such as 'sprintf_s' in case of C11
                                           sprintf(str + i * 9, " %08lx", v=
al);
                                           ^~~~~~~
   arch/arm/kernel/traps.c:158:6: warning: Call to function 'sprintf' is in=
secure as it does not provide security checks introduced in the C11 standar=
d. Replace with analogous functions that support length arguments or provid=
es boundary checks such as 'sprintf_s' in case of C11 [clang-analyzer-secur=
ity.insecureAPI.DeprecatedOrUnsafeBufferHandling]
                                           sprintf(str + i * 9, " ????????"=
);
                                           ^~~~~~~
   arch/arm/kernel/traps.c:158:6: note: Call to function 'sprintf' is insec=
ure as it does not provide security checks introduced in the C11 standard. =
Replace with analogous functions that support length arguments or provides =
boundary checks such as 'sprintf_s' in case of C11
                                           sprintf(str + i * 9, " ????????"=
);
                                           ^~~~~~~
   arch/arm/kernel/traps.c:197:9: warning: Call to function 'sprintf' is in=
secure as it does not provide bounding of the memory buffer or security che=
cks introduced in the C11 standard. Replace with analogous functions that s=
upport length arguments or provides boundary checks such as 'sprintf_s' in =
case of C11 [clang-analyzer-security.insecureAPI.DeprecatedOrUnsafeBufferHa=
ndling]
                           p +=3D sprintf(p, i =3D=3D 0 ? "(%0*x) " : "%0*x=
 ",
                                ^~~~~~~
   arch/arm/kernel/traps.c:197:9: note: Call to function 'sprintf' is insec=
ure as it does not provide bounding of the memory buffer or security checks=
 introduced in the C11 standard. Replace with analogous functions that supp=
ort length arguments or provides boundary checks such as 'sprintf_s' in cas=
e of C11
                           p +=3D sprintf(p, i =3D=3D 0 ? "(%0*x) " : "%0*x=
 ",
                                ^~~~~~~
   arch/arm/kernel/traps.c:200:4: warning: Value stored to 'p' is never rea=
d [clang-analyzer-deadcode.DeadStores]
                           p +=3D sprintf(p, "bad PC value");
                           ^    ~~~~~~~~~~~~~~~~~~~~~~~~~~
   arch/arm/kernel/traps.c:200:4: note: Value stored to 'p' is never read
                           p +=3D sprintf(p, "bad PC value");
                           ^    ~~~~~~~~~~~~~~~~~~~~~~~~~~
   arch/arm/kernel/traps.c:200:9: warning: Call to function 'sprintf' is in=
secure as it does not provide security checks introduced in the C11 standar=
d. Replace with analogous functions that support length arguments or provid=
es boundary checks such as 'sprintf_s' in case of C11 [clang-analyzer-secur=
ity.insecureAPI.DeprecatedOrUnsafeBufferHandling]
                           p +=3D sprintf(p, "bad PC value");
                                ^~~~~~~
   arch/arm/kernel/traps.c:200:9: note: Call to function 'sprintf' is insec=
ure as it does not provide security checks introduced in the C11 standard. =
Replace with analogous functions that support length arguments or provides =
boundary checks such as 'sprintf_s' in case of C11
                           p +=3D sprintf(p, "bad PC value");
                                ^~~~~~~
   arch/arm/kernel/traps.c:792:2: warning: Call to function 'memcpy' is ins=
ecure as it does not provide security checks introduced in the C11 standard=
. Replace with analogous functions that support length arguments or provide=
s boundary checks such as 'memcpy_s' in case of C11 [clang-analyzer-securit=
y.insecureAPI.DeprecatedOrUnsafeBufferHandling]
           memcpy(vectors + 0x1000 - kuser_sz, __kuser_helper_start, kuser_=
sz);
           ^~~~~~
   arch/arm/kernel/traps.c:792:2: note: Call to function 'memcpy' is insecu=
re as it does not provide security checks introduced in the C11 standard. R=
eplace with analogous functions that support length arguments or provides b=
oundary checks such as 'memcpy_s' in case of C11
           memcpy(vectors + 0x1000 - kuser_sz, __kuser_helper_start, kuser_=
sz);
           ^~~~~~
   arch/arm/kernel/traps.c:799:3: warning: Call to function 'memcpy' is ins=
ecure as it does not provide security checks introduced in the C11 standard=
. Replace with analogous functions that support length arguments or provide=
s boundary checks such as 'memcpy_s' in case of C11 [clang-analyzer-securit=
y.insecureAPI.DeprecatedOrUnsafeBufferHandling]
                   memcpy(vectors + 0xfe0, vectors + 0xfe8, 4);
                   ^~~~~~
   arch/arm/kernel/traps.c:799:3: note: Call to function 'memcpy' is insecu=
re as it does not provide security checks introduced in the C11 standard. R=
eplace with analogous functions that support length arguments or provides b=
oundary checks such as 'memcpy_s' in case of C11
                   memcpy(vectors + 0xfe0, vectors + 0xfe8, 4);
                   ^~~~~~
   arch/arm/kernel/traps.c:810:2: warning: Call to function 'memcpy' is ins=
ecure as it does not provide security checks introduced in the C11 standard=
. Replace with analogous functions that support length arguments or provide=
s boundary checks such as 'memcpy_s' in case of C11 [clang-analyzer-securit=
y.insecureAPI.DeprecatedOrUnsafeBufferHandling]
           memcpy(vma, lma_start, lma_end - lma_start);
           ^~~~~~
   arch/arm/kernel/traps.c:810:2: note: Call to function 'memcpy' is insecu=
re as it does not provide security checks introduced in the C11 standard. R=
eplace with analogous functions that support length arguments or provides b=
oundary checks such as 'memcpy_s' in case of C11
           memcpy(vma, lma_start, lma_end - lma_start);
           ^~~~~~
   Suppressed 51 warnings (44 in non-user code, 7 with check filters).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   71 warnings generated.
>> drivers/net/mdio/fwnode_mdio.c:134:17: warning: Assigned value is garbag=
e or undefined [clang-analyzer-core.uninitialized.Assign]
           phy->consumers =3D consumers;
                          ^ ~~~~~~~~~
   drivers/net/mdio/fwnode_mdio.c:94:2: note: 'consumers' declared without =
an initial value
           struct regulator_bulk_data *consumers;
           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/net/mdio/fwnode_mdio.c:99:2: note: Taking false branch
           if (IS_ERR(mii_ts))
           ^
   drivers/net/mdio/fwnode_mdio.c:104:6: note: Assuming 'rc' is >=3D 0
           if (rc >=3D 0)
               ^~~~~~~
   drivers/net/mdio/fwnode_mdio.c:104:2: note: Taking true branch
           if (rc >=3D 0)
           ^
   drivers/net/mdio/fwnode_mdio.c:107:43: note: Assuming 'nchild' is equal =
to null
           for_each_child_of_node(bus->dev.of_node, nchild) {
                                                    ^
   include/linux/of.h:1358:48: note: expanded from macro 'for_each_child_of=
_node'
           for (child =3D of_get_next_child(parent, NULL); child !=3D NULL;=
 \
                                                         ^~~~~~~~~~~~~
   drivers/net/mdio/fwnode_mdio.c:107:2: note: Loop condition is false. Exe=
cution continues on line 123
           for_each_child_of_node(bus->dev.of_node, nchild) {
           ^
   include/linux/of.h:1358:2: note: expanded from macro 'for_each_child_of_=
node'
           for (child =3D of_get_next_child(parent, NULL); child !=3D NULL;=
 \
           ^
   drivers/net/mdio/fwnode_mdio.c:123:6: note: 'is_c45' is true
           if (is_c45 || fwnode_get_phy_id(child, &phy_id))
               ^~~~~~
   drivers/net/mdio/fwnode_mdio.c:123:13: note: Left side of '||' is true
           if (is_c45 || fwnode_get_phy_id(child, &phy_id))
                      ^
   drivers/net/mdio/fwnode_mdio.c:127:2: note: Taking false branch
           if (IS_ERR(phy)) {
           ^
   drivers/net/mdio/fwnode_mdio.c:134:17: note: Assigned value is garbage o=
r undefined
           phy->consumers =3D consumers;
                          ^ ~~~~~~~~~
   Suppressed 70 warnings (70 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   71 warnings generated.
   Suppressed 71 warnings (71 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   71 warnings generated.
   drivers/net/mdio/mdio-hisi-femac.c:86:2: warning: Call to function 'snpr=
intf' is insecure as it does not provide security checks introduced in the =
C11 standard. Replace with analogous functions that support length argument=
s or provides boundary checks such as 'snprintf_s' in case of C11 [clang-an=
alyzer-security.insecureAPI.DeprecatedOrUnsafeBufferHandling]
           snprintf(bus->id, MII_BUS_ID_SIZE, "%s", pdev->name);
           ^~~~~~~~
   drivers/net/mdio/mdio-hisi-femac.c:86:2: note: Call to function 'snprint=
f' is insecure as it does not provide security checks introduced in the C11=
 standard. Replace with analogous functions that support length arguments o=
r provides boundary checks such as 'snprintf_s' in case of C11
           snprintf(bus->id, MII_BUS_ID_SIZE, "%s", pdev->name);
           ^~~~~~~~
   Suppressed 70 warnings (70 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   70 warnings generated.
   Suppressed 70 warnings (70 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   44 warnings generated.
   crypto/ecdh.c:40:2: warning: Call to function 'memcpy' is insecure as it=
 does not provide security checks introduced in the C11 standard. Replace w=
ith analogous functions that support length arguments or provides boundary =
checks such as 'memcpy_s' in case of C11 [clang-analyzer-security.insecureA=
PI.DeprecatedOrUnsafeBufferHandling]
           memcpy(ctx->private_key, params.key, params.key_size);
           ^~~~~~
   crypto/ecdh.c:40:2: note: Call to function 'memcpy' is insecure as it do=
es not provide security checks introduced in the C11 standard. Replace with=
 analogous functions that support length arguments or provides boundary che=
cks such as 'memcpy_s' in case of C11
           memcpy(ctx->private_key, params.key, params.key_size);
           ^~~~~~
   Suppressed 43 warnings (43 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   9 warnings generated.
   crypto/ecdh_helper.c:17:2: warning: Call to function 'memcpy' is insecur=
e as it does not provide security checks introduced in the C11 standard. Re=
place with analogous functions that support length arguments or provides bo=
undary checks such as 'memcpy_s' in case of C11 [clang-analyzer-security.in=
secureAPI.DeprecatedOrUnsafeBufferHandling]
           memcpy(dst, src, sz);
           ^~~~~~
   crypto/ecdh_helper.c:17:2: note: Call to function 'memcpy' is insecure a=
s it does not provide security checks introduced in the C11 standard. Repla=
ce with analogous functions that support length arguments or provides bound=
ary checks such as 'memcpy_s' in case of C11
           memcpy(dst, src, sz);
           ^~~~~~
   crypto/ecdh_helper.c:23:2: warning: Call to function 'memcpy' is insecur=
e as it does not provide security checks introduced in the C11 standard. Re=
place with analogous functions that support length arguments or provides bo=
undary checks such as 'memcpy_s' in case of C11 [clang-analyzer-security.in=
secureAPI.DeprecatedOrUnsafeBufferHandling]
           memcpy(dst, src, sz);
           ^~~~~~
   crypto/ecdh_helper.c:23:2: note: Call to function 'memcpy' is insecure a=
s it does not provide security checks introduced in the C11 standard. Repla=
ce with analogous functions that support length arguments or provides bound=
ary checks such as 'memcpy_s' in case of C11
           memcpy(dst, src, sz);
           ^~~~~~
   Suppressed 7 warnings (7 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   10 warnings generated.
   crypto/xor.c:156:9: warning: Access to field 'name' results in a derefer=
ence of a null pointer (loaded from variable 'fastest') [clang-analyzer-cor=
e.NullDereference]
                  fastest->name, fastest->speed);
                  ^
   include/linux/printk.h:519:34: note: expanded from macro 'pr_info'
           printk(KERN_INFO pr_fmt(fmt), ##__VA_ARGS__)
                                           ^~~~~~~~~~~
   include/linux/printk.h:446:60: note: expanded from macro 'printk'
   #define printk(fmt, ...) printk_index_wrap(_printk, fmt, ##__VA_ARGS__)
                                                              ^~~~~~~~~~~
   include/linux/printk.h:418:19: note: expanded from macro 'printk_index_w=
rap'
                   _p_func(_fmt, ##__VA_ARGS__);                           \
                                   ^~~~~~~~~~~
   crypto/xor.c:126:6: note: 'fastest' is null
           if (fastest) {
               ^~~~~~~
   crypto/xor.c:126:2: note: Taking false branch
           if (fastest) {
           ^
   crypto/xor.c:134:6: note: Assuming 'b1' is non-null
           if (!b1) {

vim +134 drivers/net/mdio/fwnode_mdio.c

bc1bee3b87ee48 Calvin Johnson 2021-06-11   85  =

bc1bee3b87ee48 Calvin Johnson 2021-06-11   86  int fwnode_mdiobus_register_=
phy(struct mii_bus *bus,
bc1bee3b87ee48 Calvin Johnson 2021-06-11   87  				struct fwnode_handle *ch=
ild, u32 addr)
bc1bee3b87ee48 Calvin Johnson 2021-06-11   88  {
bc1bee3b87ee48 Calvin Johnson 2021-06-11   89  	struct mii_timestamper *mii=
_ts =3D NULL;
bc1bee3b87ee48 Calvin Johnson 2021-06-11   90  	struct phy_device *phy;
bc1bee3b87ee48 Calvin Johnson 2021-06-11   91  	bool is_c45 =3D false;
bc1bee3b87ee48 Calvin Johnson 2021-06-11   92  	u32 phy_id;
7ae2ab7d1efe80 Corentin Labbe 2022-05-23   93  	int rc, reg_cnt =3D 0;
7ae2ab7d1efe80 Corentin Labbe 2022-05-23   94  	struct regulator_bulk_data =
*consumers;
7ae2ab7d1efe80 Corentin Labbe 2022-05-23   95  	struct device_node *nchild =
=3D NULL;
7ae2ab7d1efe80 Corentin Labbe 2022-05-23   96  	u32 reg;
bc1bee3b87ee48 Calvin Johnson 2021-06-11   97  =

bc1bee3b87ee48 Calvin Johnson 2021-06-11   98  	mii_ts =3D fwnode_find_mii_=
timestamper(child);
bc1bee3b87ee48 Calvin Johnson 2021-06-11   99  	if (IS_ERR(mii_ts))
bc1bee3b87ee48 Calvin Johnson 2021-06-11  100  		return PTR_ERR(mii_ts);
bc1bee3b87ee48 Calvin Johnson 2021-06-11  101  =

bc1bee3b87ee48 Calvin Johnson 2021-06-11  102  	rc =3D fwnode_property_matc=
h_string(child, "compatible",
bc1bee3b87ee48 Calvin Johnson 2021-06-11  103  					  "ethernet-phy-ieee802=
.3-c45");
bc1bee3b87ee48 Calvin Johnson 2021-06-11  104  	if (rc >=3D 0)
bc1bee3b87ee48 Calvin Johnson 2021-06-11  105  		is_c45 =3D true;
bc1bee3b87ee48 Calvin Johnson 2021-06-11  106  =

7ae2ab7d1efe80 Corentin Labbe 2022-05-23  107  	for_each_child_of_node(bus-=
>dev.of_node, nchild) {
7ae2ab7d1efe80 Corentin Labbe 2022-05-23  108  		of_property_read_u32(nchil=
d, "reg", &reg);
7ae2ab7d1efe80 Corentin Labbe 2022-05-23  109  		if (reg !=3D addr)
7ae2ab7d1efe80 Corentin Labbe 2022-05-23  110  			continue;
7ae2ab7d1efe80 Corentin Labbe 2022-05-23  111  		reg_cnt =3D regulator_bulk=
_get_all(&bus->dev, nchild, &consumers);
7ae2ab7d1efe80 Corentin Labbe 2022-05-23  112  		if (reg_cnt > 0) {
7ae2ab7d1efe80 Corentin Labbe 2022-05-23  113  			rc =3D regulator_bulk_ena=
ble(reg_cnt, consumers);
7ae2ab7d1efe80 Corentin Labbe 2022-05-23  114  			if (rc)
7ae2ab7d1efe80 Corentin Labbe 2022-05-23  115  				return rc;
7ae2ab7d1efe80 Corentin Labbe 2022-05-23  116  		}
7ae2ab7d1efe80 Corentin Labbe 2022-05-23  117  		if (reg_cnt < 0) {
7ae2ab7d1efe80 Corentin Labbe 2022-05-23  118  			dev_err(&bus->dev, "Fail =
to regulator_bulk_get_all err=3D%d\n", reg_cnt);
7ae2ab7d1efe80 Corentin Labbe 2022-05-23  119  			return reg_cnt;
7ae2ab7d1efe80 Corentin Labbe 2022-05-23  120  		}
7ae2ab7d1efe80 Corentin Labbe 2022-05-23  121  	}
7ae2ab7d1efe80 Corentin Labbe 2022-05-23  122  =

bc1bee3b87ee48 Calvin Johnson 2021-06-11  123  	if (is_c45 || fwnode_get_ph=
y_id(child, &phy_id))
bc1bee3b87ee48 Calvin Johnson 2021-06-11  124  		phy =3D get_phy_device(bus=
, addr, is_c45);
bc1bee3b87ee48 Calvin Johnson 2021-06-11  125  	else
bc1bee3b87ee48 Calvin Johnson 2021-06-11  126  		phy =3D phy_device_create(=
bus, addr, phy_id, 0, NULL);
bc1bee3b87ee48 Calvin Johnson 2021-06-11  127  	if (IS_ERR(phy)) {
bc1bee3b87ee48 Calvin Johnson 2021-06-11  128  		unregister_mii_timestamper=
(mii_ts);
7ae2ab7d1efe80 Corentin Labbe 2022-05-23  129  		rc =3D PTR_ERR(phy);
7ae2ab7d1efe80 Corentin Labbe 2022-05-23  130  		goto error;
bc1bee3b87ee48 Calvin Johnson 2021-06-11  131  	}
bc1bee3b87ee48 Calvin Johnson 2021-06-11  132  =

7ae2ab7d1efe80 Corentin Labbe 2022-05-23  133  	phy->regulator_cnt =3D reg_=
cnt;
7ae2ab7d1efe80 Corentin Labbe 2022-05-23 @134  	phy->consumers =3D consumer=
s;

-- =

0-DAY CI Kernel Test Service
https://01.org/lkp
--===============2295401903171944136==--

