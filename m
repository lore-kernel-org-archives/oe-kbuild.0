Content-Type: multipart/mixed; boundary="===============3426623971698815779=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: fs/ntfs3/fsntfs.c:1264:32: warning: use of uninitialized value 'clen' [CWE-457]
Date: Wed, 10 Aug 2022 02:17:25 +0800
Message-ID: <202208100203.xMj3xfft-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============3426623971698815779==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

:::::: =

:::::: Manual check reason: "low confidence bisect report"
:::::: Manual check reason: "low confidence static check first_new_problem:=
 fs/ntfs3/fsntfs.c:1264:32: warning: use of uninitialized value 'clen' [CWE=
-457] [-Wanalyzer-use-of-uninitialized-value]"
:::::: =


BCC: lkp(a)intel.com
CC: kbuild-all(a)lists.01.org
CC: linux-kernel(a)vger.kernel.org
TO: Konstantin Komarov <almaz.alexandrovich@paragon-software.com>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git =
master
head:   eb555cb5b794f4e12a9897f3d46d5a72104cd4a7
commit: 6e5be40d32fb1907285277c02e74493ed43d77fe fs/ntfs3: Add NTFS3 in fs/=
Kconfig and fs/Makefile
date:   12 months ago
:::::: branch date: 15 hours ago
:::::: commit date: 12 months ago
config: arm-randconfig-c002-20220805 (https://download.01.org/0day-ci/archi=
ve/20220810/202208100203.xMj3xfft-lkp(a)intel.com/config)
compiler: arm-linux-gnueabi-gcc (GCC) 12.1.0
reproduce (this is a W=3D1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/=
make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.gi=
t/commit/?id=3D6e5be40d32fb1907285277c02e74493ed43d77fe
        git remote add linus https://git.kernel.org/pub/scm/linux/kernel/gi=
t/torvalds/linux.git
        git fetch --no-tags linus master
        git checkout 6e5be40d32fb1907285277c02e74493ed43d77fe
        # save the config file
        COMPILER_INSTALL_PATH=3D$HOME/0day COMPILER=3Dgcc-12.1.0 make.cross=
 ARCH=3Darm KBUILD_USERCFLAGS=3D'-fanalyzer -Wno-error' =


If you fix the issue, kindly add following tag where applicable
Reported-by: kernel test robot <lkp@intel.com>

gcc-analyzer warnings: (new ones prefixed by >>)
              |      |                             ~~~~~~~~~~~~
              |      |                                     |
              |      |                                     (7) ...to here
              |......
              | 1234 |                         bh =3D ntfs_bread(sb, block);
              |      |                              ~~~~~~~~~~~~~~~~~~~~~
              |      |                              |
              |      |                              (8) calling 'ntfs_bread=
' from 'ntfs_read_run_nb'
              |
              +--> 'ntfs_bread': events 9-10
                     |
                     |fs/ntfs3/ntfs_fs.h:962:35:
                     |  962 | static inline struct buffer_head *ntfs_bread(=
struct super_block *sb,
                     |      |                                   ^~~~~~~~~~
                     |      |                                   |
                     |      |                                   (9) entry t=
o 'ntfs_bread'
                     |......
                     |  967 |         if (bh)
                     |      |            ~                       =

                     |      |            |
                     |      |            (10) following 'true' branch...
                     |
                   'ntfs_bread': event 11
                     |
                     |cc1:
                     | (11): ...to here
                     |
              <------+
              |
            'ntfs_read_run_nb': events 12-17
              |
              |fs/ntfs3/fsntfs.c:1234:30:
              | 1234 |                         bh =3D ntfs_bread(sb, block);
              |      |                              ^~~~~~~~~~~~~~~~~~~~~
              |      |                              |
              |      |                              (12) returning to 'ntfs=
_read_run_nb' from 'ntfs_bread'
              | 1235 |                         if (!bh) {
              |      |                            ~  =

              |      |                            |
              |      |                            (13) following 'false' br=
anch (when 'bh' is non-NULL)...
              |......
              | 1240 |                         if (buf) {
              |      |                            ~  =

              |      |                            |
              |      |                            (14) ...to here
              |      |                            (15) following 'false' br=
anch (when 'buf' is NULL)...
              |......
              | 1245 |                         if (!nb) {
              |      |                            ~  =

              |      |                            |
              |      |                            (16) ...to here
              |      |                            (17) following 'true' bra=
nch (when 'nb' is NULL)...
              |
            'ntfs_read_run_nb': event 18
              |
              |include/linux/compiler.h:86:20:
              |   86 | # define barrier() __asm__ __volatile__("": : :"memo=
ry")
              |      |                    ^~~~~~~
              |      |                    |
              |      |                    (18) ...to here
   include/asm-generic/barrier.h:152:33: note: in expansion of macro 'barri=
er'
              |  152 | #define smp_mb__before_atomic() barrier()
              |      |                                 ^~~~~~~
   include/linux/buffer_head.h:284:9: note: in expansion of macro 'smp_mb__=
before_atomic'
              |  284 |         smp_mb__before_atomic();
              |      |         ^~~~~~~~~~~~~~~~~~~~~
              |
       <------+
       |
     'ntfs_read_bh': events 19-22
       |
       |fs/ntfs3/fsntfs.c:1298:19:
       | 1298 |         int err =3D ntfs_read_run_nb(sbi, run, vbo, rhdr, b=
ytes, nb);
       |      |                   ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~=
~~~~~~~
       |      |                   |
       |      |                   (19) returning to 'ntfs_read_bh' from 'nt=
fs_read_run_nb'
       | 1299 | =

       | 1300 |         if (err)
       |      |            ~       =

       |      |            |
       |      |            (20) following 'false' branch (when 'err =3D=3D =
0')...
       | 1301 |                 return err;
       | 1302 |         return ntfs_fix_post_read(rhdr, nb->bytes, true);
       |      |                ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
       |      |                |
       |      |                (21) ...to here
       |      |                (22) calling 'ntfs_fix_post_read' from 'ntfs=
_read_bh'
       |
       +--> 'ntfs_fix_post_read': event 23
              |
              |  146 | int ntfs_fix_post_read(struct NTFS_RECORD_HEADER *rh=
dr, size_t bytes,
              |      |     ^~~~~~~~~~~~~~~~~~
              |      |     |
              |      |     (23) entry to 'ntfs_fix_post_read'
              |
            'ntfs_fix_post_read': event 24
              |
              |  153 |         fo =3D le16_to_cpu(rhdr->fix_off);
              |
   fs/ntfs3/fsntfs.c: In function 'ntfs_read_run_nb':
>> fs/ntfs3/fsntfs.c:1264:32: warning: use of uninitialized value 'clen' [C=
WE-457] [-Wanalyzer-use-of-uninitialized-value]
    1264 |                 vcn_next =3D vcn + clen;
         |                            ~~~~^~~~~~
     'ntfs_read_run_nb': events 1-7
       |
       | 1180 | int ntfs_read_run_nb(struct ntfs_sb_info *sbi, const struct=
 runs_tree *run,
       |      |     ^~~~~~~~~~~~~~~~
       |      |     |
       |      |     (1) entry to 'ntfs_read_run_nb'
       |......
       | 1190 |         CLST lcn, clen;
       |      |                   ~~~~
       |      |                   |
       |      |                   (2) region created on stack here
       |......
       | 1195 |         if (!run) {
       |      |            ~
       |      |            |
       |      |            (3) following 'true' branch (when 'run' is NULL)=
...
       | 1196 |                 /* first reading of $Volume + $MFTMirr + Lo=
gFile goes here*/
       | 1197 |                 if (vbo > MFT_REC_VOL * sbi->record_size) {
       |      |                    ~                    ~~~~~~~~~~~~~~~~
       |      |                    |                       |
       |      |                    |                       (4) ...to here
       |      |                    (5) following 'false' branch...
       |......
       | 1203 |                 lbo =3D vbo + sbi->mft.lbo;
       |      |                             ~~~~~~~~~~~~
       |      |                                     |
       |      |                                     (6) ...to here
       |......
       | 1234 |                         bh =3D ntfs_bread(sb, block);
       |      |                              ~~~~~~~~~~~~~~~~~~~~~
       |      |                              |
       |      |                              (7) calling 'ntfs_bread' from =
'ntfs_read_run_nb'
       |
       +--> 'ntfs_bread': events 8-9
              |
              |fs/ntfs3/ntfs_fs.h:962:35:
              |  962 | static inline struct buffer_head *ntfs_bread(struct =
super_block *sb,
              |      |                                   ^~~~~~~~~~
              |      |                                   |
              |      |                                   (8) entry to 'ntfs=
_bread'
              |......
              |  967 |         if (bh)
              |      |            ~                       =

              |      |            |
              |      |            (9) following 'true' branch...
              |
            'ntfs_bread': event 10
              |
              |cc1:
              | (10): ...to here
              |
       <------+
       |
     'ntfs_read_run_nb': events 11-16
       |
       |fs/ntfs3/fsntfs.c:1234:30:
       | 1234 |                         bh =3D ntfs_bread(sb, block);
       |      |                              ^~~~~~~~~~~~~~~~~~~~~
       |      |                              |
       |      |                              (11) returning to 'ntfs_read_r=
un_nb' from 'ntfs_bread'
       | 1235 |                         if (!bh) {
       |      |                            ~  =

       |      |                            |
       |      |                            (12) following 'false' branch (w=
hen 'bh' is non-NULL)...
       |......
       | 1240 |                         if (buf) {
       |      |                            ~  =

       |      |                            |
       |      |                            (13) ...to here
       |      |                            (14) following 'false' branch (w=
hen 'buf' is NULL)...
       |......
       | 1245 |                         if (!nb) {
       |      |                            ~  =

       |      |                            |
       |      |                            (15) ...to here
       |      |                            (16) following 'true' branch (wh=
en 'nb' is NULL)...
       |
     'ntfs_read_run_nb': event 17
       |
       |include/linux/compiler.h:86:20:
       |   86 | # define barrier() __asm__ __volatile__("": : :"memory")
       |      |                    ^~~~~~~
       |      |                    |
       |      |                    (17) ...to here
   include/asm-generic/barrier.h:152:33: note: in expansion of macro 'barri=
er'
       |  152 | #define smp_mb__before_atomic() barrier()
       |      |                                 ^~~~~~~
   include/linux/buffer_head.h:284:9: note: in expansion of macro 'smp_mb__=
before_atomic'
       |  284 |         smp_mb__before_atomic();
       |      |         ^~~~~~~~~~~~~~~~~~~~~
       |
     'ntfs_read_run_nb': events 18-22
       |
       |fs/ntfs3/fsntfs.c:1256:28:
       | 1256 |                         if (!bytes)
       |      |                            ^
       |      |                            |
       |      |                            (18) following 'false' branch (w=
hen 'bytes !=3D 0')...
       | 1257 |                                 return 0;
       | 1258 |                         len32 -=3D op;
       |      |                         ~~~~~~~~~~~
       |      |                               |
       |      |                               (19) ...to here
       |......
       | 1262 |                 } while (len32);
       |      |                          ~~~~~
       |      |                          |
       |      |                          (20) following 'false' branch (whe=
n 'len32 =3D=3D 0')...
       | 1263 | =

       | 1264 |                 vcn_next =3D vcn + clen;
       |      |                            ~~~~~~~~~~
       |      |                                |
       |      |                                (21) ...to here
       |      |                                (22) use of uninitialized va=
lue 'clen' here
       |
>> fs/ntfs3/fsntfs.c:1264:32: warning: use of uninitialized value 'clen' [C=
WE-457] [-Wanalyzer-use-of-uninitialized-value]
    1264 |                 vcn_next =3D vcn + clen;
         |                            ~~~~^~~~~~
     'ntfs_read_bh': events 1-2
       |
       | 1294 | int ntfs_read_bh(struct ntfs_sb_info *sbi, const struct run=
s_tree *run, u64 vbo,
       |      |     ^~~~~~~~~~~~
       |      |     |
       |      |     (1) entry to 'ntfs_read_bh'
       |......
       | 1298 |         int err =3D ntfs_read_run_nb(sbi, run, vbo, rhdr, b=
ytes, nb);
       |      |                   ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~=
~~~~~~~
       |      |                   |
       |      |                   (2) calling 'ntfs_read_run_nb' from 'ntfs=
_read_bh'
       |
       +--> 'ntfs_read_run_nb': events 3-9
              |
              | 1180 | int ntfs_read_run_nb(struct ntfs_sb_info *sbi, const=
 struct runs_tree *run,
              |      |     ^~~~~~~~~~~~~~~~
              |      |     |
              |      |     (3) entry to 'ntfs_read_run_nb'
              |......
              | 1190 |         CLST lcn, clen;
              |      |                   ~~~~
              |      |                   |
              |      |                   (4) region created on stack here
              |......
              | 1195 |         if (!run) {
              |      |            ~
              |      |            |
              |      |            (5) following 'true' branch (when 'run' i=
s NULL)...
              | 1196 |                 /* first reading of $Volume + $MFTMi=
rr + LogFile goes here*/
              | 1197 |                 if (vbo > MFT_REC_VOL * sbi->record_=
size) {
              |      |                    ~                    ~~~~~~~~~~~~=
~~~~
              |      |                    |                       |
              |      |                    |                       (6) ...to=
 here
              |      |                    (7) following 'false' branch...
              |......
              | 1203 |                 lbo =3D vbo + sbi->mft.lbo;
              |      |                             ~~~~~~~~~~~~
              |      |                                     |
              |      |                                     (8) ...to here
              |......
              | 1234 |                         bh =3D ntfs_bread(sb, block);
              |      |                              ~~~~~~~~~~~~~~~~~~~~~
              |      |                              |
              |      |                              (9) calling 'ntfs_bread=
' from 'ntfs_read_run_nb'
              |
              +--> 'ntfs_bread': events 10-11
                     |
                     |fs/ntfs3/ntfs_fs.h:962:35:
                     |  962 | static inline struct buffer_head *ntfs_bread(=
struct super_block *sb,
                     |      |                                   ^~~~~~~~~~
                     |      |                                   |
                     |      |                                   (10) entry =
to 'ntfs_bread'
                     |......
                     |  967 |         if (bh)
                     |      |            ~                       =

                     |      |            |
                     |      |            (11) following 'true' branch...
                     |
                   'ntfs_bread': event 12
                     |
                     |cc1:
                     | (12): ...to here
                     |
              <------+
              |
            'ntfs_read_run_nb': events 13-18
              |
              |fs/ntfs3/fsntfs.c:1234:30:
              | 1234 |                         bh =3D ntfs_bread(sb, block);
              |      |                              ^~~~~~~~~~~~~~~~~~~~~
              |      |                              |
              |      |                              (13) returning to 'ntfs=
_read_run_nb' from 'ntfs_bread'
              | 1235 |                         if (!bh) {
              |      |                            ~  =

              |      |                            |
              |      |                            (14) following 'false' br=
anch (when 'bh' is non-NULL)...
              |......
              | 1240 |                         if (buf) {
              |      |                            ~  =

              |      |                            |
              |      |                            (15) ...to here
              |      |                            (16) following 'false' br=
anch (when 'buf' is NULL)...
              |......
              | 1245 |                         if (!nb) {
              |      |                            ~  =

              |      |                            |
              |      |                            (17) ...to here
              |      |                            (18) following 'true' bra=
nch (when 'nb' is NULL)...
              |
            'ntfs_read_run_nb': event 19
              |
              |include/linux/compiler.h:86:20:
              |   86 | # define barrier() __asm__ __volatile__("": : :"memo=
ry")
              |      |                    ^~~~~~~
              |      |                    |
              |      |                    (19) ...to here
   include/asm-generic/barrier.h:152:33: note: in expansion of macro 'barri=
er'
              |  152 | #define smp_mb__before_atomic() barrier()
              |      |                                 ^~~~~~~
   include/linux/buffer_head.h:284:9: note: in expansion of macro 'smp_mb__=
before_atomic'
              |  284 |         smp_mb__before_atomic();
              |      |         ^~~~~~~~~~~~~~~~~~~~~
              |
            'ntfs_read_run_nb': events 20-24
              |
              |fs/ntfs3/fsntfs.c:1256:28:
              | 1256 |                         if (!bytes)
              |      |                            ^
              |      |                            |
              |      |                            (20) following 'false' br=
anch (when 'bytes !=3D 0')...
              | 1257 |                                 return 0;
              | 1258 |                         len32 -=3D op;
              |      |                         ~~~~~~~~~~~
              |      |                               |
              |      |                               (21) ...to here
              |......
              | 1262 |                 } while (len32);
              |      |                          ~~~~~
              |      |                          |
              |      |                          (22) following 'false' bran=
ch (when 'len32 =3D=3D 0')...
              | 1263 | =

              | 1264 |                 vcn_next =3D vcn + clen;
              |      |                            ~~~~~~~~~~
              |      |                                |
              |      |                                (23) ...to here
              |      |                                (24) use of uninitial=
ized value 'clen' here
              |
>> fs/ntfs3/fsntfs.c:1265:22: warning: use of uninitialized value 'idx' [CW=
E-457] [-Wanalyzer-use-of-uninitialized-value]
    1265 |                 if (!run_get_entry(run, ++idx, &vcn, &lcn, &clen=
) ||
         |                      ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
     'ntfs_read_run_nb': events 1-7
       |
       | 1180 | int ntfs_read_run_nb(struct ntfs_sb_info *sbi, const struct=
 runs_tree *run,
       |      |     ^~~~~~~~~~~~~~~~
       |      |     |
       |      |     (1) entry to 'ntfs_read_run_nb'
       |......
       | 1192 |         size_t idx;
       |      |                ~~~
       |      |                |
       |      |                (2) region created on stack here
       |......
       | 1195 |         if (!run) {
       |      |            ~
       |      |            |
       |      |            (3) following 'true' branch (when 'run' is NULL)=
...
       | 1196 |                 /* first reading of $Volume + $MFTMirr + Lo=
gFile goes here*/
       | 1197 |                 if (vbo > MFT_REC_VOL * sbi->record_size) {
       |      |                    ~                    ~~~~~~~~~~~~~~~~
       |      |                    |                       |
       |      |                    |                       (4) ...to here
       |      |                    (5) following 'false' branch...
       |......
       | 1203 |                 lbo =3D vbo + sbi->mft.lbo;
       |      |                             ~~~~~~~~~~~~
       |      |                                     |
       |      |                                     (6) ...to here
       |......
       | 1234 |                         bh =3D ntfs_bread(sb, block);
       |      |                              ~~~~~~~~~~~~~~~~~~~~~
       |      |                              |
       |      |                              (7) calling 'ntfs_bread' from =
'ntfs_read_run_nb'
       |
       +--> 'ntfs_bread': events 8-9
              |
              |fs/ntfs3/ntfs_fs.h:962:35:
              |  962 | static inline struct buffer_head *ntfs_bread(struct =
super_block *sb,
              |      |                                   ^~~~~~~~~~
              |      |                                   |
              |      |                                   (8) entry to 'ntfs=
_bread'
              |......
              |  967 |         if (bh)
              |      |            ~                       =

              |      |            |
              |      |            (9) following 'true' branch...
              |
            'ntfs_bread': event 10
              |
              |cc1:
              | (10): ...to here
              |
       <------+
       |
     'ntfs_read_run_nb': events 11-16
       |
       |fs/ntfs3/fsntfs.c:1234:30:
       | 1234 |                         bh =3D ntfs_bread(sb, block);
       |      |                              ^~~~~~~~~~~~~~~~~~~~~
       |      |                              |
       |      |                              (11) returning to 'ntfs_read_r=
un_nb' from 'ntfs_bread'
       | 1235 |                         if (!bh) {
       |      |                            ~  =

       |      |                            |
       |      |                            (12) following 'false' branch (w=
hen 'bh' is non-NULL)...
       |......
       | 1240 |                         if (buf) {
       |      |                            ~  =

       |      |                            |
       |      |                            (13) ...to here
       |      |                            (14) following 'false' branch (w=
hen 'buf' is NULL)...
       |......
       | 1245 |                         if (!nb) {
       |      |                            ~  =

       |      |                            |
       |      |                            (15) ...to here
       |      |                            (16) following 'true' branch (wh=
en 'nb' is NULL)...
       |
     'ntfs_read_run_nb': event 17
       |
       |include/linux/compiler.h:86:20:
       |   86 | # define barrier() __asm__ __volatile__("": : :"memory")
       |      |                    ^~~~~~~
       |      |                    |
       |      |                    (17) ...to here
   include/asm-generic/barrier.h:152:33: note: in expansion of macro 'barri=
er'
       |  152 | #define smp_mb__before_atomic() barrier()
       |      |                                 ^~~~~~~
   include/linux/buffer_head.h:284:9: note: in expansion of macro 'smp_mb__=
before_atomic'
       |  284 |         smp_mb__before_atomic();
       |      |         ^~~~~~~~~~~~~~~~~~~~~
       |
     'ntfs_read_run_nb': events 18-22
       |
       |fs/ntfs3/fsntfs.c:1256:28:
       | 1256 |                         if (!bytes)
       |      |                            ^
       |      |                            |
       |      |                            (18) following 'false' branch (w=
hen 'bytes !=3D 0')...
       | 1257 |                                 return 0;
       | 1258 |                         len32 -=3D op;
       |      |                         ~~~~~~~~~~~
       |      |                               |
       |      |                               (19) ...to here
       |......
       | 1262 |                 } while (len32);
       |      |                          ~~~~~
       |      |                          |
       |      |                          (20) following 'false' branch (whe=
n 'len32 =3D=3D 0')...
       | 1263 | =

       | 1264 |                 vcn_next =3D vcn + clen;
       |      |                            ~~~~~~~~~~
       |      |                                |
       |      |                                (21) ...to here
       | 1265 |                 if (!run_get_entry(run, ++idx, &vcn, &lcn, =
&clen) ||
       |      |                      ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~=
~~~~~~
       |      |                      |
       |      |                      (22) use of uninitialized value 'idx' =
here
       |
>> fs/ntfs3/fsntfs.c:1265:22: warning: use of uninitialized value 'idx' [CW=
E-457] [-Wanalyzer-use-of-uninitialized-value]
    1265 |                 if (!run_get_entry(run, ++idx, &vcn, &lcn, &clen=
) ||
         |                      ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
     'ntfs_read_bh': events 1-2
       |
       | 1294 | int ntfs_read_bh(struct ntfs_sb_info *sbi, const struct run=
s_tree *run, u64 vbo,
       |      |     ^~~~~~~~~~~~
       |      |     |
       |      |     (1) entry to 'ntfs_read_bh'
       |......
       | 1298 |         int err =3D ntfs_read_run_nb(sbi, run, vbo, rhdr, b=
ytes, nb);
       |      |                   ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~=
~~~~~~~
       |      |                   |
       |      |                   (2) calling 'ntfs_read_run_nb' from 'ntfs=
_read_bh'
       |
       +--> 'ntfs_read_run_nb': events 3-9
              |
              | 1180 | int ntfs_read_run_nb(struct ntfs_sb_info *sbi, const=
 struct runs_tree *run,
              |      |     ^~~~~~~~~~~~~~~~
              |      |     |
              |      |     (3) entry to 'ntfs_read_run_nb'
              |......
              | 1192 |         size_t idx;
              |      |                ~~~
              |      |                |
              |      |                (4) region created on stack here
              |......
              | 1195 |         if (!run) {
              |      |            ~
              |      |            |
              |      |            (5) following 'true' branch (when 'run' i=
s NULL)...
              | 1196 |                 /* first reading of $Volume + $MFTMi=
rr + LogFile goes here*/
              | 1197 |                 if (vbo > MFT_REC_VOL * sbi->record_=
size) {
              |      |                    ~                    ~~~~~~~~~~~~=
~~~~
              |      |                    |                       |
              |      |                    |                       (6) ...to=
 here
              |      |                    (7) following 'false' branch...
              |......
              | 1203 |                 lbo =3D vbo + sbi->mft.lbo;
              |      |                             ~~~~~~~~~~~~
              |      |                                     |
              |      |                                     (8) ...to here
              |......
              | 1234 |                         bh =3D ntfs_bread(sb, block);
              |      |                              ~~~~~~~~~~~~~~~~~~~~~
              |      |                              |
              |      |                              (9) calling 'ntfs_bread=
' from 'ntfs_read_run_nb'
              |
              +--> 'ntfs_bread': events 10-11
                     |
                     |fs/ntfs3/ntfs_fs.h:962:35:
                     |  962 | static inline struct buffer_head *ntfs_bread(=
struct super_block *sb,
                     |      |                                   ^~~~~~~~~~
                     |      |                                   |
                     |      |                                   (10) entry =
to 'ntfs_bread'
                     |......
                     |  967 |         if (bh)
                     |      |            ~                       =

                     |      |            |
                     |      |            (11) following 'true' branch...
                     |
                   'ntfs_bread': event 12
                     |
                     |cc1:
                     | (12): ...to here
                     |
              <------+
              |
            'ntfs_read_run_nb': events 13-18
              |
              |fs/ntfs3/fsntfs.c:1234:30:
              | 1234 |                         bh =3D ntfs_bread(sb, block);
              |      |                              ^~~~~~~~~~~~~~~~~~~~~
              |      |                              |
              |      |                              (13) returning to 'ntfs=
_read_run_nb' from 'ntfs_bread'
              | 1235 |                         if (!bh) {
              |      |                            ~  =

              |      |                            |
              |      |                            (14) following 'false' br=
anch (when 'bh' is non-NULL)...
              |......
              | 1240 |                         if (buf) {
              |      |                            ~  =

              |      |                            |
              |      |                            (15) ...to here
              |      |                            (16) following 'false' br=
anch (when 'buf' is NULL)...
              |......
              | 1245 |                         if (!nb) {
              |      |                            ~  =

              |      |                            |
              |      |                            (17) ...to here
              |      |                            (18) following 'true' bra=
nch (when 'nb' is NULL)...
              |
            'ntfs_read_run_nb': event 19
              |
              |include/linux/compiler.h:86:20:
              |   86 | # define barrier() __asm__ __volatile__("": : :"memo=
ry")
              |      |                    ^~~~~~~
              |      |                    |
              |      |                    (19) ...to here
   include/asm-generic/barrier.h:152:33: note: in expansion of macro 'barri=
er'
              |  152 | #define smp_mb__before_atomic() barrier()
--
       |   11 | #define Add2Ptr(P, I)           ((void *)((u8 *)(P) + (I)))
       |      |                                 ~^~~~~~~~~~~~~~~~~~~~~~~~~~
       |      |                                  |
       |      |                                  (28) ...to here
   fs/ntfs3/ntfs.h:665:16: note: in expansion of macro 'Add2Ptr'
       |  665 |         return Add2Ptr(e, le16_to_cpu(e->size));
       |      |                ^~~~~~~
       |
     'indx_delete_entry': event 29
       |
       |fs/ntfs3/index.c:2289:23:
       | 2289 |                 err =3D indx_get_entry_to_replace(indx, ni,=
 next, &re, fnd2);
       |      |                       ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~=
~~~~~~~~~~~~~~~
       |      |                       |
       |      |                       (29) calling 'indx_get_entry_to_repla=
ce' from 'indx_delete_entry'
       |
       +--> 'indx_get_entry_to_replace': event 30
              |
              | 2104 | static int indx_get_entry_to_replace(struct ntfs_ind=
ex *indx,
              |      |            ^~~~~~~~~~~~~~~~~~~~~~~~~
              |      |            |
              |      |            (30) entry to 'indx_get_entry_to_replace'
              |
            'indx_get_entry_to_replace': events 31-32
              |
              | 2117 |         *de_to_replace =3D NULL;
              |......
              | 2123 |                 err =3D indx_read(indx, ni, vbn, &n);
              |      |                       ~~~~~~~~~~~~~~~~~~~~~~~~~~~~
              |      |                       |
              |      |                       (32) calling 'indx_read' from =
'indx_get_entry_to_replace'
              |
              +--> 'indx_read': events 33-34
                     |
                     | 1016 | int indx_read(struct ntfs_index *indx, struct=
 ntfs_inode *ni, CLST vbn,
                     |      |     ^~~~~~~~~
                     |      |     |
                     |      |     (33) entry to 'indx_read'
                     |......
                     | 1028 |         if (!in) {
                     |      |            ~
                     |      |            |
                     |      |            (34) following 'true' branch (when=
 'in' is NULL)...
                     |
                   'indx_read': event 35
                     |
                     |fs/ntfs3/debug.h:59:33:
                     |   59 | #define ntfs_zalloc(s)          kzalloc(s, GF=
P_NOFS)
                     |      |                                 ^~~~~~~~~~~~~=
~~~~~~~
                     |      |                                 |
                     |      |                                 (35) ...to he=
re
   fs/ntfs3/index.c:1029:22: note: in expansion of macro 'ntfs_zalloc'
                     | 1029 |                 in =3D ntfs_zalloc(sizeof(str=
uct indx_node));
                     |      |                      ^~~~~~~~~~~
                     |
                   'indx_read': events 36-37
                     |
                     | 1030 |                 if (!in)
                     |      |                    ^
                     |      |                    |
                     |      |                    (36) following 'false' bra=
nch (when 'in' is non-NULL)...
                     |......
                     | 1036 |         ib =3D in->index;
                     |      |         ~~~~~~~~~~~~~~
                     |      |            |
                     |      |            (37) ...to here
                     |
              <------+
              |
            'indx_get_entry_to_replace': events 38-41
              |
              |  627 |         if (i < 0 || i >=3D ARRAY_SIZE(fnd->nodes))
              |      |            ~           =

              |      |            |
              |      |            (41) following 'true' branch...
              |......
              | 2123 |                 err =3D indx_read(indx, ni, vbn, &n);
              |      |                       ^~~~~~~~~~~~~~~~~~~~~~~~~~~~
              |      |                       |
              |      |                       (38) returning to 'indx_get_en=
try_to_replace' from 'indx_read'
              | 2124 |                 if (err)
              |      |                    ~   =

              |      |                    |
              |      |                    (39) following 'false' branch (wh=
en 'err =3D=3D 0')...
              |......
              | 2127 |                 e =3D hdr_first_de(&n->index->ihdr);
              |      |                                    ~~
              |      |                                    |
              |      |                                    (40) ...to here
              |
            'indx_get_entry_to_replace': events 42-43
              |
              |fs/ntfs3/ntfs.h:677:17:
              |  677 |         return e->flags & NTFS_IE_LAST;
              |      |                ~^~~~~~~
              |      |                 |
              |      |                 (42) ...to here
              |      |                 (43) dereference of NULL 'e'
              |
   fs/ntfs3/index.c: In function 'indx_read':
>> fs/ntfs3/index.c:1025:27: warning: use of uninitialized value '*node' [C=
WE-457] [-Wanalyzer-use-of-uninitialized-value]
    1025 |         struct indx_node *in =3D *node;
         |                           ^~
     'indx_delete_entry': events 1-2
       |
       | 2199 | int indx_delete_entry(struct ntfs_index *indx, struct ntfs_=
inode *ni,
       |      |     ^~~~~~~~~~~~~~~~~
       |      |     |
       |      |     (1) entry to 'indx_delete_entry'
       |......
       | 2218 |         if (!fnd) {
       |      |            ~
       |      |            |
       |      |            (2) following 'false' branch...
       |
     'indx_delete_entry': event 3
       |
       |fs/ntfs3/debug.h:59:33:
       |   59 | #define ntfs_zalloc(s)          kzalloc(s, GFP_NOFS)
       |      |                                 ^~~~~~~~~~~~~~~~~~~~
       |      |                                 |
       |      |                                 (3) ...to here
   fs/ntfs3/ntfs_fs.h:603:16: note: in expansion of macro 'ntfs_zalloc'
       |  603 |         return ntfs_zalloc(sizeof(struct ntfs_fnd));
       |      |                ^~~~~~~~~~~
       |
     'indx_delete_entry': events 4-6
       |
       |fs/ntfs3/index.c:2224:12:
       | 2224 |         if (!fnd2) {
       |      |            ^
       |      |            |
       |      |            (4) following 'false' branch...
       |......
       | 2229 |         root =3D indx_get_root(indx, ni, &attr, &mi);
       |      |                ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
       |      |                |
       |      |                (5) ...to here
       |      |                (6) calling 'indx_get_root' from 'indx_delet=
e_entry'
       |
       +--> 'indx_get_root': events 7-11
              |
              |  985 | struct INDEX_ROOT *indx_get_root(struct ntfs_index *=
indx, struct ntfs_inode *ni,
              |      |                    ^~~~~~~~~~~~~
              |      |                    |
              |      |                    (7) entry to 'indx_get_root'
              |......
              |  994 |         if (!a)
              |      |            ~        =

              |      |            |
              |      |            (8) following 'false' branch (when 'a' is=
 non-NULL)...
              |......
              |  997 |         if (attr)
              |      |            ~        =

              |      |            |
              |      |            (9) ...to here
              |      |            (10) following 'true' branch (when 'attr'=
 is non-NULL)...
              |  998 |                 *attr =3D a;
              |      |                 ~~~~~~~~~
              |      |                       |
              |      |                       (11) ...to here
              |
            'indx_get_root': event 12
              |
              |fs/ntfs3/ntfs.h:450:12:
              |  450 |         if (attr->non_res)
              |      |            ^
              |      |            |
              |      |            (12) following 'false' branch...
              |
            'indx_get_root': events 13-14
              |
              |  453 |         asize =3D le32_to_cpu(attr->size);
              |......
              |  456 |         if (asize < datasize + off)
              |      |            ~   =

              |      |            |
              |      |            (14) following 'false' branch...
              |
            'indx_get_root': events 15-16
              |
              |  459 |         rsize =3D le32_to_cpu(attr->res.data_size);
              |  460 |         if (rsize < datasize)
              |      |            ~   =

              |      |            |
              |      |            (16) following 'false' branch (when 'rsiz=
e > 31')...
              |
            'indx_get_root': event 17
              |
              |fs/ntfs3/debug.h:11:34:
              |   11 | #define Add2Ptr(P, I)           ((void *)((u8 *)(P) =
+ (I)))
              |      |                                 ~^~~~~~~~~~~~~~~~~~~=
~~~~~~~
              |      |                                  |
              |      |                                  (17) ...to here
   fs/ntfs3/ntfs.h:463:16: note: in expansion of macro 'Add2Ptr'
              |  463 |         return Add2Ptr(attr, off);
              |      |                ^~~~~~~
              |
       <------+
       |
     'indx_delete_entry': events 18-27

vim +/clen +1264 fs/ntfs3/fsntfs.c

82cae269cfa953 Konstantin Komarov 2021-08-13  1179  =

82cae269cfa953 Konstantin Komarov 2021-08-13  1180  int ntfs_read_run_nb(st=
ruct ntfs_sb_info *sbi, const struct runs_tree *run,
82cae269cfa953 Konstantin Komarov 2021-08-13  1181  		     u64 vbo, void *b=
uf, u32 bytes, struct ntfs_buffers *nb)
82cae269cfa953 Konstantin Komarov 2021-08-13  1182  {
82cae269cfa953 Konstantin Komarov 2021-08-13  1183  	int err;
82cae269cfa953 Konstantin Komarov 2021-08-13  1184  	struct super_block *sb=
 =3D sbi->sb;
82cae269cfa953 Konstantin Komarov 2021-08-13  1185  	u32 blocksize =3D sb->=
s_blocksize;
82cae269cfa953 Konstantin Komarov 2021-08-13  1186  	u8 cluster_bits =3D sb=
i->cluster_bits;
82cae269cfa953 Konstantin Komarov 2021-08-13  1187  	u32 off =3D vbo & sbi-=
>cluster_mask;
82cae269cfa953 Konstantin Komarov 2021-08-13  1188  	u32 nbh =3D 0;
82cae269cfa953 Konstantin Komarov 2021-08-13  1189  	CLST vcn_next, vcn =3D=
 vbo >> cluster_bits;
82cae269cfa953 Konstantin Komarov 2021-08-13  1190  	CLST lcn, clen;
82cae269cfa953 Konstantin Komarov 2021-08-13  1191  	u64 lbo, len;
82cae269cfa953 Konstantin Komarov 2021-08-13  1192  	size_t idx;
82cae269cfa953 Konstantin Komarov 2021-08-13  1193  	struct buffer_head *bh;
82cae269cfa953 Konstantin Komarov 2021-08-13  1194  =

82cae269cfa953 Konstantin Komarov 2021-08-13  1195  	if (!run) {
82cae269cfa953 Konstantin Komarov 2021-08-13  1196  		/* first reading of $=
Volume + $MFTMirr + LogFile goes here*/
82cae269cfa953 Konstantin Komarov 2021-08-13  1197  		if (vbo > MFT_REC_VOL=
 * sbi->record_size) {
82cae269cfa953 Konstantin Komarov 2021-08-13  1198  			err =3D -ENOENT;
82cae269cfa953 Konstantin Komarov 2021-08-13  1199  			goto out;
82cae269cfa953 Konstantin Komarov 2021-08-13  1200  		}
82cae269cfa953 Konstantin Komarov 2021-08-13  1201  =

82cae269cfa953 Konstantin Komarov 2021-08-13  1202  		/* use absolute boot'=
s 'MFTCluster' to read record */
82cae269cfa953 Konstantin Komarov 2021-08-13  1203  		lbo =3D vbo + sbi->mf=
t.lbo;
82cae269cfa953 Konstantin Komarov 2021-08-13  1204  		len =3D sbi->record_s=
ize;
82cae269cfa953 Konstantin Komarov 2021-08-13  1205  	} else if (!run_lookup=
_entry(run, vcn, &lcn, &clen, &idx)) {
82cae269cfa953 Konstantin Komarov 2021-08-13  1206  		err =3D -ENOENT;
82cae269cfa953 Konstantin Komarov 2021-08-13  1207  		goto out;
82cae269cfa953 Konstantin Komarov 2021-08-13  1208  	} else {
82cae269cfa953 Konstantin Komarov 2021-08-13  1209  		if (lcn =3D=3D SPARSE=
_LCN) {
82cae269cfa953 Konstantin Komarov 2021-08-13  1210  			err =3D -EINVAL;
82cae269cfa953 Konstantin Komarov 2021-08-13  1211  			goto out;
82cae269cfa953 Konstantin Komarov 2021-08-13  1212  		}
82cae269cfa953 Konstantin Komarov 2021-08-13  1213  =

82cae269cfa953 Konstantin Komarov 2021-08-13  1214  		lbo =3D ((u64)lcn << =
cluster_bits) + off;
82cae269cfa953 Konstantin Komarov 2021-08-13  1215  		len =3D ((u64)clen <<=
 cluster_bits) - off;
82cae269cfa953 Konstantin Komarov 2021-08-13  1216  	}
82cae269cfa953 Konstantin Komarov 2021-08-13  1217  =

82cae269cfa953 Konstantin Komarov 2021-08-13  1218  	off =3D lbo & (blocksi=
ze - 1);
82cae269cfa953 Konstantin Komarov 2021-08-13  1219  	if (nb) {
82cae269cfa953 Konstantin Komarov 2021-08-13  1220  		nb->off =3D off;
82cae269cfa953 Konstantin Komarov 2021-08-13  1221  		nb->bytes =3D bytes;
82cae269cfa953 Konstantin Komarov 2021-08-13  1222  	}
82cae269cfa953 Konstantin Komarov 2021-08-13  1223  =

82cae269cfa953 Konstantin Komarov 2021-08-13  1224  	for (;;) {
82cae269cfa953 Konstantin Komarov 2021-08-13  1225  		u32 len32 =3D len >=
=3D bytes ? bytes : len;
82cae269cfa953 Konstantin Komarov 2021-08-13  1226  		sector_t block =3D lb=
o >> sb->s_blocksize_bits;
82cae269cfa953 Konstantin Komarov 2021-08-13  1227  =

82cae269cfa953 Konstantin Komarov 2021-08-13  1228  		do {
82cae269cfa953 Konstantin Komarov 2021-08-13  1229  			u32 op =3D blocksize=
 - off;
82cae269cfa953 Konstantin Komarov 2021-08-13  1230  =

82cae269cfa953 Konstantin Komarov 2021-08-13  1231  			if (op > len32)
82cae269cfa953 Konstantin Komarov 2021-08-13  1232  				op =3D len32;
82cae269cfa953 Konstantin Komarov 2021-08-13  1233  =

82cae269cfa953 Konstantin Komarov 2021-08-13  1234  			bh =3D ntfs_bread(sb=
, block);
82cae269cfa953 Konstantin Komarov 2021-08-13  1235  			if (!bh) {
82cae269cfa953 Konstantin Komarov 2021-08-13  1236  				err =3D -EIO;
82cae269cfa953 Konstantin Komarov 2021-08-13  1237  				goto out;
82cae269cfa953 Konstantin Komarov 2021-08-13  1238  			}
82cae269cfa953 Konstantin Komarov 2021-08-13  1239  =

82cae269cfa953 Konstantin Komarov 2021-08-13  1240  			if (buf) {
82cae269cfa953 Konstantin Komarov 2021-08-13  1241  				memcpy(buf, bh->b_d=
ata + off, op);
82cae269cfa953 Konstantin Komarov 2021-08-13  1242  				buf =3D Add2Ptr(buf=
, op);
82cae269cfa953 Konstantin Komarov 2021-08-13  1243  			}
82cae269cfa953 Konstantin Komarov 2021-08-13  1244  =

82cae269cfa953 Konstantin Komarov 2021-08-13  1245  			if (!nb) {
82cae269cfa953 Konstantin Komarov 2021-08-13  1246  				put_bh(bh);
82cae269cfa953 Konstantin Komarov 2021-08-13  1247  			} else if (nbh >=3D =
ARRAY_SIZE(nb->bh)) {
82cae269cfa953 Konstantin Komarov 2021-08-13  1248  				err =3D -EINVAL;
82cae269cfa953 Konstantin Komarov 2021-08-13  1249  				goto out;
82cae269cfa953 Konstantin Komarov 2021-08-13  1250  			} else {
82cae269cfa953 Konstantin Komarov 2021-08-13  1251  				nb->bh[nbh++] =3D b=
h;
82cae269cfa953 Konstantin Komarov 2021-08-13  1252  				nb->nbufs =3D nbh;
82cae269cfa953 Konstantin Komarov 2021-08-13  1253  			}
82cae269cfa953 Konstantin Komarov 2021-08-13  1254  =

82cae269cfa953 Konstantin Komarov 2021-08-13  1255  			bytes -=3D op;
82cae269cfa953 Konstantin Komarov 2021-08-13  1256  			if (!bytes)
82cae269cfa953 Konstantin Komarov 2021-08-13  1257  				return 0;
82cae269cfa953 Konstantin Komarov 2021-08-13  1258  			len32 -=3D op;
82cae269cfa953 Konstantin Komarov 2021-08-13  1259  			block +=3D 1;
82cae269cfa953 Konstantin Komarov 2021-08-13  1260  			off =3D 0;
82cae269cfa953 Konstantin Komarov 2021-08-13  1261  =

82cae269cfa953 Konstantin Komarov 2021-08-13  1262  		} while (len32);
82cae269cfa953 Konstantin Komarov 2021-08-13  1263  =

82cae269cfa953 Konstantin Komarov 2021-08-13 @1264  		vcn_next =3D vcn + cl=
en;
82cae269cfa953 Konstantin Komarov 2021-08-13 @1265  		if (!run_get_entry(ru=
n, ++idx, &vcn, &lcn, &clen) ||
82cae269cfa953 Konstantin Komarov 2021-08-13  1266  		    vcn !=3D vcn_next=
) {
82cae269cfa953 Konstantin Komarov 2021-08-13  1267  			err =3D -ENOENT;
82cae269cfa953 Konstantin Komarov 2021-08-13  1268  			goto out;
82cae269cfa953 Konstantin Komarov 2021-08-13  1269  		}
82cae269cfa953 Konstantin Komarov 2021-08-13  1270  =

82cae269cfa953 Konstantin Komarov 2021-08-13  1271  		if (lcn =3D=3D SPARSE=
_LCN) {
82cae269cfa953 Konstantin Komarov 2021-08-13  1272  			err =3D -EINVAL;
82cae269cfa953 Konstantin Komarov 2021-08-13  1273  			goto out;
82cae269cfa953 Konstantin Komarov 2021-08-13  1274  		}
82cae269cfa953 Konstantin Komarov 2021-08-13  1275  =

82cae269cfa953 Konstantin Komarov 2021-08-13  1276  		lbo =3D ((u64)lcn << =
cluster_bits);
82cae269cfa953 Konstantin Komarov 2021-08-13  1277  		len =3D ((u64)clen <<=
 cluster_bits);
82cae269cfa953 Konstantin Komarov 2021-08-13  1278  	}
82cae269cfa953 Konstantin Komarov 2021-08-13  1279  =

82cae269cfa953 Konstantin Komarov 2021-08-13  1280  out:
82cae269cfa953 Konstantin Komarov 2021-08-13  1281  	if (!nbh)
82cae269cfa953 Konstantin Komarov 2021-08-13  1282  		return err;
82cae269cfa953 Konstantin Komarov 2021-08-13  1283  =

82cae269cfa953 Konstantin Komarov 2021-08-13  1284  	while (nbh) {
82cae269cfa953 Konstantin Komarov 2021-08-13  1285  		put_bh(nb->bh[--nbh]);
82cae269cfa953 Konstantin Komarov 2021-08-13  1286  		nb->bh[nbh] =3D NULL;
82cae269cfa953 Konstantin Komarov 2021-08-13  1287  	}
82cae269cfa953 Konstantin Komarov 2021-08-13  1288  =

82cae269cfa953 Konstantin Komarov 2021-08-13  1289  	nb->nbufs =3D 0;
82cae269cfa953 Konstantin Komarov 2021-08-13  1290  	return err;
82cae269cfa953 Konstantin Komarov 2021-08-13  1291  }
82cae269cfa953 Konstantin Komarov 2021-08-13  1292  =


:::::: The code at line 1264 was first introduced by commit
:::::: 82cae269cfa953032fbb8980a7d554d60fb00b17 fs/ntfs3: Add initializatio=
n of super block

:::::: TO: Konstantin Komarov <almaz.alexandrovich@paragon-software.com>
:::::: CC: Konstantin Komarov <almaz.alexandrovich@paragon-software.com>

-- =

0-DAY CI Kernel Test Service
https://01.org/lkp
--===============3426623971698815779==--

