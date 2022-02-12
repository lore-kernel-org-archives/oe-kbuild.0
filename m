Content-Type: multipart/mixed; boundary="===============7078440640994144780=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: [ammarfaizi2-block:crng/random/jd/fast-mix-lfsr 37/37] drivers/char/random.c:1265:11: warning: Array 'irq_data[2]' accessed at index 2, which is out of bounds. [arrayIndexOutOfBounds]
Date: Sat, 12 Feb 2022 18:38:29 +0800
Message-ID: <202202121459.jrME8lq2-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============7078440640994144780==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

CC: kbuild-all(a)lists.01.org
CC: "GNU/Weeb Mailing List" <gwml@vger.gnuweeb.org>
CC: linux-kernel(a)vger.kernel.org
TO: "Jason A. Donenfeld" <zx2c4@kernel.org>

tree:   https://github.com/ammarfaizi2/linux-block crng/random/jd/fast-mix-=
lfsr
head:   303d2e145b16d4e7a82089c20361b403ed8e05a2
commit: 303d2e145b16d4e7a82089c20361b403ed8e05a2 [37/37] random: use max-pe=
riod LFSR for irq accumulation
:::::: branch date: 10 hours ago
:::::: commit date: 10 hours ago
compiler: sh4-linux-gcc (GCC) 11.2.0

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>


cppcheck possible warnings: (new ones prefixed by >>, may not real problems)

>> drivers/char/random.c:1265:11: warning: Array 'irq_data[2]' accessed at =
index 2, which is out of bounds. [arrayIndexOutOfBounds]
     irq_data[2] =3D regs ? instruction_pointer(regs) : _RET_IP_;
             ^
   drivers/char/random.c:1266:11: warning: Array 'irq_data[2]' accessed at =
index 3, which is out of bounds. [arrayIndexOutOfBounds]
     irq_data[3] =3D get_reg(fast_pool, regs);
             ^

vim +1265 drivers/char/random.c

b5ac3cf92b7bc6 Jason A. Donenfeld        2022-02-04  1245  =

703f7066f40599 Sebastian Andrzej Siewior 2021-12-07  1246  void add_interru=
pt_randomness(int irq)
^1da177e4c3f41 Linus Torvalds            2005-04-16  1247  {
b5ac3cf92b7bc6 Jason A. Donenfeld        2022-02-04  1248  	enum { MIX_INFL=
IGHT =3D 1U << 31 };
1b2a1a7e8ad114 Christoph Lameter         2014-08-17  1249  	struct fast_poo=
l *fast_pool =3D this_cpu_ptr(&irq_randomness);
775f4b297b7806 Theodore Ts'o             2012-07-02  1250  	struct pt_regs =
*regs =3D get_irq_regs();
775f4b297b7806 Theodore Ts'o             2012-07-02  1251  	unsigned long n=
ow =3D jiffies;
655b226470b229 Theodore Ts'o             2013-09-22  1252  	cycles_t cycles=
 =3D random_get_entropy();
b5ac3cf92b7bc6 Jason A. Donenfeld        2022-02-04  1253  	unsigned int ne=
w_count;
303d2e145b16d4 Jason A. Donenfeld        2022-02-11  1254  	unsigned long i=
rq_data[16 / sizeof(long)];
655b226470b229 Theodore Ts'o             2013-09-22  1255  =

ee3e00e9e7101c Theodore Ts'o             2014-06-15  1256  	if (cycles =3D=
=3D 0)
ee3e00e9e7101c Theodore Ts'o             2014-06-15  1257  		cycles =3D get=
_reg(fast_pool, regs);
dd70d1ccfa7bed Jason A. Donenfeld        2022-02-10  1258  =

dd70d1ccfa7bed Jason A. Donenfeld        2022-02-10  1259  	if (sizeof(unsi=
gned long) =3D=3D 8) {
303d2e145b16d4 Jason A. Donenfeld        2022-02-11  1260  		irq_data[0] =
=3D cycles ^ rol64(now, 32) ^ irq;
303d2e145b16d4 Jason A. Donenfeld        2022-02-11  1261  		irq_data[1] =
=3D regs ? instruction_pointer(regs) : _RET_IP_;
dd70d1ccfa7bed Jason A. Donenfeld        2022-02-10  1262  	} else {
303d2e145b16d4 Jason A. Donenfeld        2022-02-11  1263  		irq_data[0] =
=3D cycles ^ irq;
303d2e145b16d4 Jason A. Donenfeld        2022-02-11  1264  		irq_data[1] =
=3D now;
303d2e145b16d4 Jason A. Donenfeld        2022-02-11 @1265  		irq_data[2] =
=3D regs ? instruction_pointer(regs) : _RET_IP_;
303d2e145b16d4 Jason A. Donenfeld        2022-02-11  1266  		irq_data[3] =
=3D get_reg(fast_pool, regs);
dd70d1ccfa7bed Jason A. Donenfeld        2022-02-10  1267  	}
dd70d1ccfa7bed Jason A. Donenfeld        2022-02-10  1268  =

303d2e145b16d4 Jason A. Donenfeld        2022-02-11  1269  	fast_mix(fast_p=
ool->pool, (u32 *)irq_data);
303d2e145b16d4 Jason A. Donenfeld        2022-02-11  1270  =

b5ac3cf92b7bc6 Jason A. Donenfeld        2022-02-04  1271  	/* The _acquire=
 here pairs with the atomic_set_release in mix_interrupt_randomness(). */
b5ac3cf92b7bc6 Jason A. Donenfeld        2022-02-04  1272  	new_count =3D (=
unsigned int)atomic_inc_return_acquire(&fast_pool->count);
3060d6fe285706 Yinghai Lu                2008-08-19  1273  =

43838a23a05fbd Theodore Ts'o             2018-04-11  1274  	if (unlikely(cr=
ng_init =3D=3D 0)) {
b5ac3cf92b7bc6 Jason A. Donenfeld        2022-02-04  1275  		if (new_count =
>=3D 64 &&
fc2551cdc07cfb Jason A. Donenfeld        2022-02-09  1276  		    crng_fast_=
load(fast_pool->pool, sizeof(fast_pool->pool)) > 0) {
b5ac3cf92b7bc6 Jason A. Donenfeld        2022-02-04  1277  			atomic_set(&f=
ast_pool->count, 0);
e192be9d9a3055 Theodore Ts'o             2016-06-12  1278  			fast_pool->la=
st =3D now;
47869e1feee7c1 Jason A. Donenfeld        2022-02-09  1279  =

af3e015e1f4ac4 Jason A. Donenfeld        2022-02-11  1280  			/*
af3e015e1f4ac4 Jason A. Donenfeld        2022-02-11  1281  			 * Technicall=
y this call means that we're using a spinlock_t
47869e1feee7c1 Jason A. Donenfeld        2022-02-09  1282  			 * in the IRQ=
 handler, which isn't terrific for PREEMPT_RT.
47869e1feee7c1 Jason A. Donenfeld        2022-02-09  1283  			 * However, t=
his only happens during boot, and then never
47869e1feee7c1 Jason A. Donenfeld        2022-02-09  1284  			 * again, so =
we live with it.
47869e1feee7c1 Jason A. Donenfeld        2022-02-09  1285  			 */
47869e1feee7c1 Jason A. Donenfeld        2022-02-09  1286  			mix_pool_byte=
s(&fast_pool->pool, sizeof(fast_pool->pool));
e192be9d9a3055 Theodore Ts'o             2016-06-12  1287  		}
e192be9d9a3055 Theodore Ts'o             2016-06-12  1288  		return;
e192be9d9a3055 Theodore Ts'o             2016-06-12  1289  	}
e192be9d9a3055 Theodore Ts'o             2016-06-12  1290  =

b5ac3cf92b7bc6 Jason A. Donenfeld        2022-02-04  1291  	if (new_count &=
 MIX_INFLIGHT)
^1da177e4c3f41 Linus Torvalds            2005-04-16  1292  		return;
^1da177e4c3f41 Linus Torvalds            2005-04-16  1293  =

b5ac3cf92b7bc6 Jason A. Donenfeld        2022-02-04  1294  	if (new_count <=
 64 && !time_after(now, fast_pool->last + HZ))
91fcb532efe366 Theodore Ts'o             2014-06-10  1295  		return;
83664a6928a420 H. Peter Anvin            2014-03-17  1296  =

b5ac3cf92b7bc6 Jason A. Donenfeld        2022-02-04  1297  	if (unlikely(!f=
ast_pool->mix.func))
b5ac3cf92b7bc6 Jason A. Donenfeld        2022-02-04  1298  		INIT_WORK(&fas=
t_pool->mix, mix_interrupt_randomness);
b5ac3cf92b7bc6 Jason A. Donenfeld        2022-02-04  1299  	atomic_or(MIX_I=
NFLIGHT, &fast_pool->count);
b5ac3cf92b7bc6 Jason A. Donenfeld        2022-02-04  1300  	queue_work_on(r=
aw_smp_processor_id(), system_highpri_wq, &fast_pool->mix);
^1da177e4c3f41 Linus Torvalds            2005-04-16  1301  }
4b44f2d18a3305 Stephan Mueller           2016-05-02  1302  EXPORT_SYMBOL_GP=
L(add_interrupt_randomness);
^1da177e4c3f41 Linus Torvalds            2005-04-16  1303  =


---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all(a)lists.01.org
--===============7078440640994144780==--

