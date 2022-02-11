Content-Type: multipart/mixed; boundary="===============0760479215044633442=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: [linux-next:master 5045/5417] drivers/char/random.c:1266:18: warning: Array 'fast_pool->pool[2]' accessed at index 2, which is out of bounds. [arrayIndexOutOfBounds]
Date: Sat, 12 Feb 2022 01:56:44 +0800
Message-ID: <202202111827.ieoNN1ht-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============0760479215044633442==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

CC: kbuild-all(a)lists.01.org
CC: Linux Memory Management List <linux-mm@kvack.org>
TO: "Jason A. Donenfeld" <zx2c4@kernel.org>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git=
 master
head:   6d9bd4ad4ca08b1114e814c2c42383b8b13be631
commit: 6d66882e05cf59a573cf48d16db945ea32c4c6ba [5045/5417] random: ensure=
 mix_interrupt_randomness() is consistent
:::::: branch date: 3 hours ago
:::::: commit date: 10 hours ago
compiler: riscv64-linux-gcc (GCC) 11.2.0

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>


cppcheck possible warnings: (new ones prefixed by >>, may not real problems)

>> drivers/char/random.c:1266:18: warning: Array 'fast_pool->pool[2]' acces=
sed at index 2, which is out of bounds. [arrayIndexOutOfBounds]
     fast_pool->pool[2] ^=3D regs ? instruction_pointer(regs) : _RET_IP_;
                    ^
   drivers/char/random.c:1267:18: warning: Array 'fast_pool->pool[2]' acces=
sed at index 3, which is out of bounds. [arrayIndexOutOfBounds]
     fast_pool->pool[3] ^=3D get_reg(fast_pool, regs);
                    ^

vim +1266 drivers/char/random.c

08506326bf01385 Jason A. Donenfeld        2022-02-04  1248  =

703f7066f40599c Sebastian Andrzej Siewior 2021-12-07  1249  void add_interr=
upt_randomness(int irq)
^1da177e4c3f415 Linus Torvalds            2005-04-16  1250  {
1b2a1a7e8ad1144 Christoph Lameter         2014-08-17  1251  	struct fast_po=
ol *fast_pool =3D this_cpu_ptr(&irq_randomness);
775f4b297b78060 Theodore Ts'o             2012-07-02  1252  	struct pt_regs=
 *regs =3D get_irq_regs();
775f4b297b78060 Theodore Ts'o             2012-07-02  1253  	unsigned long =
now =3D jiffies;
655b226470b2295 Theodore Ts'o             2013-09-22  1254  	cycles_t cycle=
s =3D random_get_entropy();
08506326bf01385 Jason A. Donenfeld        2022-02-04  1255  	unsigned int n=
ew_count;
655b226470b2295 Theodore Ts'o             2013-09-22  1256  =

b67959013391e48 Jason A. Donenfeld        2022-02-10  1257  	if (cycles =3D=
=3D 0)
b67959013391e48 Jason A. Donenfeld        2022-02-10  1258  		cycles =3D ge=
t_reg(fast_pool, regs);
e192be9d9a30555 Theodore Ts'o             2016-06-12  1259  =

b67959013391e48 Jason A. Donenfeld        2022-02-10  1260  	if (sizeof(uns=
igned long) =3D=3D 8) {
6d66882e05cf59a Jason A. Donenfeld        2022-02-11  1261  		fast_pool->po=
ol[0] ^=3D cycles ^ rol64(now, 32) ^ irq;
6d66882e05cf59a Jason A. Donenfeld        2022-02-11  1262  		fast_pool->po=
ol[1] ^=3D regs ? instruction_pointer(regs) : _RET_IP_;
b67959013391e48 Jason A. Donenfeld        2022-02-10  1263  	} else {
6d66882e05cf59a Jason A. Donenfeld        2022-02-11  1264  		fast_pool->po=
ol[0] ^=3D cycles ^ irq;
6d66882e05cf59a Jason A. Donenfeld        2022-02-11  1265  		fast_pool->po=
ol[1] ^=3D now;
6d66882e05cf59a Jason A. Donenfeld        2022-02-11 @1266  		fast_pool->po=
ol[2] ^=3D regs ? instruction_pointer(regs) : _RET_IP_;
6d66882e05cf59a Jason A. Donenfeld        2022-02-11  1267  		fast_pool->po=
ol[3] ^=3D get_reg(fast_pool, regs);
d968978f395468d Jason A. Donenfeld        2022-02-07  1268  	}
d968978f395468d Jason A. Donenfeld        2022-02-07  1269  =

6d66882e05cf59a Jason A. Donenfeld        2022-02-11  1270  	fast_mix((u32 =
*)fast_pool->pool);
6d66882e05cf59a Jason A. Donenfeld        2022-02-11  1271  	new_count =3D =
(unsigned int)atomic_inc_return_acquire(&fast_pool->count);
d968978f395468d Jason A. Donenfeld        2022-02-07  1272  =

b67959013391e48 Jason A. Donenfeld        2022-02-10  1273  	if (unlikely(c=
rng_init =3D=3D 0)) {
b67959013391e48 Jason A. Donenfeld        2022-02-10  1274  		if (new_count=
 >=3D 64 &&
6d66882e05cf59a Jason A. Donenfeld        2022-02-11  1275  		    crng_fast=
_load(fast_pool->pool, sizeof(fast_pool->pool)) > 0) {
6d66882e05cf59a Jason A. Donenfeld        2022-02-11  1276  			atomic_set(&=
fast_pool->count, 0);
b67959013391e48 Jason A. Donenfeld        2022-02-10  1277  			fast_pool->l=
ast =3D now;
b67959013391e48 Jason A. Donenfeld        2022-02-10  1278  =

b67959013391e48 Jason A. Donenfeld        2022-02-10  1279  			/*
b67959013391e48 Jason A. Donenfeld        2022-02-10  1280  			 * Technical=
ly this call means that we're using a spinlock_t
b67959013391e48 Jason A. Donenfeld        2022-02-10  1281  			 * in the IR=
Q handler, which isn't terrific for PREEMPT_RT.
b67959013391e48 Jason A. Donenfeld        2022-02-10  1282  			 * However, =
this only happens during boot, and then never
b67959013391e48 Jason A. Donenfeld        2022-02-10  1283  			 * again, so=
 we live with it.
b67959013391e48 Jason A. Donenfeld        2022-02-10  1284  			 */
6d66882e05cf59a Jason A. Donenfeld        2022-02-11  1285  			mix_pool_byt=
es(&fast_pool->pool, sizeof(fast_pool->pool));
b67959013391e48 Jason A. Donenfeld        2022-02-10  1286  		}
b67959013391e48 Jason A. Donenfeld        2022-02-10  1287  		return;
c2557a303ab6712 Theodore Ts'o             2012-07-05  1288  	}
eecabf567422eda Theodore Ts'o             2017-06-08  1289  =

b67959013391e48 Jason A. Donenfeld        2022-02-10  1290  	if (new_count =
& FAST_POOL_MIX_INFLIGHT)
b67959013391e48 Jason A. Donenfeld        2022-02-10  1291  		return;
eecabf567422eda Theodore Ts'o             2017-06-08  1292  =

b67959013391e48 Jason A. Donenfeld        2022-02-10  1293  	if (new_count =
< 64 && !time_after(now, fast_pool->last + HZ))
b67959013391e48 Jason A. Donenfeld        2022-02-10  1294  		return;
b67959013391e48 Jason A. Donenfeld        2022-02-10  1295  =

b67959013391e48 Jason A. Donenfeld        2022-02-10  1296  	if (unlikely(!=
fast_pool->mix.func))
b67959013391e48 Jason A. Donenfeld        2022-02-10  1297  		INIT_WORK(&fa=
st_pool->mix, mix_interrupt_randomness);
6d66882e05cf59a Jason A. Donenfeld        2022-02-11  1298  	atomic_or(FAST=
_POOL_MIX_INFLIGHT, &fast_pool->count);
b67959013391e48 Jason A. Donenfeld        2022-02-10  1299  	queue_work_on(=
raw_smp_processor_id(), system_highpri_wq, &fast_pool->mix);
eecabf567422eda Theodore Ts'o             2017-06-08  1300  }
b67959013391e48 Jason A. Donenfeld        2022-02-10  1301  EXPORT_SYMBOL_G=
PL(add_interrupt_randomness);
c2557a303ab6712 Theodore Ts'o             2012-07-05  1302  =


---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all(a)lists.01.org
--===============0760479215044633442==--

