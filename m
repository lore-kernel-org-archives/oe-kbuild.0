Content-Type: multipart/mixed; boundary="===============4470619684956773305=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: drivers/crypto/amlogic/amlogic-gxl-cipher.c:185:3: warning: Value stored to 'nr_sgd' is never read [clang-analyzer-deadcode.DeadStores]
Date: Mon, 02 Aug 2021 09:40:54 +0800
Message-ID: <202108020951.3KvRMoUh-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============4470619684956773305==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

CC: clang-built-linux(a)googlegroups.com
CC: kbuild-all(a)lists.01.org
CC: linux-kernel(a)vger.kernel.org
TO: Xiang Chen <chenxiang66@hisilicon.com>
CC: Herbert Xu <herbert@gondor.apana.org.au>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git =
master
head:   c7d102232649226a69dddd58a4942cf13cff4f7c
commit: 5595d0dc1d33b36843166644bb33d94c0e34942e crypto: amlogic - Fix the =
parameter of dma_unmap_sg()
date:   4 months ago
:::::: branch date: 2 days ago
:::::: commit date: 4 months ago
config: x86_64-randconfig-c001-20210731 (attached as .config)
compiler: clang version 13.0.0 (https://github.com/llvm/llvm-project 4f71f5=
9bf3d9914188a11d0c41bedbb339d36ff5)
reproduce (this is a W=3D1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/=
make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # install x86_64 cross compiling tool for clang build
        # apt-get install binutils-x86-64-linux-gnu
        # https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.gi=
t/commit/?id=3D5595d0dc1d33b36843166644bb33d94c0e34942e
        git remote add linus https://git.kernel.org/pub/scm/linux/kernel/gi=
t/torvalds/linux.git
        git fetch --no-tags linus master
        git checkout 5595d0dc1d33b36843166644bb33d94c0e34942e
        # save the attached .config to linux build tree
        COMPILER_INSTALL_PATH=3D$HOME/0day COMPILER=3Dclang make.cross ARCH=
=3Dx86_64 clang-analyzer =


If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>


clang-analyzer warnings: (new ones prefixed by >>)
   4 warnings generated.
   Suppressed 4 warnings (4 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   4 warnings generated.
   Suppressed 4 warnings (4 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   5 warnings generated.
   fs/nfs/nfs4session.c:127:10: warning: The left operand of '=3D=3D' is a =
garbage value [clang-analyzer-core.UndefinedBinaryOperatorResult]
                   if (*p =3D=3D NULL) {
                          ^
   fs/nfs/nfs4session.c:405:2: note: Loop condition is true.  Entering loop=
 body
           for (;;) {
           ^
   fs/nfs/nfs4session.c:406:8: note: Calling 'nfs41_try_wake_next_slot_tabl=
e_entry'
                   if (!nfs41_try_wake_next_slot_table_entry(tbl))
                        ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   fs/nfs/nfs4session.c:393:27: note: Calling 'nfs4_alloc_slot'
           struct nfs4_slot *slot =3D nfs4_alloc_slot(tbl);
                                    ^~~~~~~~~~~~~~~~~~~~
   fs/nfs/nfs4session.c:247:2: note: Loop condition is false.  Exiting loop
           dprintk("--> %s used_slots=3D%04lx highest_used=3D%u max_slots=
=3D%u\n",
           ^
   include/linux/sunrpc/debug.h:25:2: note: expanded from macro 'dprintk'
           dfprintk(FACILITY, fmt, ##__VA_ARGS__)
           ^
   include/linux/sunrpc/debug.h:70:34: note: expanded from macro 'dfprintk'
   # define dfprintk(fac, fmt, ...)        do {} while (0)
                                           ^
   fs/nfs/nfs4session.c:251:6: note: Assuming 'slotid' is <=3D field 'max_s=
lotid'
           if (slotid <=3D tbl->max_slotid) {
               ^~~~~~~~~~~~~~~~~~~~~~~~~
   fs/nfs/nfs4session.c:251:2: note: Taking true branch
           if (slotid <=3D tbl->max_slotid) {
           ^
   fs/nfs/nfs4session.c:252:9: note: Calling 'nfs4_find_or_create_slot'
                   ret =3D nfs4_find_or_create_slot(tbl, slotid, 1, GFP_NOW=
AIT);
                         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~=
~~
   fs/nfs/nfs4session.c:126:2: note: Loop condition is true.  Entering loop=
 body
           for (;;) {
           ^
   fs/nfs/nfs4session.c:127:7: note: Assuming the condition is true
                   if (*p =3D=3D NULL) {
                       ^~~~~~~~~~
   fs/nfs/nfs4session.c:127:3: note: Taking true branch
                   if (*p =3D=3D NULL) {
                   ^
   fs/nfs/nfs4session.c:128:9: note: Calling 'nfs4_new_slot'
                           *p =3D nfs4_new_slot(tbl, tbl->max_slots,
                                ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   fs/nfs/nfs4session.c:109:9: note: Calling 'kzalloc'
           slot =3D kzalloc(sizeof(*slot), gfp_mask);
                  ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/slab.h:684:9: note: Uninitialized value stored to field 'n=
ext'
           return kmalloc(size, flags | __GFP_ZERO);
                  ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   fs/nfs/nfs4session.c:109:9: note: Returning from 'kzalloc'
           slot =3D kzalloc(sizeof(*slot), gfp_mask);
                  ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   fs/nfs/nfs4session.c:110:6: note: Assuming 'slot' is non-null
           if (slot) {
               ^~~~
   fs/nfs/nfs4session.c:110:2: note: Taking true branch
           if (slot) {
           ^
   fs/nfs/nfs4session.c:128:9: note: Returning from 'nfs4_new_slot'
                           *p =3D nfs4_new_slot(tbl, tbl->max_slots,
                                ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   fs/nfs/nfs4session.c:130:4: note: Taking false branch
                           if (*p =3D=3D NULL)
                           ^
   fs/nfs/nfs4session.c:135:7: note: Assuming 'slotid' is not equal to fiel=
d 'slot_nr'
                   if (slot->slot_nr =3D=3D slotid)
                       ^~~~~~~~~~~~~~~~~~~~~~~
   fs/nfs/nfs4session.c:135:3: note: Taking false branch
                   if (slot->slot_nr =3D=3D slotid)
                   ^
   fs/nfs/nfs4session.c:126:2: note: Loop condition is true.  Entering loop=
 body
           for (;;) {
           ^
   fs/nfs/nfs4session.c:127:10: note: The left operand of '=3D=3D' is a gar=
bage value
                   if (*p =3D=3D NULL) {
                       ~~ ^
   Suppressed 4 warnings (4 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   3 warnings generated.
   Suppressed 3 warnings (3 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   6 warnings generated.
   drivers/crypto/amlogic/amlogic-gxl-cipher.c:94:22: warning: Value stored=
 to 'src_sg' during its initialization is never read [clang-analyzer-deadco=
de.DeadStores]
           struct scatterlist *src_sg =3D areq->src;
                               ^~~~~~   ~~~~~~~~~
   drivers/crypto/amlogic/amlogic-gxl-cipher.c:94:22: note: Value stored to=
 'src_sg' during its initialization is never read
           struct scatterlist *src_sg =3D areq->src;
                               ^~~~~~   ~~~~~~~~~
   drivers/crypto/amlogic/amlogic-gxl-cipher.c:95:22: warning: Value stored=
 to 'dst_sg' during its initialization is never read [clang-analyzer-deadco=
de.DeadStores]
           struct scatterlist *dst_sg =3D areq->dst;
                               ^~~~~~   ~~~~~~~~~
   drivers/crypto/amlogic/amlogic-gxl-cipher.c:95:22: note: Value stored to=
 'dst_sg' during its initialization is never read
           struct scatterlist *dst_sg =3D areq->dst;
                               ^~~~~~   ~~~~~~~~~
>> drivers/crypto/amlogic/amlogic-gxl-cipher.c:185:3: warning: Value stored=
 to 'nr_sgd' is never read [clang-analyzer-deadcode.DeadStores]
                   nr_sgd =3D nr_sgs;
                   ^        ~~~~~~
   drivers/crypto/amlogic/amlogic-gxl-cipher.c:185:3: note: Value stored to=
 'nr_sgd' is never read
                   nr_sgd =3D nr_sgs;
                   ^        ~~~~~~
   Suppressed 3 warnings (3 in non-user code).
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
   9 warnings generated.
   drivers/hid/hid-core.c:1335:24: warning: The result of the left shift is=
 undefined due to shifting by '4294967295', which is greater or equal to th=
e width of type 'int' [clang-analyzer-core.UndefinedBinaryOperatorResult]
                   return value < 0 ? 1 << (n - 1) : (1 << (n - 1)) - 1;
                                        ^
   drivers/hid/hid-core.c:1717:6: note: Assuming 'buf' is non-null
           if (!buf)
               ^~~~
   drivers/hid/hid-core.c:1717:2: note: Taking false branch
           if (!buf)
           ^
   drivers/hid/hid-core.c:1722:6: note: Assuming 'reqtype' is equal to HID_=
REQ_SET_REPORT
           if (reqtype =3D=3D HID_REQ_SET_REPORT)
               ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/hid/hid-core.c:1722:2: note: Taking true branch
           if (reqtype =3D=3D HID_REQ_SET_REPORT)
           ^
   drivers/hid/hid-core.c:1723:3: note: Calling 'hid_output_report'
                   hid_output_report(report, buf);
                   ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/hid/hid-core.c:1630:14: note: Field 'id' is <=3D 0
           if (report->id > 0)
                       ^
   drivers/hid/hid-core.c:1630:2: note: Taking false branch
           if (report->id > 0)
           ^
   drivers/hid/hid-core.c:1634:14: note: Assuming 'n' is < field 'maxfield'
           for (n =3D 0; n < report->maxfield; n++)
                       ^~~~~~~~~~~~~~~~~~~~
   drivers/hid/hid-core.c:1634:2: note: Loop condition is true.  Entering l=
oop body
           for (n =3D 0; n < report->maxfield; n++)
           ^
   drivers/hid/hid-core.c:1635:3: note: Calling 'hid_output_field'
                   hid_output_field(report->device, report->field[n], data);
                   ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/hid/hid-core.c:1600:14: note: Assuming 'n' is < 'count'
           for (n =3D 0; n < count; n++) {
                       ^~~~~~~~~
   drivers/hid/hid-core.c:1600:2: note: Loop condition is true.  Entering l=
oop body
           for (n =3D 0; n < count; n++) {
           ^
   drivers/hid/hid-core.c:1601:7: note: Assuming field 'logical_minimum' is=
 < 0
                   if (field->logical_minimum < 0) /* signed values */
                       ^~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/hid/hid-core.c:1601:3: note: Taking true branch
                   if (field->logical_minimum < 0) /* signed values */
                   ^
   drivers/hid/hid-core.c:1600:14: note: Assuming 'n' is < 'count'
           for (n =3D 0; n < count; n++) {
                       ^~~~~~~~~
   drivers/hid/hid-core.c:1600:2: note: Loop condition is true.  Entering l=
oop body
           for (n =3D 0; n < count; n++) {
           ^
   drivers/hid/hid-core.c:1601:14: note: Field 'logical_minimum' is < 0
                   if (field->logical_minimum < 0) /* signed values */
                              ^
   drivers/hid/hid-core.c:1601:3: note: Taking true branch
                   if (field->logical_minimum < 0) /* signed values */
                   ^
   drivers/hid/hid-core.c:1603:7: note: Calling 's32ton'
                                     s32ton(field->value[n], size));
                                     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/hid/hid-core.c:1334:6: note: Assuming 'a' is not equal to 0
           if (a && a !=3D -1)
               ^
   drivers/hid/hid-core.c:1334:6: note: Left side of '&&' is true
   drivers/hid/hid-core.c:1334:11: note: Assuming the condition is true
           if (a && a !=3D -1)
                    ^~~~~~~
   drivers/hid/hid-core.c:1334:2: note: Taking true branch
           if (a && a !=3D -1)
           ^
   drivers/hid/hid-core.c:1335:10: note: Assuming 'value' is < 0
                   return value < 0 ? 1 << (n - 1) : (1 << (n - 1)) - 1;
                          ^~~~~~~~~
   drivers/hid/hid-core.c:1335:10: note: '?' condition is true
   drivers/hid/hid-core.c:1335:24: note: The result of the left shift is un=
defined due to shifting by '4294967295', which is greater or equal to the w=
idth of type 'int'
                   return value < 0 ? 1 << (n - 1) : (1 << (n - 1)) - 1;
                                        ^  ~~~~~~~
   drivers/hid/hid-core.c:1335:40: warning: The result of the left shift is=
 undefined due to shifting by '4294967295', which is greater or equal to th=
e width of type 'int' [clang-analyzer-core.UndefinedBinaryOperatorResult]
                   return value < 0 ? 1 << (n - 1) : (1 << (n - 1)) - 1;
                                                        ^
   drivers/hid/hid-core.c:1717:6: note: Assuming 'buf' is non-null
           if (!buf)
               ^~~~
   drivers/hid/hid-core.c:1717:2: note: Taking false branch
           if (!buf)
           ^

vim +/nr_sgd +185 drivers/crypto/amlogic/amlogic-gxl-cipher.c

48fe583fe54177 Corentin Labbe 2019-10-17  116  =

48fe583fe54177 Corentin Labbe 2019-10-17  117  	/*
48fe583fe54177 Corentin Labbe 2019-10-17  118  	 * The hardware expect a li=
st of meson_desc structures.
48fe583fe54177 Corentin Labbe 2019-10-17  119  	 * The 2 first structures s=
tore key
48fe583fe54177 Corentin Labbe 2019-10-17  120  	 * The third stores IV
48fe583fe54177 Corentin Labbe 2019-10-17  121  	 */
48fe583fe54177 Corentin Labbe 2019-10-17  122  	bkeyiv =3D kzalloc(48, GFP_=
KERNEL | GFP_DMA);
48fe583fe54177 Corentin Labbe 2019-10-17  123  	if (!bkeyiv)
48fe583fe54177 Corentin Labbe 2019-10-17  124  		return -ENOMEM;
48fe583fe54177 Corentin Labbe 2019-10-17  125  =

48fe583fe54177 Corentin Labbe 2019-10-17  126  	memcpy(bkeyiv, op->key, op-=
>keylen);
48fe583fe54177 Corentin Labbe 2019-10-17  127  	keyivlen =3D op->keylen;
48fe583fe54177 Corentin Labbe 2019-10-17  128  =

48fe583fe54177 Corentin Labbe 2019-10-17  129  	ivsize =3D crypto_skcipher_=
ivsize(tfm);
48fe583fe54177 Corentin Labbe 2019-10-17  130  	if (areq->iv && ivsize > 0)=
 {
48fe583fe54177 Corentin Labbe 2019-10-17  131  		if (ivsize > areq->cryptle=
n) {
48fe583fe54177 Corentin Labbe 2019-10-17  132  			dev_err(mc->dev, "invalid=
 ivsize=3D%d vs len=3D%d\n", ivsize, areq->cryptlen);
56601574c12ff9 Corentin Labbe 2019-11-08  133  			err =3D -EINVAL;
56601574c12ff9 Corentin Labbe 2019-11-08  134  			goto theend;
48fe583fe54177 Corentin Labbe 2019-10-17  135  		}
48fe583fe54177 Corentin Labbe 2019-10-17  136  		memcpy(bkeyiv + 32, areq->=
iv, ivsize);
48fe583fe54177 Corentin Labbe 2019-10-17  137  		keyivlen =3D 48;
48fe583fe54177 Corentin Labbe 2019-10-17  138  		if (rctx->op_dir =3D=3D ME=
SON_DECRYPT) {
48fe583fe54177 Corentin Labbe 2019-10-17  139  			backup_iv =3D kzalloc(ivs=
ize, GFP_KERNEL);
48fe583fe54177 Corentin Labbe 2019-10-17  140  			if (!backup_iv) {
48fe583fe54177 Corentin Labbe 2019-10-17  141  				err =3D -ENOMEM;
48fe583fe54177 Corentin Labbe 2019-10-17  142  				goto theend;
48fe583fe54177 Corentin Labbe 2019-10-17  143  			}
48fe583fe54177 Corentin Labbe 2019-10-17  144  			offset =3D areq->cryptlen=
 - ivsize;
48fe583fe54177 Corentin Labbe 2019-10-17  145  			scatterwalk_map_and_copy(=
backup_iv, areq->src, offset,
48fe583fe54177 Corentin Labbe 2019-10-17  146  						 ivsize, 0);
48fe583fe54177 Corentin Labbe 2019-10-17  147  		}
48fe583fe54177 Corentin Labbe 2019-10-17  148  	}
48fe583fe54177 Corentin Labbe 2019-10-17  149  	if (keyivlen =3D=3D 24)
48fe583fe54177 Corentin Labbe 2019-10-17  150  		keyivlen =3D 32;
48fe583fe54177 Corentin Labbe 2019-10-17  151  =

48fe583fe54177 Corentin Labbe 2019-10-17  152  	phykeyiv =3D dma_map_single=
(mc->dev, bkeyiv, keyivlen,
48fe583fe54177 Corentin Labbe 2019-10-17  153  				  DMA_TO_DEVICE);
56601574c12ff9 Corentin Labbe 2019-11-08  154  	err =3D dma_mapping_error(m=
c->dev, phykeyiv);
56601574c12ff9 Corentin Labbe 2019-11-08  155  	if (err) {
48fe583fe54177 Corentin Labbe 2019-10-17  156  		dev_err(mc->dev, "Cannot D=
MA MAP KEY IV\n");
56601574c12ff9 Corentin Labbe 2019-11-08  157  		goto theend;
48fe583fe54177 Corentin Labbe 2019-10-17  158  	}
48fe583fe54177 Corentin Labbe 2019-10-17  159  =

48fe583fe54177 Corentin Labbe 2019-10-17  160  	tloffset =3D 0;
48fe583fe54177 Corentin Labbe 2019-10-17  161  	eat =3D 0;
48fe583fe54177 Corentin Labbe 2019-10-17  162  	i =3D 0;
48fe583fe54177 Corentin Labbe 2019-10-17  163  	while (keyivlen > eat) {
48fe583fe54177 Corentin Labbe 2019-10-17  164  		desc =3D &mc->chanlist[flo=
w].tl[tloffset];
48fe583fe54177 Corentin Labbe 2019-10-17  165  		memset(desc, 0, sizeof(str=
uct meson_desc));
48fe583fe54177 Corentin Labbe 2019-10-17  166  		todo =3D min(keyivlen - ea=
t, 16u);
3d04158814e7a8 Corentin Labbe 2019-11-17  167  		desc->t_src =3D cpu_to_le3=
2(phykeyiv + i * 16);
3d04158814e7a8 Corentin Labbe 2019-11-17  168  		desc->t_dst =3D cpu_to_le3=
2(i * 16);
3d04158814e7a8 Corentin Labbe 2019-11-17  169  		v =3D (MODE_KEY << 20) | D=
ESC_OWN | 16;
3d04158814e7a8 Corentin Labbe 2019-11-17  170  		desc->t_status =3D cpu_to_=
le32(v);
3d04158814e7a8 Corentin Labbe 2019-11-17  171  =

48fe583fe54177 Corentin Labbe 2019-10-17  172  		eat +=3D todo;
48fe583fe54177 Corentin Labbe 2019-10-17  173  		i++;
48fe583fe54177 Corentin Labbe 2019-10-17  174  		tloffset++;
48fe583fe54177 Corentin Labbe 2019-10-17  175  	}
48fe583fe54177 Corentin Labbe 2019-10-17  176  =

48fe583fe54177 Corentin Labbe 2019-10-17  177  	if (areq->src =3D=3D areq->=
dst) {
48fe583fe54177 Corentin Labbe 2019-10-17  178  		nr_sgs =3D dma_map_sg(mc->=
dev, areq->src, sg_nents(areq->src),
48fe583fe54177 Corentin Labbe 2019-10-17  179  				    DMA_BIDIRECTIONAL);
48fe583fe54177 Corentin Labbe 2019-10-17  180  		if (nr_sgs < 0) {
48fe583fe54177 Corentin Labbe 2019-10-17  181  			dev_err(mc->dev, "Invalid=
 SG count %d\n", nr_sgs);
48fe583fe54177 Corentin Labbe 2019-10-17  182  			err =3D -EINVAL;
48fe583fe54177 Corentin Labbe 2019-10-17  183  			goto theend;
48fe583fe54177 Corentin Labbe 2019-10-17  184  		}
48fe583fe54177 Corentin Labbe 2019-10-17 @185  		nr_sgd =3D nr_sgs;
48fe583fe54177 Corentin Labbe 2019-10-17  186  	} else {
48fe583fe54177 Corentin Labbe 2019-10-17  187  		nr_sgs =3D dma_map_sg(mc->=
dev, areq->src, sg_nents(areq->src),
48fe583fe54177 Corentin Labbe 2019-10-17  188  				    DMA_TO_DEVICE);
48fe583fe54177 Corentin Labbe 2019-10-17  189  		if (nr_sgs < 0 || nr_sgs >=
 MAXDESC - 3) {
48fe583fe54177 Corentin Labbe 2019-10-17  190  			dev_err(mc->dev, "Invalid=
 SG count %d\n", nr_sgs);
48fe583fe54177 Corentin Labbe 2019-10-17  191  			err =3D -EINVAL;
48fe583fe54177 Corentin Labbe 2019-10-17  192  			goto theend;
48fe583fe54177 Corentin Labbe 2019-10-17  193  		}
48fe583fe54177 Corentin Labbe 2019-10-17  194  		nr_sgd =3D dma_map_sg(mc->=
dev, areq->dst, sg_nents(areq->dst),
48fe583fe54177 Corentin Labbe 2019-10-17  195  				    DMA_FROM_DEVICE);
48fe583fe54177 Corentin Labbe 2019-10-17  196  		if (nr_sgd < 0 || nr_sgd >=
 MAXDESC - 3) {
48fe583fe54177 Corentin Labbe 2019-10-17  197  			dev_err(mc->dev, "Invalid=
 SG count %d\n", nr_sgd);
48fe583fe54177 Corentin Labbe 2019-10-17  198  			err =3D -EINVAL;
48fe583fe54177 Corentin Labbe 2019-10-17  199  			goto theend;
48fe583fe54177 Corentin Labbe 2019-10-17  200  		}
48fe583fe54177 Corentin Labbe 2019-10-17  201  	}
48fe583fe54177 Corentin Labbe 2019-10-17  202  =

48fe583fe54177 Corentin Labbe 2019-10-17  203  	src_sg =3D areq->src;
48fe583fe54177 Corentin Labbe 2019-10-17  204  	dst_sg =3D areq->dst;
48fe583fe54177 Corentin Labbe 2019-10-17  205  	len =3D areq->cryptlen;
48fe583fe54177 Corentin Labbe 2019-10-17  206  	while (src_sg) {
48fe583fe54177 Corentin Labbe 2019-10-17  207  		desc =3D &mc->chanlist[flo=
w].tl[tloffset];
48fe583fe54177 Corentin Labbe 2019-10-17  208  		memset(desc, 0, sizeof(str=
uct meson_desc));
48fe583fe54177 Corentin Labbe 2019-10-17  209  =

3d04158814e7a8 Corentin Labbe 2019-11-17  210  		desc->t_src =3D cpu_to_le3=
2(sg_dma_address(src_sg));
3d04158814e7a8 Corentin Labbe 2019-11-17  211  		desc->t_dst =3D cpu_to_le3=
2(sg_dma_address(dst_sg));
48fe583fe54177 Corentin Labbe 2019-10-17  212  		todo =3D min(len, sg_dma_l=
en(src_sg));
3d04158814e7a8 Corentin Labbe 2019-11-17  213  		v =3D (op->keymode << 20) =
| DESC_OWN | todo | (algt->blockmode << 26);
3d04158814e7a8 Corentin Labbe 2019-11-17  214  		if (rctx->op_dir)
3d04158814e7a8 Corentin Labbe 2019-11-17  215  			v |=3D DESC_ENCRYPTION;
48fe583fe54177 Corentin Labbe 2019-10-17  216  		len -=3D todo;
48fe583fe54177 Corentin Labbe 2019-10-17  217  =

48fe583fe54177 Corentin Labbe 2019-10-17  218  		if (!sg_next(src_sg))
3d04158814e7a8 Corentin Labbe 2019-11-17  219  			v |=3D DESC_LAST;
3d04158814e7a8 Corentin Labbe 2019-11-17  220  		desc->t_status =3D cpu_to_=
le32(v);
48fe583fe54177 Corentin Labbe 2019-10-17  221  		tloffset++;
48fe583fe54177 Corentin Labbe 2019-10-17  222  		src_sg =3D sg_next(src_sg);
48fe583fe54177 Corentin Labbe 2019-10-17  223  		dst_sg =3D sg_next(dst_sg);
48fe583fe54177 Corentin Labbe 2019-10-17  224  	}
48fe583fe54177 Corentin Labbe 2019-10-17  225  =

48fe583fe54177 Corentin Labbe 2019-10-17  226  	reinit_completion(&mc->chan=
list[flow].complete);
48fe583fe54177 Corentin Labbe 2019-10-17  227  	mc->chanlist[flow].status =
=3D 0;
48fe583fe54177 Corentin Labbe 2019-10-17  228  	writel(mc->chanlist[flow].t=
_phy | 2, mc->base + (flow << 2));
48fe583fe54177 Corentin Labbe 2019-10-17  229  	wait_for_completion_interru=
ptible_timeout(&mc->chanlist[flow].complete,
48fe583fe54177 Corentin Labbe 2019-10-17  230  						  msecs_to_jiffies(500=
));
48fe583fe54177 Corentin Labbe 2019-10-17  231  	if (mc->chanlist[flow].stat=
us =3D=3D 0) {
48fe583fe54177 Corentin Labbe 2019-10-17  232  		dev_err(mc->dev, "DMA time=
out for flow %d\n", flow);
48fe583fe54177 Corentin Labbe 2019-10-17  233  		err =3D -EINVAL;
48fe583fe54177 Corentin Labbe 2019-10-17  234  	}
48fe583fe54177 Corentin Labbe 2019-10-17  235  =

48fe583fe54177 Corentin Labbe 2019-10-17  236  	dma_unmap_single(mc->dev, p=
hykeyiv, keyivlen, DMA_TO_DEVICE);
48fe583fe54177 Corentin Labbe 2019-10-17  237  =

48fe583fe54177 Corentin Labbe 2019-10-17  238  	if (areq->src =3D=3D areq->=
dst) {
5595d0dc1d33b3 Xiang Chen     2021-03-16  239  		dma_unmap_sg(mc->dev, areq=
->src, sg_nents(areq->src), DMA_BIDIRECTIONAL);
48fe583fe54177 Corentin Labbe 2019-10-17  240  	} else {
5595d0dc1d33b3 Xiang Chen     2021-03-16  241  		dma_unmap_sg(mc->dev, areq=
->src, sg_nents(areq->src), DMA_TO_DEVICE);
5595d0dc1d33b3 Xiang Chen     2021-03-16  242  		dma_unmap_sg(mc->dev, areq=
->dst, sg_nents(areq->dst), DMA_FROM_DEVICE);
48fe583fe54177 Corentin Labbe 2019-10-17  243  	}
48fe583fe54177 Corentin Labbe 2019-10-17  244  =

48fe583fe54177 Corentin Labbe 2019-10-17  245  	if (areq->iv && ivsize > 0)=
 {
48fe583fe54177 Corentin Labbe 2019-10-17  246  		if (rctx->op_dir =3D=3D ME=
SON_DECRYPT) {
48fe583fe54177 Corentin Labbe 2019-10-17  247  			memcpy(areq->iv, backup_i=
v, ivsize);
48fe583fe54177 Corentin Labbe 2019-10-17  248  		} else {
48fe583fe54177 Corentin Labbe 2019-10-17  249  			scatterwalk_map_and_copy(=
areq->iv, areq->dst,
48fe583fe54177 Corentin Labbe 2019-10-17  250  						 areq->cryptlen - ivsi=
ze,
48fe583fe54177 Corentin Labbe 2019-10-17  251  						 ivsize, 0);
48fe583fe54177 Corentin Labbe 2019-10-17  252  		}
48fe583fe54177 Corentin Labbe 2019-10-17  253  	}
48fe583fe54177 Corentin Labbe 2019-10-17  254  theend:
453431a54934d9 Waiman Long    2020-08-06  255  	kfree_sensitive(bkeyiv);
453431a54934d9 Waiman Long    2020-08-06  256  	kfree_sensitive(backup_iv);
48fe583fe54177 Corentin Labbe 2019-10-17  257  =

48fe583fe54177 Corentin Labbe 2019-10-17  258  	return err;
48fe583fe54177 Corentin Labbe 2019-10-17  259  }
48fe583fe54177 Corentin Labbe 2019-10-17  260  =


:::::: The code at line 185 was first introduced by commit
:::::: 48fe583fe54177bfb80f348e2a5cc34c3f710095 crypto: amlogic - Add crypt=
o accelerator for amlogic GXL

:::::: TO: Corentin Labbe <clabbe@baylibre.com>
:::::: CC: Herbert Xu <herbert@gondor.apana.org.au>

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all(a)lists.01.org

--===============4470619684956773305==
Content-Type: application/gzip
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment; filename="config.gz"

H4sICG87B2EAAy5jb25maWcAjFxLd9w2st7nV/RxNplFHL2sce49WqBJsBtpkqABsLulDY8stTy6
0cPTkhL7398qgA8ALHY8i4yFKuJZj68Khf75p59n7O31+fH69f7m+uHh++zL7mm3v37d3c7u7h92
/ztL5ayUZsZTYd4Dc37/9Pbtt28fz5vzs9mH98cn749+3d+czFa7/dPuYZY8P93df3mDDu6fn376
+adElplYNEnSrLnSQpaN4Vtz8e7m4frpy+yv3f4F+GbHp++P3h/Nfvly//o/v/0G/3283++f9789
PPz12HzdP//f7uZ1dnb37+O7D79/vju9/f3347Pjjx+vj49vj27Ojj/vbj9/Pj39/fb0/O7uw7/e
daMuhmEvjrypCN0kOSsXF9/7Rvyz5z0+PYL/dbQ8HXcCbdBJnqdDF7nHF3YAIyasbHJRrrwRh8ZG
G2ZEEtCWTDdMF81CGjlJaGRtqtqQdFFC13wgCfWp2UjlzWBeizw1ouCNYfOcN1oqryuzVJzBKstM
wn+AReOncKI/zxZWQh5mL7vXt6/DGc+VXPGygSPWReUNXArT8HLdMAWbJAphLk5PoJduyrKoBIxu
uDaz+5fZ0/Mrdtx9XbNKNEuYCVeWxdtvmbC82/B376jmhtX+7tkFN5rlxuNfsjVvVlyVPG8WV8Kb
uE+ZA+WEJuVXBaMp26upL+QU4YwmXGnjSVo4234n/an6Oxkz4IQP0bdXh7+Wh8lnh8i4EOKUU56x
OjdWVryz6ZqXUpuSFfzi3S9Pz087UPC+X71hFTmgvtRrUSUkrZJabJviU81rTjJsmEmWzTQ9UVLr
puCFVJcNM4YlS5Kv1jwXc5LEajCoxFbYY2cKhrccsAyQ57xTPdDi2cvb55fvL6+7x0H1FrzkSiRW
ySsl557e+yS9lBtfwFQKrRr2sFFc8zKlv0qWvlZgSyoLJsqwTYuCYmqWgitczuW480IL5JwkjMbx
Z1Uwo+AQYW9A4Y1UNBeuS63BuoIxKGQa2cNMqoSnrakTvj/QFVOat7Prz8zvOeXzepHp8Gx3T7ez
57volAYfI5OVljWM6QQsld6I9sh9FqsL36mP1ywXKTO8yZk2TXKZ5MR5W8O+HsQnItv++JqXRh8k
olVnacJ8y0uxFXDULP2jJvkKqZu6wilH5s0pYlLVdrpKWzcTuamDPFYpzP0j4AhKL8CrrsAhcRB8
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
8tfLeFlwW57CI5qeAMmg0gd3ZpoZ2SYtEyIdJGtMQ44ps3DPuFybBeBkzFmBj+WiPp2KjLEf05J+
S6ow0hbVA0suhR8SPgH+/PX9E77gNiPZTSNxm2kedpAimXbKVO5Hsk3LRNPeTMNmNbwy8mjVqfgs
6bw4cgxHJjKLCHOBjiaUQGoLtC9S2XQAAWiFYO3I7h4EVXqKo5bi3HiOzWYTGcynMwvV6iFWYqEd
OIg2nx+SKt8Jsk/rimc8pm5RZlS+/16I8gNU7CBhanomiOrbJExgPLHa6zIyKPf1M92oojjDUvqu
GfSJT1wyLIgAh7dRyge7pMvRuwHvd9zat6nra8a8EvlKdScOLX6LgBov9KgbaQT3LFzBmt+U8rvY
fYcukzhLlUojFZKnn9thWsMO9XBI2vvZ7dSSaNGk45NRiaC7PJvl0iuxgWSWPt13p3/KmKErlqtl
Hx1xK823IEKrdPN7fUFd0AZEmM2Z2l9knk4dr0MIKD3BD0n1EVZmOIhR6y5yzE/xlO/iuCljMprr
ghqTQ5BD8s3EsKzMNssqdXIEoS1CSLdOnAGOQyqxtTEHBT1e0VrikSFeO9QVw4x6Rn0FeU3f5S84
dYUo0C70Q225Q9pab6BJrJXkmo/nKfyJusAi0ZKd8ihMoqPcplIks/n5zDaGtlHM3WaqOn9FovNT
P5korJz1Mrdp0AUxZcwh0PtYviUQpEGsVYk8Tw2ljaCzVRSe7S7HBE8ZOLSli0DvH2MYtvQDz2Rz
DhzzIKAm0JWN7ZhgvjRHaocuknw/OPcdTzXTSIWxaPz1lUGNDxVi2/Dr0KfVQc+6SQqQSymVaMND
1wmUBWawhafV4gKKtBEgvco1qGtjBRif6trnFzLEq8i2RGANpyfFevsiEIS2o8j0SJgop/I0eKau
XYekejTVPG3MiOaXbMRgKfbpIdqdipXjW8+iUyQr85R8Klwv8slJU5R+YAnhKMqT+kG8ps1WBC7k
YtsyhE4U1JIQnkzE+VZ/mS4RqePLBHFLMO75OEm+UBZNUgauo3UZ0lxjaJ7Kqwu/gGmzihFeWfdW
/T34QqMqPSL2855+Z7bQLMmt17bmaet9CeJI5MbmwXPC4Chtr/eSgGdblUZ1oba4oy8po6hptvZX
9CgUilbeXBPQlDvD36VXl1clz0XZOcaiWwq6hKebBFkD2LIzBpGpi26wTjYY0IH8YYjiwA+Kp7aF
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
iekgAgA=
--===============4470619684956773305==--

