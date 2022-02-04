Content-Type: multipart/mixed; boundary="===============6253700019472267197=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: [rt-devel:linux-5.17.y-rt-rebase 13/101] kernel/printk/printk.c:2871:2: warning: Value stored to 'seq' is never read [clang-analyzer-deadcode.DeadStores]
Date: Fri, 04 Feb 2022 10:32:06 +0800
Message-ID: <202202041057.zFJ31HYP-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============6253700019472267197==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

CC: llvm(a)lists.linux.dev
CC: kbuild-all(a)lists.01.org
CC: linux-kernel(a)vger.kernel.org
TO: John Ogness <john.ogness@linutronix.de>
CC: Sebastian Andrzej Siewior <bigeasy@linutronix.de>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/rt/linux-rt-devel.g=
it linux-5.17.y-rt-rebase
head:   1bb153b054c82122e2f215909ef08a48b82672cb
commit: b7eb4b2778190ee0a85390b4f093bd51470a47ff [13/101] printk: add infra=
stucture for atomic consoles
:::::: branch date: 4 days ago
:::::: commit date: 4 days ago
config: arm-randconfig-c002-20220130 (https://download.01.org/0day-ci/archi=
ve/20220204/202202041057.zFJ31HYP-lkp(a)intel.com/config)
compiler: clang version 15.0.0 (https://github.com/llvm/llvm-project a73e4c=
e6a59b01f0e37037761c1e6889d539d233)
reproduce (this is a W=3D1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/=
make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # install arm cross compiling tool for clang build
        # apt-get install binutils-arm-linux-gnueabi
        # https://git.kernel.org/pub/scm/linux/kernel/git/rt/linux-rt-devel=
.git/commit/?id=3Db7eb4b2778190ee0a85390b4f093bd51470a47ff
        git remote add rt-devel https://git.kernel.org/pub/scm/linux/kernel=
/git/rt/linux-rt-devel.git
        git fetch --no-tags rt-devel linux-5.17.y-rt-rebase
        git checkout b7eb4b2778190ee0a85390b4f093bd51470a47ff
        # save the config file to linux build tree
        COMPILER_INSTALL_PATH=3D$HOME/0day COMPILER=3Dclang make.cross ARCH=
=3Darm clang-analyzer =


If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>


clang-analyzer warnings: (new ones prefixed by >>)
   drivers/video/backlight/qcom-wled.c:1126:3: note: Value stored to 'rc' i=
s never read
                   rc =3D regmap_update_bits(wled->regmap, addr,
                   ^    ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   2 warnings generated.
   drivers/video/fbdev/core/fbmem.c:809:3: warning: Value stored to 'dst' i=
s never read [clang-analyzer-deadcode.DeadStores]
                   dst +=3D c;
                   ^      ~
   drivers/video/fbdev/core/fbmem.c:809:3: note: Value stored to 'dst' is n=
ever read
                   dst +=3D c;
                   ^      ~
   drivers/video/fbdev/core/fbmem.c:887:3: warning: Value stored to 'src' i=
s never read [clang-analyzer-deadcode.DeadStores]
                   src +=3D c;
                   ^      ~
   drivers/video/fbdev/core/fbmem.c:887:3: note: Value stored to 'src' is n=
ever read
                   src +=3D c;
                   ^      ~
   1 warning generated.
   drivers/video/fbdev/core/fbmon.c:925:20: warning: Division by zero [clan=
g-analyzer-core.DivideZero]
                           var->pixclock =3D KHZ2PICOS(var->pixclock);
                                           ^
   include/uapi/linux/fb.h:240:35: note: expanded from macro 'KHZ2PICOS'
   #define KHZ2PICOS(a) (1000000000UL/(a))
                         ~~~~~~~~~~~~^~~~
   drivers/video/fbdev/core/fbmon.c:899:6: note: Assuming 'edid' is not equ=
al to NULL
           if (edid =3D=3D NULL || var =3D=3D NULL)
               ^~~~~~~~~~~~
   drivers/video/fbdev/core/fbmon.c:899:6: note: Left side of '||' is false
   drivers/video/fbdev/core/fbmon.c:899:22: note: Assuming 'var' is not equ=
al to NULL
           if (edid =3D=3D NULL || var =3D=3D NULL)
                               ^~~~~~~~~~~
   drivers/video/fbdev/core/fbmon.c:899:2: note: Taking false branch
           if (edid =3D=3D NULL || var =3D=3D NULL)
           ^
   drivers/video/fbdev/core/fbmon.c:902:6: note: Assuming the condition is =
false
           if (!(edid_checksum(edid)))
               ^~~~~~~~~~~~~~~~~~~~~~
   drivers/video/fbdev/core/fbmon.c:902:2: note: Taking false branch
           if (!(edid_checksum(edid)))
           ^
   drivers/video/fbdev/core/fbmon.c:905:6: note: Assuming the condition is =
false
           if (!(edid_check_header(edid)))
               ^~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/video/fbdev/core/fbmon.c:905:2: note: Taking false branch
           if (!(edid_check_header(edid)))
           ^
   drivers/video/fbdev/core/fbmon.c:910:2: note: Loop condition is true.  E=
ntering loop body
           for (i =3D 0; i < 4; i++, block +=3D DETAILED_TIMING_DESCRIPTION=
_SIZE) {
           ^
   drivers/video/fbdev/core/fbmon.c:911:7: note: Calling 'edid_is_timing_bl=
ock'
                   if (edid_is_timing_block(block)) {
                       ^~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/video/fbdev/core/fbmon.c:138:7: note: Assuming the condition is =
false
           if ((block[0] !=3D 0x00) || (block[1] !=3D 0x00) ||
                ^~~~~~~~~~~~~~~~
   drivers/video/fbdev/core/fbmon.c:138:6: note: Left side of '||' is false
           if ((block[0] !=3D 0x00) || (block[1] !=3D 0x00) ||
               ^
   drivers/video/fbdev/core/fbmon.c:138:29: note: Assuming the condition is=
 false
           if ((block[0] !=3D 0x00) || (block[1] !=3D 0x00) ||
                                      ^~~~~~~~~~~~~~~~
   drivers/video/fbdev/core/fbmon.c:138:6: note: Left side of '||' is false
           if ((block[0] !=3D 0x00) || (block[1] !=3D 0x00) ||
               ^
   drivers/video/fbdev/core/fbmon.c:139:7: note: Assuming the condition is =
true
               (block[2] !=3D 0x00) || (block[4] !=3D 0x00))
                ^~~~~~~~~~~~~~~~
   drivers/video/fbdev/core/fbmon.c:139:25: note: Left side of '||' is true
               (block[2] !=3D 0x00) || (block[4] !=3D 0x00))
                                  ^
   drivers/video/fbdev/core/fbmon.c:140:3: note: Returning the value 1, whi=
ch participates in a condition later
                   return 1;
                   ^~~~~~~~
   drivers/video/fbdev/core/fbmon.c:911:7: note: Returning from 'edid_is_ti=
ming_block'
                   if (edid_is_timing_block(block)) {
                       ^~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/video/fbdev/core/fbmon.c:911:3: note: Taking true branch
                   if (edid_is_timing_block(block)) {
                   ^
   drivers/video/fbdev/core/fbmon.c:924:4: note: The value 0 is assigned to=
 field 'pixclock'
                           var->pixclock /=3D 1000;
                           ^~~~~~~~~~~~~~~~~~~~~
   drivers/video/fbdev/core/fbmon.c:925:20: note: Division by zero
                           var->pixclock =3D KHZ2PICOS(var->pixclock);
                                           ^
   include/uapi/linux/fb.h:240:35: note: expanded from macro 'KHZ2PICOS'
   #define KHZ2PICOS(a) (1000000000UL/(a))
                         ~~~~~~~~~~~~^~~~
   3 warnings generated.
   kernel/printk/printk.c:157:3: warning: Call to function 'strcpy' is inse=
cure as it does not provide bounding of the memory buffer. Replace unbounde=
d copy functions with analogous functions that support length arguments suc=
h as 'strlcpy'. CWE-119 [clang-analyzer-security.insecureAPI.strcpy]
                   strcpy(devkmsg_log_str, "on");
                   ^~~~~~
   kernel/printk/printk.c:157:3: note: Call to function 'strcpy' is insecur=
e as it does not provide bounding of the memory buffer. Replace unbounded c=
opy functions with analogous functions that support length arguments such a=
s 'strlcpy'. CWE-119
                   strcpy(devkmsg_log_str, "on");
                   ^~~~~~
   kernel/printk/printk.c:159:3: warning: Call to function 'strcpy' is inse=
cure as it does not provide bounding of the memory buffer. Replace unbounde=
d copy functions with analogous functions that support length arguments suc=
h as 'strlcpy'. CWE-119 [clang-analyzer-security.insecureAPI.strcpy]
                   strcpy(devkmsg_log_str, "off");
                   ^~~~~~
   kernel/printk/printk.c:159:3: note: Call to function 'strcpy' is insecur=
e as it does not provide bounding of the memory buffer. Replace unbounded c=
opy functions with analogous functions that support length arguments such a=
s 'strlcpy'. CWE-119
                   strcpy(devkmsg_log_str, "off");
                   ^~~~~~
>> kernel/printk/printk.c:2871:2: warning: Value stored to 'seq' is never r=
ead [clang-analyzer-deadcode.DeadStores]
           seq =3D read_console_seq(con);
           ^     ~~~~~~~~~~~~~~~~~~~~~
   kernel/printk/printk.c:2871:2: note: Value stored to 'seq' is never read
           seq =3D read_console_seq(con);
           ^     ~~~~~~~~~~~~~~~~~~~~~
   1 warning generated.
   Suppressed 1 warnings (1 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   2 warnings generated.
   drivers/video/fbdev/savage/savagefb_driver.c:949:3: warning: Value store=
d to 'memlen' is never read [clang-analyzer-deadcode.DeadStores]
                   memlen =3D var->xres_virtual * var->bits_per_pixel *
                   ^        ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/video/fbdev/savage/savagefb_driver.c:949:3: note: Value stored t=
o 'memlen' is never read
                   memlen =3D var->xres_virtual * var->bits_per_pixel *
                   ^        ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/video/fbdev/savage/savagefb_driver.c:2192:2: warning: Value stor=
ed to 'err' is never read [clang-analyzer-deadcode.DeadStores]
           err =3D -ENOMEM;
           ^     ~~~~~~~
   drivers/video/fbdev/savage/savagefb_driver.c:2192:2: note: Value stored =
to 'err' is never read
           err =3D -ENOMEM;
           ^     ~~~~~~~
   1 warning generated.
   drivers/video/fbdev/savage/savagefb-i2c.c:139:3: warning: Call to functi=
on 'strcpy' is insecure as it does not provide bounding of the memory buffe=
r. Replace unbounded copy functions with analogous functions that support l=
ength arguments such as 'strlcpy'. CWE-119 [clang-analyzer-security.insecur=
eAPI.strcpy]
                   strcpy(chan->adapter.name, name);
                   ^~~~~~
   drivers/video/fbdev/savage/savagefb-i2c.c:139:3: note: Call to function =
'strcpy' is insecure as it does not provide bounding of the memory buffer. =
Replace unbounded copy functions with analogous functions that support leng=
th arguments such as 'strlcpy'. CWE-119
                   strcpy(chan->adapter.name, name);
                   ^~~~~~
   4 warnings generated.
   fs/reiserfs/inode.c:1140:3: warning: Value stored to 'bh' is never read =
[clang-analyzer-deadcode.DeadStores]
                   bh =3D get_last_bh(&path);
                   ^
   fs/reiserfs/inode.c:1140:3: note: Value stored to 'bh' is never read
   fs/reiserfs/inode.c:1142:3: warning: Value stored to 'item' is never rea=
d [clang-analyzer-deadcode.DeadStores]
                   item =3D tp_item_body(&path);
                   ^      ~~~~~~~~~~~~~~~~~~~
   fs/reiserfs/inode.c:1142:3: note: Value stored to 'item' is never read
                   item =3D tp_item_body(&path);
                   ^      ~~~~~~~~~~~~~~~~~~~
   fs/reiserfs/inode.c:3197:3: warning: Value stored to 'ret' is never read=
 [clang-analyzer-deadcode.DeadStores]
                   ret =3D try_to_release_page(page, 0);
                   ^     ~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   fs/reiserfs/inode.c:3197:3: note: Value stored to 'ret' is never read
                   ret =3D try_to_release_page(page, 0);
                   ^     ~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   fs/reiserfs/reiserfs.h:1280:17: warning: The left operand of '&' is a ga=
rbage value [clang-analyzer-core.UndefinedBinaryOperatorResult]
           v2->v =3D (v2->v & cpu_to_le64(15ULL << 60)) | cpu_to_le64(offse=
t);
                          ^
   fs/reiserfs/inode.c:1938:9: note: Assuming field 't_trans_id' is not equ=
al to 0
           BUG_ON(!th->t_trans_id);
                  ^
   include/asm-generic/bug.h:65:45: note: expanded from macro 'BUG_ON'
   #define BUG_ON(condition) do { if (unlikely(condition)) BUG(); } while (=
0)
                                               ^~~~~~~~~
   include/linux/compiler.h:78:42: note: expanded from macro 'unlikely'
   # define unlikely(x)    __builtin_expect(!!(x), 0)
                                               ^
   fs/reiserfs/inode.c:1938:2: note: Taking false branch
           BUG_ON(!th->t_trans_id);
           ^
   include/asm-generic/bug.h:65:32: note: expanded from macro 'BUG_ON'
   #define BUG_ON(condition) do { if (unlikely(condition)) BUG(); } while (=
0)
                                  ^
   fs/reiserfs/inode.c:1938:2: note: Loop condition is false.  Exiting loop
           BUG_ON(!th->t_trans_id);
           ^
   include/asm-generic/bug.h:65:27: note: expanded from macro 'BUG_ON'
   #define BUG_ON(condition) do { if (unlikely(condition)) BUG(); } while (=
0)
                             ^
   fs/reiserfs/inode.c:1943:6: note: Assuming 'err' is 0
           if (err)
               ^~~
   fs/reiserfs/inode.c:1943:2: note: Taking false branch
           if (err)
           ^
   fs/reiserfs/inode.c:1945:6: note: Assuming field 'i_nlink' is not equal =
to 0
           if (!dir->i_nlink) {
               ^~~~~~~~~~~~~
   fs/reiserfs/inode.c:1945:2: note: Taking false branch
           if (!dir->i_nlink) {
           ^
   fs/reiserfs/inode.c:1953:6: note: Assuming field 'k_objectid' is not equ=
al to 0
           if (!ih.ih_key.k_objectid) {
               ^~~~~~~~~~~~~~~~~~~~~
   fs/reiserfs/inode.c:1953:2: note: Taking false branch
           if (!ih.ih_key.k_objectid) {
           ^
   fs/reiserfs/inode.c:1958:6: note: Assuming the condition is false
           if (old_format_only(sb))
               ^
   fs/reiserfs/reiserfs.h:728:29: note: expanded from macro 'old_format_onl=
y'
   #define old_format_only(s) (REISERFS_SB(s)->s_properties & (1 << REISERF=
S_3_5))
                               ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~=
~~~~~~
   fs/reiserfs/inode.c:1958:2: note: Taking false branch
           if (old_format_only(sb))
           ^
   fs/reiserfs/inode.c:1962:3: note: Calling 'make_le_item_head'
                   make_le_item_head(&ih, NULL, KEY_FORMAT_3_6, SD_OFFSET,
                   ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   fs/reiserfs/inode.c:142:6: note: 'key' is null

vim +/seq +2871 kernel/printk/printk.c

b7eb4b2778190e kernel/printk/printk.c John Ogness             2021-12-22  2=
829  =

ca31ea1ffed3ab kernel/printk/printk.c John Ogness             2021-08-10  2=
830  /*
ca31ea1ffed3ab kernel/printk/printk.c John Ogness             2021-08-10  2=
831   * Print one record for the given console. The record printed is whate=
ver
ca31ea1ffed3ab kernel/printk/printk.c John Ogness             2021-08-10  2=
832   * record is the next available record for the given console.
^1da177e4c3f41 kernel/printk.c        Linus Torvalds          2005-04-16  2=
833   *
51794a0d5ef26a kernel/printk/printk.c John Ogness             2021-11-22  2=
834   * @text is a buffer of size CONSOLE_LOG_MAX.
51794a0d5ef26a kernel/printk/printk.c John Ogness             2021-11-22  2=
835   *
51794a0d5ef26a kernel/printk/printk.c John Ogness             2021-11-22  2=
836   * If extended messages should be printed, @ext_text is a buffer of si=
ze
51794a0d5ef26a kernel/printk/printk.c John Ogness             2021-11-22  2=
837   * CONSOLE_EXT_LOG_MAX. Otherwise @ext_text must be NULL.
51794a0d5ef26a kernel/printk/printk.c John Ogness             2021-11-22  2=
838   *
51794a0d5ef26a kernel/printk/printk.c John Ogness             2021-11-22  2=
839   * If dropped messages should be printed, @dropped_text is a buffer of=
 size
51794a0d5ef26a kernel/printk/printk.c John Ogness             2021-11-22  2=
840   * DROPPED_TEXT_MAX. Otherise @dropped_text must be NULL.
51794a0d5ef26a kernel/printk/printk.c John Ogness             2021-11-22  2=
841   *
b7eb4b2778190e kernel/printk/printk.c John Ogness             2021-12-22  2=
842   * @atomic_printing specifies if atomic printing should be used.
b7eb4b2778190e kernel/printk/printk.c John Ogness             2021-12-22  2=
843   *
ca31ea1ffed3ab kernel/printk/printk.c John Ogness             2021-08-10  2=
844   * Requires the console_lock.
^1da177e4c3f41 kernel/printk.c        Linus Torvalds          2005-04-16  2=
845   *
ca31ea1ffed3ab kernel/printk/printk.c John Ogness             2021-08-10  2=
846   * Returns false if the given console has no next record to print, oth=
erwise
ca31ea1ffed3ab kernel/printk/printk.c John Ogness             2021-08-10  2=
847   * true.
^1da177e4c3f41 kernel/printk.c        Linus Torvalds          2005-04-16  2=
848   *
ca31ea1ffed3ab kernel/printk/printk.c John Ogness             2021-08-10  2=
849   * @handover will be set to true if a printk waiter has taken over the
ca31ea1ffed3ab kernel/printk/printk.c John Ogness             2021-08-10  2=
850   * console_lock, in which case the caller is no longer holding the
f0aa6fbf636e19 kernel/printk/printk.c John Ogness             2021-12-13  2=
851   * console_lock. Otherwise it is set to false. A NULL pointer may be p=
rovided
f0aa6fbf636e19 kernel/printk/printk.c John Ogness             2021-12-13  2=
852   * to disable allowing the console_lock to be taken over by a printk w=
aiter.
^1da177e4c3f41 kernel/printk.c        Linus Torvalds          2005-04-16  2=
853   */
51794a0d5ef26a kernel/printk/printk.c John Ogness             2021-11-22  2=
854  static bool console_emit_next_record(struct console *con, char *text, =
char *ext_text,
b7eb4b2778190e kernel/printk/printk.c John Ogness             2021-12-22  2=
855  				     char *dropped_text, bool atomic_printing,
b7eb4b2778190e kernel/printk/printk.c John Ogness             2021-12-22  2=
856  				     bool *handover)
^1da177e4c3f41 kernel/printk.c        Linus Torvalds          2005-04-16  2=
857  {
896fbe20b4e233 kernel/printk/printk.c John Ogness             2020-07-09  2=
858  	struct printk_info info;
896fbe20b4e233 kernel/printk/printk.c John Ogness             2020-07-09  2=
859  	struct printk_record r;
ca31ea1ffed3ab kernel/printk/printk.c John Ogness             2021-08-10  2=
860  	unsigned long flags;
f0aa6fbf636e19 kernel/printk/printk.c John Ogness             2021-12-13  2=
861  	bool allow_handover;
ca31ea1ffed3ab kernel/printk/printk.c John Ogness             2021-08-10  2=
862  	char *write_text;
ca31ea1ffed3ab kernel/printk/printk.c John Ogness             2021-08-10  2=
863  	size_t len;
b7eb4b2778190e kernel/printk/printk.c John Ogness             2021-12-22  2=
864  	u64 seq;
78944e549d3667 kernel/printk.c        Antonino A. Daplas      2006-08-05  2=
865  =

51794a0d5ef26a kernel/printk/printk.c John Ogness             2021-11-22  2=
866  	prb_rec_init_rd(&r, &info, text, CONSOLE_LOG_MAX);
896fbe20b4e233 kernel/printk/printk.c John Ogness             2020-07-09  2=
867  =

f0aa6fbf636e19 kernel/printk/printk.c John Ogness             2021-12-13  2=
868  	if (handover)
ca31ea1ffed3ab kernel/printk/printk.c John Ogness             2021-08-10  2=
869  		*handover =3D false;
7ff9554bb578ba kernel/printk.c        Kay Sievers             2012-05-03  2=
870  =

b7eb4b2778190e kernel/printk/printk.c John Ogness             2021-12-22 @2=
871  	seq =3D read_console_seq(con);
b7eb4b2778190e kernel/printk/printk.c John Ogness             2021-12-22  2=
872  =

b7eb4b2778190e kernel/printk/printk.c John Ogness             2021-12-22  2=
873  	if (!prb_read_valid(prb, seq, &r))
ca31ea1ffed3ab kernel/printk/printk.c John Ogness             2021-08-10  2=
874  		return false;
7ff9554bb578ba kernel/printk.c        Kay Sievers             2012-05-03  2=
875  =

b7eb4b2778190e kernel/printk/printk.c John Ogness             2021-12-22  2=
876  	if (seq !=3D r.info->seq) {
b7eb4b2778190e kernel/printk/printk.c John Ogness             2021-12-22  2=
877  		atomic_long_add((unsigned long)(r.info->seq - seq), &con->dropped);
b7eb4b2778190e kernel/printk/printk.c John Ogness             2021-12-22  2=
878  		write_console_seq(con, r.info->seq, atomic_printing);
b7eb4b2778190e kernel/printk/printk.c John Ogness             2021-12-22  2=
879  		seq =3D r.info->seq;
896fbe20b4e233 kernel/printk/printk.c John Ogness             2020-07-09  2=
880  	}
896fbe20b4e233 kernel/printk/printk.c John Ogness             2020-07-09  2=
881  =

ca31ea1ffed3ab kernel/printk/printk.c John Ogness             2021-08-10  2=
882  	/* Skip record that has level above the console loglevel. */
896fbe20b4e233 kernel/printk/printk.c John Ogness             2020-07-09  2=
883  	if (suppress_message_printing(r.info->level)) {
b7eb4b2778190e kernel/printk/printk.c John Ogness             2021-12-22  2=
884  		write_console_seq(con, seq + 1, atomic_printing);
084681d14e429c kernel/printk.c        Kay Sievers             2012-06-28  2=
885  		goto skip;
084681d14e429c kernel/printk.c        Kay Sievers             2012-06-28  2=
886  	}
649e6ee33f73ba kernel/printk.c        Kay Sievers             2012-05-10  2=
887  =

51794a0d5ef26a kernel/printk/printk.c John Ogness             2021-11-22  2=
888  	if (ext_text) {
51794a0d5ef26a kernel/printk/printk.c John Ogness             2021-11-22  2=
889  		write_text =3D ext_text;
51794a0d5ef26a kernel/printk/printk.c John Ogness             2021-11-22  2=
890  		len =3D info_print_ext_header(ext_text, CONSOLE_EXT_LOG_MAX, r.info);
51794a0d5ef26a kernel/printk/printk.c John Ogness             2021-11-22  2=
891  		len +=3D msg_print_ext_body(ext_text + len, CONSOLE_EXT_LOG_MAX - le=
n,
ca31ea1ffed3ab kernel/printk/printk.c John Ogness             2021-08-10  2=
892  					  &r.text_buf[0], r.info->text_len, &r.info->dev_info);
ca31ea1ffed3ab kernel/printk/printk.c John Ogness             2021-08-10  2=
893  	} else {
51794a0d5ef26a kernel/printk/printk.c John Ogness             2021-11-22  2=
894  		write_text =3D text;
ca31ea1ffed3ab kernel/printk/printk.c John Ogness             2021-08-10  2=
895  		len =3D record_print_text(&r, console_msg_format & MSG_FORMAT_SYSLOG=
, printk_time);
6fe29354befe4c kernel/printk/printk.c Tejun Heo               2015-06-25  2=
896  	}
7ff9554bb578ba kernel/printk.c        Kay Sievers             2012-05-03  2=
897  =

f0aa6fbf636e19 kernel/printk/printk.c John Ogness             2021-12-13  2=
898  	/* Handovers may only happen between trylock contexts. */
f0aa6fbf636e19 kernel/printk/printk.c John Ogness             2021-12-13  2=
899  	allow_handover =3D (handover && atomic_read(&console_lock_count) =3D=
=3D -1);
f0aa6fbf636e19 kernel/printk/printk.c John Ogness             2021-12-13  2=
900  =

f0aa6fbf636e19 kernel/printk/printk.c John Ogness             2021-12-13  2=
901  	if (allow_handover) {
dbdda842fe96f8 kernel/printk/printk.c Steven Rostedt (VMware  2018-01-10  2=
902) 		/*
dbdda842fe96f8 kernel/printk/printk.c Steven Rostedt (VMware  2018-01-10  2=
903) 		 * While actively printing out messages, if another printk()
dbdda842fe96f8 kernel/printk/printk.c Steven Rostedt (VMware  2018-01-10  2=
904) 		 * were to occur on another CPU, it may wait for this one to
dbdda842fe96f8 kernel/printk/printk.c Steven Rostedt (VMware  2018-01-10  2=
905) 		 * finish. This task can not be preempted if there is a
dbdda842fe96f8 kernel/printk/printk.c Steven Rostedt (VMware  2018-01-10  2=
906) 		 * waiter waiting to take over.
93d102f094be9b kernel/printk/printk.c John Ogness             2021-07-15  2=
907  		 *
93d102f094be9b kernel/printk/printk.c John Ogness             2021-07-15  2=
908  		 * Interrupts are disabled because the hand over to a waiter
93d102f094be9b kernel/printk/printk.c John Ogness             2021-07-15  2=
909  		 * must not be interrupted until the hand over is completed
93d102f094be9b kernel/printk/printk.c John Ogness             2021-07-15  2=
910  		 * (@console_waiter is cleared).
dbdda842fe96f8 kernel/printk/printk.c Steven Rostedt (VMware  2018-01-10  2=
911) 		 */
93d102f094be9b kernel/printk/printk.c John Ogness             2021-07-15  2=
912  		printk_safe_enter_irqsave(flags);
c162d5b4338d72 kernel/printk/printk.c Petr Mladek             2018-01-12  2=
913  		console_lock_spinning_enable();
f0aa6fbf636e19 kernel/printk/printk.c John Ogness             2021-12-13  2=
914  	}
dbdda842fe96f8 kernel/printk/printk.c Steven Rostedt (VMware  2018-01-10  2=
915) =

81d68a96a39844 kernel/printk.c        Steven Rostedt          2008-05-12  2=
916  	stop_critical_timings();	/* don't trace print latency */
b7eb4b2778190e kernel/printk/printk.c John Ogness             2021-12-22  2=
917  	call_console_driver(con, write_text, len, dropped_text, atomic_printi=
ng);
81d68a96a39844 kernel/printk.c        Steven Rostedt          2008-05-12  2=
918  	start_critical_timings();
dbdda842fe96f8 kernel/printk/printk.c Steven Rostedt (VMware  2018-01-10  2=
919) =

b7eb4b2778190e kernel/printk/printk.c John Ogness             2021-12-22  2=
920  	write_console_seq(con, seq + 1, atomic_printing);
ca31ea1ffed3ab kernel/printk/printk.c John Ogness             2021-08-10  2=
921  =

f0aa6fbf636e19 kernel/printk/printk.c John Ogness             2021-12-13  2=
922  	if (allow_handover) {
ca31ea1ffed3ab kernel/printk/printk.c John Ogness             2021-08-10  2=
923  		*handover =3D console_lock_spinning_disable_and_check();
c162d5b4338d72 kernel/printk/printk.c Petr Mladek             2018-01-12  2=
924  		printk_safe_exit_irqrestore(flags);
f0aa6fbf636e19 kernel/printk/printk.c John Ogness             2021-12-13  2=
925  	}
ca31ea1ffed3ab kernel/printk/printk.c John Ogness             2021-08-10  2=
926  =

ca31ea1ffed3ab kernel/printk/printk.c John Ogness             2021-08-10  2=
927  	printk_delay(r.info->level);
ca31ea1ffed3ab kernel/printk/printk.c John Ogness             2021-08-10  2=
928  skip:
ca31ea1ffed3ab kernel/printk/printk.c John Ogness             2021-08-10  2=
929  	return true;
ca31ea1ffed3ab kernel/printk/printk.c John Ogness             2021-08-10  2=
930  }
ca31ea1ffed3ab kernel/printk/printk.c John Ogness             2021-08-10  2=
931  =


---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all(a)lists.01.org
--===============6253700019472267197==--

