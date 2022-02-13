Content-Type: multipart/mixed; boundary="===============7118834398668180716=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: [ammarfaizi2-block:crng/random/jd/fast-mix-lfsr 38/41] drivers/char/random.c:471 crng_pre_init_inject() error: uninitialized symbol 'flags'.
Date: Sun, 13 Feb 2022 15:27:27 +0800
Message-ID: <202202131528.d5D03Yt7-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============7118834398668180716==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

CC: kbuild-all(a)lists.01.org
CC: "GNU/Weeb Mailing List" <gwml@vger.gnuweeb.org>
CC: linux-kernel(a)vger.kernel.org
TO: "Jason A. Donenfeld" <zx2c4@kernel.org>

tree:   https://github.com/ammarfaizi2/linux-block crng/random/jd/fast-mix-=
lfsr
head:   7fbcf700feb7daa3b4afaff1eabf9582ea4d3a0e
commit: be05d87f9b42e54d0db561b26e534922e6004280 [38/41] random: unify earl=
y init crng load accounting
:::::: branch date: 6 hours ago
:::::: commit date: 6 hours ago
config: microblaze-randconfig-m031-20220213 (https://download.01.org/0day-c=
i/archive/20220213/202202131528.d5D03Yt7-lkp(a)intel.com/config)
compiler: microblaze-linux-gcc (GCC) 11.2.0

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>
Reported-by: Dan Carpenter <dan.carpenter@oracle.com>

New smatch warnings:
drivers/char/random.c:471 crng_pre_init_inject() error: uninitialized symbo=
l 'flags'.

Old smatch warnings:
drivers/char/random.c:502 crng_pre_init_inject() error: uninitialized symbo=
l 'flags'.
arch/microblaze/include/asm/thread_info.h:91 current_thread_info() error: u=
ninitialized symbol 'sp'.

vim +/flags +471 drivers/char/random.c

c92e040d575a73 Theodore Ts'o      2016-05-04  438  =

6abdf17ccd90de Jason A. Donenfeld 2022-02-11  439  /*
be05d87f9b42e5 Jason A. Donenfeld 2022-02-12  440   * This function is for =
crng_init < 2 only. It loads entropy directly
be05d87f9b42e5 Jason A. Donenfeld 2022-02-12  441   * into the crng's key, =
without going through the input pool. It is,
be05d87f9b42e5 Jason A. Donenfeld 2022-02-12  442   * generally speaking, n=
ot very safe, but we use this only at early
be05d87f9b42e5 Jason A. Donenfeld 2022-02-12  443   * boot time when it's b=
etter to have something there rather than
be05d87f9b42e5 Jason A. Donenfeld 2022-02-12  444   * nothing.
6abdf17ccd90de Jason A. Donenfeld 2022-02-11  445   *
be05d87f9b42e5 Jason A. Donenfeld 2022-02-12  446   * There are two paths, =
a slow one and a fast one. The slow one
be05d87f9b42e5 Jason A. Donenfeld 2022-02-12  447   * hashes the input alon=
g with the current key. The fast one simply
be05d87f9b42e5 Jason A. Donenfeld 2022-02-12  448   * xors it in, and shoul=
d only be used from interrupt context.
be05d87f9b42e5 Jason A. Donenfeld 2022-02-12  449   *
be05d87f9b42e5 Jason A. Donenfeld 2022-02-12  450   * If account is set, th=
en the crng_init_cnt counter is incremented.
be05d87f9b42e5 Jason A. Donenfeld 2022-02-12  451   * This shouldn't be set=
 by functions like add_device_randomness(),
be05d87f9b42e5 Jason A. Donenfeld 2022-02-12  452   * where we can't trust =
the buffer passed to it is guaranteed to be
be05d87f9b42e5 Jason A. Donenfeld 2022-02-12  453   * unpredictable (so it =
might not have any entropy@all).
be05d87f9b42e5 Jason A. Donenfeld 2022-02-12  454   *
be05d87f9b42e5 Jason A. Donenfeld 2022-02-12  455   * Returns the number of=
 bytes processed from cp, which is bounded by
be05d87f9b42e5 Jason A. Donenfeld 2022-02-12  456   * CRNG_INIT_CNT_THRESH =
if account is true.
6abdf17ccd90de Jason A. Donenfeld 2022-02-11  457   */
be05d87f9b42e5 Jason A. Donenfeld 2022-02-12  458  static size_t crng_pre_i=
nit_inject(const void *cp, size_t len,
be05d87f9b42e5 Jason A. Donenfeld 2022-02-12  459  				   bool fast, bool a=
ccount)
e192be9d9a3055 Theodore Ts'o      2016-06-12  460  {
6abdf17ccd90de Jason A. Donenfeld 2022-02-11  461  	static int crng_init_cn=
t =3D 0;
6abdf17ccd90de Jason A. Donenfeld 2022-02-11  462  	unsigned long flags;
6abdf17ccd90de Jason A. Donenfeld 2022-02-11  463  =

be05d87f9b42e5 Jason A. Donenfeld 2022-02-12  464  	if (fast) {
6abdf17ccd90de Jason A. Donenfeld 2022-02-11  465  		if (!spin_trylock_irqs=
ave(&base_crng.lock, flags))
6abdf17ccd90de Jason A. Donenfeld 2022-02-11  466  			return 0;
be05d87f9b42e5 Jason A. Donenfeld 2022-02-12  467  	} else
be05d87f9b42e5 Jason A. Donenfeld 2022-02-12  468  		spin_lock_irqsave(&bas=
e_crng.lock, flags);
be05d87f9b42e5 Jason A. Donenfeld 2022-02-12  469  =

6abdf17ccd90de Jason A. Donenfeld 2022-02-11  470  	if (crng_init !=3D 0) {
6abdf17ccd90de Jason A. Donenfeld 2022-02-11 @471  		spin_unlock_irqrestore=
(&base_crng.lock, flags);
6abdf17ccd90de Jason A. Donenfeld 2022-02-11  472  		return 0;
6abdf17ccd90de Jason A. Donenfeld 2022-02-11  473  	}
be05d87f9b42e5 Jason A. Donenfeld 2022-02-12  474  =

be05d87f9b42e5 Jason A. Donenfeld 2022-02-12  475  	if (account)
be05d87f9b42e5 Jason A. Donenfeld 2022-02-12  476  		len =3D min_t(size_t, =
len, CRNG_INIT_CNT_THRESH - crng_init_cnt);
be05d87f9b42e5 Jason A. Donenfeld 2022-02-12  477  =

be05d87f9b42e5 Jason A. Donenfeld 2022-02-12  478  	if (fast) {
be05d87f9b42e5 Jason A. Donenfeld 2022-02-12  479  		const u8 *src =3D cp;
be05d87f9b42e5 Jason A. Donenfeld 2022-02-12  480  		size_t i;
be05d87f9b42e5 Jason A. Donenfeld 2022-02-12  481  =

be05d87f9b42e5 Jason A. Donenfeld 2022-02-12  482  		for (i =3D 0; i < len;=
 ++i)
be05d87f9b42e5 Jason A. Donenfeld 2022-02-12  483  			base_crng.key[(crng_i=
nit_cnt + i) %
be05d87f9b42e5 Jason A. Donenfeld 2022-02-12  484  				      sizeof(base_cr=
ng.key)] ^=3D src[i];
be05d87f9b42e5 Jason A. Donenfeld 2022-02-12  485  	} else {
be05d87f9b42e5 Jason A. Donenfeld 2022-02-12  486  		struct blake2s_state h=
ash;
be05d87f9b42e5 Jason A. Donenfeld 2022-02-12  487  =

be05d87f9b42e5 Jason A. Donenfeld 2022-02-12  488  		blake2s_init(&hash, si=
zeof(base_crng.key));
be05d87f9b42e5 Jason A. Donenfeld 2022-02-12  489  		blake2s_update(&hash, =
base_crng.key, sizeof(base_crng.key));
be05d87f9b42e5 Jason A. Donenfeld 2022-02-12  490  		blake2s_update(&hash, =
cp, len);
be05d87f9b42e5 Jason A. Donenfeld 2022-02-12  491  		blake2s_final(&hash, b=
ase_crng.key);
6abdf17ccd90de Jason A. Donenfeld 2022-02-11  492  	}
be05d87f9b42e5 Jason A. Donenfeld 2022-02-12  493  =

be05d87f9b42e5 Jason A. Donenfeld 2022-02-12  494  	if (account) {
be05d87f9b42e5 Jason A. Donenfeld 2022-02-12  495  		crng_init_cnt +=3D len;
6abdf17ccd90de Jason A. Donenfeld 2022-02-11  496  		if (crng_init_cnt >=3D=
 CRNG_INIT_CNT_THRESH) {
6abdf17ccd90de Jason A. Donenfeld 2022-02-11  497  			++base_crng.generatio=
n;
6abdf17ccd90de Jason A. Donenfeld 2022-02-11  498  			crng_init =3D 1;
6abdf17ccd90de Jason A. Donenfeld 2022-02-11  499  		}
6abdf17ccd90de Jason A. Donenfeld 2022-02-11  500  	}
6abdf17ccd90de Jason A. Donenfeld 2022-02-11  501  =

6abdf17ccd90de Jason A. Donenfeld 2022-02-11  502  	spin_unlock_irqrestore(=
&base_crng.lock, flags);
6abdf17ccd90de Jason A. Donenfeld 2022-02-11  503  =

be05d87f9b42e5 Jason A. Donenfeld 2022-02-12  504  	if (crng_init =3D=3D 1)
be05d87f9b42e5 Jason A. Donenfeld 2022-02-12  505  		pr_notice("fast init d=
one\n");
6abdf17ccd90de Jason A. Donenfeld 2022-02-11  506  =

be05d87f9b42e5 Jason A. Donenfeld 2022-02-12  507  	return len;
6abdf17ccd90de Jason A. Donenfeld 2022-02-11  508  }
6abdf17ccd90de Jason A. Donenfeld 2022-02-11  509  =


:::::: The code at line 471 was first introduced by commit
:::::: 6abdf17ccd90de572fdc0de00526d6cca03b4229 random: group crng functions

:::::: TO: Jason A. Donenfeld <Jason@zx2c4.com>
:::::: CC: Jason A. Donenfeld <Jason@zx2c4.com>

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all(a)lists.01.org
--===============7118834398668180716==--

