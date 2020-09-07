Content-Type: multipart/mixed; boundary="===============2677431159932663771=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: [char-misc:char-misc-testing 27/30] drivers/android/binder_alloc.c:355:9: warning: Variable 'n' is reassigned a value before the old one has been used.
Date: Mon, 07 Sep 2020 20:40:41 +0800
Message-ID: <202009072035.UDVBPGZe%lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============2677431159932663771==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

CC: kbuild-all(a)lists.01.org
TO: Martijn Coenen <maco@android.com>
CC: "Greg Kroah-Hartman" <gregkh@linuxfoundation.org>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/gregkh/char-misc.gi=
t char-misc-testing
head:   ab04de8ec235ab03573e7ef33b21c357ba248b5f
commit: 261e7818f06ec51e488e007f787ccd7e77272918 [27/30] binder: print warn=
ings when detecting oneway spamming.
:::::: branch date: 4 hours ago
:::::: commit date: 4 days ago
compiler: sparc64-linux-gcc (GCC) 9.3.0

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>


cppcheck warnings: (new ones prefixed by >>)

>> drivers/android/binder_alloc.c:355:9: warning: Variable 'n' is reassigne=
d a value before the old one has been used. [redundantAssignment]
    for (n =3D rb_first(&alloc->allocated_buffers); n !=3D NULL;
           ^
   drivers/android/binder_alloc.c:350:0: note: Variable 'n' is reassigned a=
 value before the old one has been used.
    struct rb_node *n =3D alloc->free_buffers.rb_node;
   ^
   drivers/android/binder_alloc.c:355:9: note: Variable 'n' is reassigned a=
 value before the old one has been used.
    for (n =3D rb_first(&alloc->allocated_buffers); n !=3D NULL;
           ^

# https://git.kernel.org/pub/scm/linux/kernel/git/gregkh/char-misc.git/comm=
it/?id=3D261e7818f06ec51e488e007f787ccd7e77272918
git remote add char-misc https://git.kernel.org/pub/scm/linux/kernel/git/gr=
egkh/char-misc.git
git fetch --no-tags char-misc char-misc-testing
git checkout 261e7818f06ec51e488e007f787ccd7e77272918
vim +/n +355 drivers/android/binder_alloc.c

da1b9564e85b1d Minchan Kim    2018-08-23  340  =

261e7818f06ec5 Martijn Coenen 2020-08-21  341  static void debug_low_async_=
space_locked(struct binder_alloc *alloc, int pid)
261e7818f06ec5 Martijn Coenen 2020-08-21  342  {
261e7818f06ec5 Martijn Coenen 2020-08-21  343  	/*
261e7818f06ec5 Martijn Coenen 2020-08-21  344  	 * Find the amount and size=
 of buffers allocated by the current caller;
261e7818f06ec5 Martijn Coenen 2020-08-21  345  	 * The idea is that once we=
 cross the threshold, whoever is responsible
261e7818f06ec5 Martijn Coenen 2020-08-21  346  	 * for the low async space =
is likely to try to send another async txn,
261e7818f06ec5 Martijn Coenen 2020-08-21  347  	 * and at some point we'll =
catch them in the act. This is more efficient
261e7818f06ec5 Martijn Coenen 2020-08-21  348  	 * than keeping a map per p=
id.
261e7818f06ec5 Martijn Coenen 2020-08-21  349  	 */
261e7818f06ec5 Martijn Coenen 2020-08-21  350  	struct rb_node *n =3D alloc=
->free_buffers.rb_node;
261e7818f06ec5 Martijn Coenen 2020-08-21  351  	struct binder_buffer *buffe=
r;
261e7818f06ec5 Martijn Coenen 2020-08-21  352  	size_t total_alloc_size =3D=
 0;
261e7818f06ec5 Martijn Coenen 2020-08-21  353  	size_t num_buffers =3D 0;
261e7818f06ec5 Martijn Coenen 2020-08-21  354  =

261e7818f06ec5 Martijn Coenen 2020-08-21 @355  	for (n =3D rb_first(&alloc-=
>allocated_buffers); n !=3D NULL;
261e7818f06ec5 Martijn Coenen 2020-08-21  356  		 n =3D rb_next(n)) {
261e7818f06ec5 Martijn Coenen 2020-08-21  357  		buffer =3D rb_entry(n, str=
uct binder_buffer, rb_node);
261e7818f06ec5 Martijn Coenen 2020-08-21  358  		if (buffer->pid !=3D pid)
261e7818f06ec5 Martijn Coenen 2020-08-21  359  			continue;
261e7818f06ec5 Martijn Coenen 2020-08-21  360  		if (!buffer->async_transac=
tion)
261e7818f06ec5 Martijn Coenen 2020-08-21  361  			continue;
261e7818f06ec5 Martijn Coenen 2020-08-21  362  		total_alloc_size +=3D bind=
er_alloc_buffer_size(alloc, buffer)
261e7818f06ec5 Martijn Coenen 2020-08-21  363  			+ sizeof(struct binder_bu=
ffer);
261e7818f06ec5 Martijn Coenen 2020-08-21  364  		num_buffers++;
261e7818f06ec5 Martijn Coenen 2020-08-21  365  	}
261e7818f06ec5 Martijn Coenen 2020-08-21  366  =

261e7818f06ec5 Martijn Coenen 2020-08-21  367  	/*
261e7818f06ec5 Martijn Coenen 2020-08-21  368  	 * Warn if this pid has mor=
e than 50 transactions, or more than 50% of
261e7818f06ec5 Martijn Coenen 2020-08-21  369  	 * async space (which is 25=
% of total buffer size).
261e7818f06ec5 Martijn Coenen 2020-08-21  370  	 */
261e7818f06ec5 Martijn Coenen 2020-08-21  371  	if (num_buffers > 50 || tot=
al_alloc_size > alloc->buffer_size / 4) {
261e7818f06ec5 Martijn Coenen 2020-08-21  372  		binder_alloc_debug(BINDER_=
DEBUG_USER_ERROR,
261e7818f06ec5 Martijn Coenen 2020-08-21  373  			     "%d: pid %d spamming=
 oneway? %zd buffers allocated for a total size of %zd\n",
261e7818f06ec5 Martijn Coenen 2020-08-21  374  			      alloc->pid, pid, nu=
m_buffers, total_alloc_size);
261e7818f06ec5 Martijn Coenen 2020-08-21  375  	}
261e7818f06ec5 Martijn Coenen 2020-08-21  376  }
261e7818f06ec5 Martijn Coenen 2020-08-21  377  =


---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all(a)lists.01.org
--===============2677431159932663771==--

