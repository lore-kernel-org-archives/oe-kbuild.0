Content-Type: multipart/mixed; boundary="===============4971344279593020732=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: net/netfilter/ipset/ip_set_hash_gen.h:894:26: warning: dereference of NULL '*h_201->table.bucket[<unknown>]' [CWE-476]
Date: Sun, 19 Jun 2022 22:35:05 +0800
Message-ID: <202206192222.VuAJpf8x-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============4971344279593020732==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

:::::: =

:::::: Manual check reason: "low confidence bisect report"
:::::: Manual check reason: "low confidence static check first_new_problem:=
 net/netfilter/ipset/ip_set_hash_gen.h:894:26: warning: dereference of NULL=
 '*h_201->table.bucket[<unknown>]' [CWE-476] [-Wanalyzer-null-dereference]"
:::::: =


CC: kbuild-all(a)lists.01.org
BCC: lkp(a)intel.com
CC: linux-kernel(a)vger.kernel.org
TO: Kees Cook <keescook@chromium.org>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git =
master
head:   4b35035bcf80ddb47c0112c4fbd84a63a2836a18
commit: f68f2ff91512c199ec24883001245912afc17873 fortify: Detect struct mem=
ber overflows in memcpy() at compile-time
date:   4 months ago
:::::: branch date: 2 days ago
:::::: commit date: 4 months ago
config: arm-randconfig-c002-20220617 (https://download.01.org/0day-ci/archi=
ve/20220619/202206192222.VuAJpf8x-lkp(a)intel.com/config)
compiler: arm-linux-gnueabi-gcc (GCC) 11.3.0
reproduce (this is a W=3D1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/=
make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.gi=
t/commit/?id=3Df68f2ff91512c199ec24883001245912afc17873
        git remote add linus https://git.kernel.org/pub/scm/linux/kernel/gi=
t/torvalds/linux.git
        git fetch --no-tags linus master
        git checkout f68f2ff91512c199ec24883001245912afc17873
        # save the config file
         ARCH=3Darm KBUILD_USERCFLAGS=3D'-fanalyzer -Wno-error' =


If you fix the issue, kindly add following tag where applicable
Reported-by: kernel test robot <lkp@intel.com>


gcc-analyzer warnings: (new ones prefixed by >>)
   In file included from net/netfilter/ipset/ip_set_hash_netportnet.c:433:
   net/netfilter/ipset/ip_set_hash_gen.h: In function 'hash_netportnet6_add=
':
>> net/netfilter/ipset/ip_set_hash_gen.h:894:26: warning: dereference of NU=
LL '*h_201->table.bucket[<unknown>]' [CWE-476] [-Wanalyzer-null-dereference]
     894 |         for (i =3D 0; i < n->pos; i++) {
         |                         ~^~~~~
     'hash_netportnet6_add': event 1
       |
       |net/netfilter/ipset/ip_set_hash_netportnet.c:430:25:
       |  430 | #define MTYPE           hash_netportnet6
       |      |                         ^~~~~~~~~~~~~~~~
       |      |                         |
       |      |                         (1) entry to 'hash_netportnet6_add'
   include/linux/netfilter/ipset/ip_set.h:526:41: note: in definition of ma=
cro 'IPSET_CONCAT'
       |  526 | #define IPSET_CONCAT(a, b)              a##b
       |      |                                         ^
   net/netfilter/ipset/ip_set_hash_gen.h:267:33: note: in expansion of macr=
o 'IPSET_TOKEN'
       |  267 | #define mtype_add               IPSET_TOKEN(MTYPE, _add)
       |      |                                 ^~~~~~~~~~~
   net/netfilter/ipset/ip_set_hash_gen.h:267:45: note: in expansion of macr=
o 'MTYPE'
       |  267 | #define mtype_add               IPSET_TOKEN(MTYPE, _add)
       |      |                                             ^~~~~
   net/netfilter/ipset/ip_set_hash_gen.h:841:1: note: in expansion of macro=
 'mtype_add'
       |  841 | mtype_add(struct ip_set *set, void *value, const struct ip_=
set_ext *ext,
       |      | ^~~~~~~~~
       |
     'hash_netportnet6_add': event 2
       |
       |  296 |         jhash2(__k, __l, initval) & jhash_mask(htable_bits)=
;    \
       |      |         ^~~~~~~~~~~~~~~~~~~~~~~~~
       |      |         |
       |      |         (2) calling 'jhash2' from 'hash_netportnet6_add'
   net/netfilter/ipset/ip_set_hash_gen.h:856:15: note: in expansion of macr=
o 'HKEY'
       |  856 |         key =3D HKEY(value, h->initval, t->htable_bits);
       |      |               ^~~~
       |
       +--> 'jhash2': events 3-5
              |
              |include/linux/jhash.h:117:19:
              |  117 | static inline u32 jhash2(const u32 *k, u32 length, u=
32 initval)
              |      |                   ^~~~~~
              |      |                   |
              |      |                   (3) entry to 'jhash2'
              |......
              |  125 |         while (length > 3) {
              |      |                ~~~~~~~~~~
              |      |                       |
              |      |                       (4) following 'true' branch (w=
hen 'length > 3')...
              |  126 |                 a +=3D k[0];
              |      |                      ~~~~
              |      |                       |
              |      |                       (5) ...to here
              |
       <------+
       |
     'hash_netportnet6_add': event 6
       |
       |net/netfilter/ipset/ip_set_hash_gen.h:296:9:
       |  296 |         jhash2(__k, __l, initval) & jhash_mask(htable_bits)=
;    \
       |      |         ^~~~~~~~~~~~~~~~~~~~~~~~~
       |      |         |
       |      |         (6) returning to 'hash_netportnet6_add' from 'jhash=
2'
   net/netfilter/ipset/ip_set_hash_gen.h:856:15: note: in expansion of macr=
o 'HKEY'
       |  856 |         key =3D HKEY(value, h->initval, t->htable_bits);
       |      |               ^~~~
       |
     'hash_netportnet6_add': event 7
       |
       |  861 |         if (elements >=3D maxelem) {
       |      |            ^
       |      |            |
       |      |            (7) following 'true' branch (when 'elements >=3D=
 maxelem')...
       |
     'hash_netportnet6_add': event 8
       |
       |include/linux/netfilter/ipset/ip_set.h:64:37:
       |   64 | #define SET_WITH_TIMEOUT(s)     ((s)->extensions & IPSET_EX=
T_TIMEOUT)
       |      |                                  ~~~^~~~~~~~~~~~
       |      |                                     |
       |      |                                     (8) ...to here
   net/netfilter/ipset/ip_set_hash_gen.h:863:21: note: in expansion of macr=
o 'SET_WITH_TIMEOUT'
       |  863 |                 if (SET_WITH_TIMEOUT(set)) {
       |      |                     ^~~~~~~~~~~~~~~~
       |
     'hash_netportnet6_add': event 9
       |
       |  863 |                 if (SET_WITH_TIMEOUT(set)) {
       |      |                    ^
       |      |                    |
       |      |                    (9) following 'true' branch...
       |
     'hash_netportnet6_add': event 10
       |
       |include/linux/instruction_pointer.h:6:41:
       |    6 | #define _THIS_IP_  ({ __label__ __here; __here: (unsigned l=
ong)&&__here; })
       |      |                                         ^~~~~~
       |      |                                         |
       |      |                                         (10) ...to here
   include/linux/bottom_half.h:33:30: note: in expansion of macro '_THIS_IP=
_'
       |   33 |         __local_bh_enable_ip(_THIS_IP_, SOFTIRQ_DISABLE_OFF=
SET);
       |      |                              ^~~~~~~~~
       |
     'hash_netportnet6_add': event 11
       |
--
   In file included from net/netfilter/ipset/ip_set_hash_ipmac.c:194:
   include/linux/jhash.h: In function 'hash_ipmac6_add':
>> net/netfilter/ipset/ip_set_hash_gen.h:894:26: warning: dereference of NU=
LL '*h_187->table.bucket[<unknown>]' [CWE-476] [-Wanalyzer-null-dereference]
     894 |         for (i =3D 0; i < n->pos; i++) {
         |                         ~^~~~~
     'hash_ipmac6_add': event 1
       |
       |net/netfilter/ipset/ip_set_hash_ipmac.c:189:25:
       |  189 | #define MTYPE           hash_ipmac6
       |      |                         ^~~~~~~~~~~
       |      |                         |
       |      |                         (1) entry to 'hash_ipmac6_add'
   include/linux/netfilter/ipset/ip_set.h:526:41: note: in definition of ma=
cro 'IPSET_CONCAT'
       |  526 | #define IPSET_CONCAT(a, b)              a##b
       |      |                                         ^
   net/netfilter/ipset/ip_set_hash_gen.h:267:33: note: in expansion of macr=
o 'IPSET_TOKEN'
       |  267 | #define mtype_add               IPSET_TOKEN(MTYPE, _add)
       |      |                                 ^~~~~~~~~~~
   net/netfilter/ipset/ip_set_hash_gen.h:267:45: note: in expansion of macr=
o 'MTYPE'
       |  267 | #define mtype_add               IPSET_TOKEN(MTYPE, _add)
       |      |                                             ^~~~~
   net/netfilter/ipset/ip_set_hash_gen.h:841:1: note: in expansion of macro=
 'mtype_add'
       |  841 | mtype_add(struct ip_set *set, void *value, const struct ip_=
set_ext *ext,
       |      | ^~~~~~~~~
       |
     'hash_ipmac6_add': event 2
       |
       |  296 |         jhash2(__k, __l, initval) & jhash_mask(htable_bits)=
;    \
       |      |         ^~~~~~~~~~~~~~~~~~~~~~~~~
       |      |         |
       |      |         (2) calling 'jhash2' from 'hash_ipmac6_add'
   net/netfilter/ipset/ip_set_hash_gen.h:856:15: note: in expansion of macr=
o 'HKEY'
       |  856 |         key =3D HKEY(value, h->initval, t->htable_bits);
       |      |               ^~~~
       |
       +--> 'jhash2': events 3-5
              |
              |include/linux/jhash.h:117:19:
              |  117 | static inline u32 jhash2(const u32 *k, u32 length, u=
32 initval)
              |      |                   ^~~~~~
              |      |                   |
              |      |                   (3) entry to 'jhash2'
              |......
              |  125 |         while (length > 3) {
              |      |                ~~~~~~~~~~
              |      |                       |
              |      |                       (4) following 'true' branch (w=
hen 'length > 3')...
              |  126 |                 a +=3D k[0];
              |      |                      ~~~~
              |      |                       |
              |      |                       (5) ...to here
              |
       <------+
       |
     'hash_ipmac6_add': event 6
       |
       |net/netfilter/ipset/ip_set_hash_gen.h:296:9:
       |  296 |         jhash2(__k, __l, initval) & jhash_mask(htable_bits)=
;    \
       |      |         ^~~~~~~~~~~~~~~~~~~~~~~~~
       |      |         |
       |      |         (6) returning to 'hash_ipmac6_add' from 'jhash2'
   net/netfilter/ipset/ip_set_hash_gen.h:856:15: note: in expansion of macr=
o 'HKEY'
       |  856 |         key =3D HKEY(value, h->initval, t->htable_bits);
       |      |               ^~~~
       |
     'hash_ipmac6_add': event 7
       |
       |  861 |         if (elements >=3D maxelem) {
       |      |            ^
       |      |            |
       |      |            (7) following 'true' branch (when 'elements >=3D=
 maxelem')...
       |
     'hash_ipmac6_add': event 8
       |
       |include/linux/netfilter/ipset/ip_set.h:64:37:
       |   64 | #define SET_WITH_TIMEOUT(s)     ((s)->extensions & IPSET_EX=
T_TIMEOUT)
       |      |                                  ~~~^~~~~~~~~~~~
       |      |                                     |
       |      |                                     (8) ...to here
   net/netfilter/ipset/ip_set_hash_gen.h:863:21: note: in expansion of macr=
o 'SET_WITH_TIMEOUT'
       |  863 |                 if (SET_WITH_TIMEOUT(set)) {
       |      |                     ^~~~~~~~~~~~~~~~
       |
     'hash_ipmac6_add': event 9
       |
       |  863 |                 if (SET_WITH_TIMEOUT(set)) {
       |      |                    ^
       |      |                    |
       |      |                    (9) following 'true' branch...
       |
     'hash_ipmac6_add': event 10
       |
       |include/linux/instruction_pointer.h:6:41:
       |    6 | #define _THIS_IP_  ({ __label__ __here; __here: (unsigned l=
ong)&&__here; })
       |      |                                         ^~~~~~
       |      |                                         |
       |      |                                         (10) ...to here
   include/linux/bottom_half.h:33:30: note: in expansion of macro '_THIS_IP=
_'
       |   33 |         __local_bh_enable_ip(_THIS_IP_, SOFTIRQ_DISABLE_OFF=
SET);
       |      |                              ^~~~~~~~~
       |
     'hash_ipmac6_add': event 11
       |
--
   In file included from net/netfilter/ipset/ip_set_hash_ipmark.c:211:
   include/linux/jhash.h: In function 'hash_ipmark6_add':
>> net/netfilter/ipset/ip_set_hash_gen.h:894:26: warning: dereference of NU=
LL '*h_187->table.bucket[<unknown>]' [CWE-476] [-Wanalyzer-null-dereference]
     894 |         for (i =3D 0; i < n->pos; i++) {
         |                         ~^~~~~
     'hash_ipmark6_add': event 1
       |
       |net/netfilter/ipset/ip_set_hash_ipmark.c:208:25:
       |  208 | #define MTYPE           hash_ipmark6
       |      |                         ^~~~~~~~~~~~
       |      |                         |
       |      |                         (1) entry to 'hash_ipmark6_add'
   include/linux/netfilter/ipset/ip_set.h:526:41: note: in definition of ma=
cro 'IPSET_CONCAT'
       |  526 | #define IPSET_CONCAT(a, b)              a##b
       |      |                                         ^
   net/netfilter/ipset/ip_set_hash_gen.h:267:33: note: in expansion of macr=
o 'IPSET_TOKEN'
       |  267 | #define mtype_add               IPSET_TOKEN(MTYPE, _add)
       |      |                                 ^~~~~~~~~~~
   net/netfilter/ipset/ip_set_hash_gen.h:267:45: note: in expansion of macr=
o 'MTYPE'
       |  267 | #define mtype_add               IPSET_TOKEN(MTYPE, _add)
       |      |                                             ^~~~~
   net/netfilter/ipset/ip_set_hash_gen.h:841:1: note: in expansion of macro=
 'mtype_add'
       |  841 | mtype_add(struct ip_set *set, void *value, const struct ip_=
set_ext *ext,
       |      | ^~~~~~~~~
       |
     'hash_ipmark6_add': event 2
       |
       |  296 |         jhash2(__k, __l, initval) & jhash_mask(htable_bits)=
;    \
       |      |         ^~~~~~~~~~~~~~~~~~~~~~~~~
       |      |         |
       |      |         (2) calling 'jhash2' from 'hash_ipmark6_add'
   net/netfilter/ipset/ip_set_hash_gen.h:856:15: note: in expansion of macr=
o 'HKEY'
       |  856 |         key =3D HKEY(value, h->initval, t->htable_bits);
       |      |               ^~~~
       |
       +--> 'jhash2': events 3-5
              |
              |include/linux/jhash.h:117:19:
              |  117 | static inline u32 jhash2(const u32 *k, u32 length, u=
32 initval)
              |      |                   ^~~~~~
              |      |                   |
              |      |                   (3) entry to 'jhash2'
              |......
              |  125 |         while (length > 3) {
              |      |                ~~~~~~~~~~
              |      |                       |
              |      |                       (4) following 'true' branch (w=
hen 'length > 3')...
              |  126 |                 a +=3D k[0];
              |      |                      ~~~~
              |      |                       |
              |      |                       (5) ...to here
              |
       <------+
       |
     'hash_ipmark6_add': event 6
       |
       |net/netfilter/ipset/ip_set_hash_gen.h:296:9:
       |  296 |         jhash2(__k, __l, initval) & jhash_mask(htable_bits)=
;    \
       |      |         ^~~~~~~~~~~~~~~~~~~~~~~~~
       |      |         |
       |      |         (6) returning to 'hash_ipmark6_add' from 'jhash2'
   net/netfilter/ipset/ip_set_hash_gen.h:856:15: note: in expansion of macr=
o 'HKEY'
       |  856 |         key =3D HKEY(value, h->initval, t->htable_bits);
       |      |               ^~~~
       |
     'hash_ipmark6_add': event 7
       |
       |  861 |         if (elements >=3D maxelem) {
       |      |            ^
       |      |            |
       |      |            (7) following 'true' branch (when 'elements >=3D=
 maxelem')...
       |
     'hash_ipmark6_add': event 8
       |
       |include/linux/netfilter/ipset/ip_set.h:64:37:
       |   64 | #define SET_WITH_TIMEOUT(s)     ((s)->extensions & IPSET_EX=
T_TIMEOUT)
       |      |                                  ~~~^~~~~~~~~~~~
       |      |                                     |
       |      |                                     (8) ...to here
   net/netfilter/ipset/ip_set_hash_gen.h:863:21: note: in expansion of macr=
o 'SET_WITH_TIMEOUT'
       |  863 |                 if (SET_WITH_TIMEOUT(set)) {
       |      |                     ^~~~~~~~~~~~~~~~
       |
     'hash_ipmark6_add': event 9
       |
       |  863 |                 if (SET_WITH_TIMEOUT(set)) {
       |      |                    ^
       |      |                    |
       |      |                    (9) following 'true' branch...
       |
     'hash_ipmark6_add': event 10
       |
       |include/linux/instruction_pointer.h:6:41:
       |    6 | #define _THIS_IP_  ({ __label__ __here; __here: (unsigned l=
ong)&&__here; })
       |      |                                         ^~~~~~
       |      |                                         |
       |      |                                         (10) ...to here
   include/linux/bottom_half.h:33:30: note: in expansion of macro '_THIS_IP=
_'
       |   33 |         __local_bh_enable_ip(_THIS_IP_, SOFTIRQ_DISABLE_OFF=
SET);
       |      |                              ^~~~~~~~~
       |
     'hash_ipmark6_add': event 11
       |
--
   In file included from net/netfilter/ipset/ip_set_hash_ipport.c:246:
   include/linux/jhash.h: In function 'hash_ipport6_add':
>> net/netfilter/ipset/ip_set_hash_gen.h:894:26: warning: dereference of NU=
LL '*h_187->table.bucket[<unknown>]' [CWE-476] [-Wanalyzer-null-dereference]
     894 |         for (i =3D 0; i < n->pos; i++) {
         |                         ~^~~~~
     'hash_ipport6_add': event 1
       |
       |net/netfilter/ipset/ip_set_hash_ipport.c:243:25:
       |  243 | #define MTYPE           hash_ipport6
       |      |                         ^~~~~~~~~~~~
       |      |                         |
       |      |                         (1) entry to 'hash_ipport6_add'
   include/linux/netfilter/ipset/ip_set.h:526:41: note: in definition of ma=
cro 'IPSET_CONCAT'
       |  526 | #define IPSET_CONCAT(a, b)              a##b
       |      |                                         ^
   net/netfilter/ipset/ip_set_hash_gen.h:267:33: note: in expansion of macr=
o 'IPSET_TOKEN'
       |  267 | #define mtype_add               IPSET_TOKEN(MTYPE, _add)
       |      |                                 ^~~~~~~~~~~
   net/netfilter/ipset/ip_set_hash_gen.h:267:45: note: in expansion of macr=
o 'MTYPE'
       |  267 | #define mtype_add               IPSET_TOKEN(MTYPE, _add)
       |      |                                             ^~~~~
   net/netfilter/ipset/ip_set_hash_gen.h:841:1: note: in expansion of macro=
 'mtype_add'
       |  841 | mtype_add(struct ip_set *set, void *value, const struct ip_=
set_ext *ext,
       |      | ^~~~~~~~~
       |
     'hash_ipport6_add': event 2
       |
       |  296 |         jhash2(__k, __l, initval) & jhash_mask(htable_bits)=
;    \
       |      |         ^~~~~~~~~~~~~~~~~~~~~~~~~
       |      |         |
       |      |         (2) calling 'jhash2' from 'hash_ipport6_add'
   net/netfilter/ipset/ip_set_hash_gen.h:856:15: note: in expansion of macr=
o 'HKEY'
       |  856 |         key =3D HKEY(value, h->initval, t->htable_bits);
       |      |               ^~~~
       |
       +--> 'jhash2': events 3-5
              |
              |include/linux/jhash.h:117:19:
              |  117 | static inline u32 jhash2(const u32 *k, u32 length, u=
32 initval)
              |      |                   ^~~~~~
              |      |                   |
              |      |                   (3) entry to 'jhash2'
              |......
              |  125 |         while (length > 3) {
              |      |                ~~~~~~~~~~
              |      |                       |
              |      |                       (4) following 'true' branch (w=
hen 'length > 3')...
              |  126 |                 a +=3D k[0];
              |      |                      ~~~~
              |      |                       |
              |      |                       (5) ...to here
              |
       <------+
       |
     'hash_ipport6_add': event 6
       |
       |net/netfilter/ipset/ip_set_hash_gen.h:296:9:
       |  296 |         jhash2(__k, __l, initval) & jhash_mask(htable_bits)=
;    \
       |      |         ^~~~~~~~~~~~~~~~~~~~~~~~~
       |      |         |
       |      |         (6) returning to 'hash_ipport6_add' from 'jhash2'
   net/netfilter/ipset/ip_set_hash_gen.h:856:15: note: in expansion of macr=
o 'HKEY'
       |  856 |         key =3D HKEY(value, h->initval, t->htable_bits);
       |      |               ^~~~
       |
     'hash_ipport6_add': event 7
       |
       |  861 |         if (elements >=3D maxelem) {
       |      |            ^
       |      |            |
       |      |            (7) following 'true' branch (when 'elements >=3D=
 maxelem')...
       |
     'hash_ipport6_add': event 8
       |
       |include/linux/netfilter/ipset/ip_set.h:64:37:
       |   64 | #define SET_WITH_TIMEOUT(s)     ((s)->extensions & IPSET_EX=
T_TIMEOUT)
       |      |                                  ~~~^~~~~~~~~~~~
       |      |                                     |
       |      |                                     (8) ...to here
   net/netfilter/ipset/ip_set_hash_gen.h:863:21: note: in expansion of macr=
o 'SET_WITH_TIMEOUT'
       |  863 |                 if (SET_WITH_TIMEOUT(set)) {
       |      |                     ^~~~~~~~~~~~~~~~
       |
     'hash_ipport6_add': event 9
       |
       |  863 |                 if (SET_WITH_TIMEOUT(set)) {
       |      |                    ^
       |      |                    |
       |      |                    (9) following 'true' branch...
       |
     'hash_ipport6_add': event 10
       |
       |include/linux/instruction_pointer.h:6:41:
       |    6 | #define _THIS_IP_  ({ __label__ __here; __here: (unsigned l=
ong)&&__here; })
       |      |                                         ^~~~~~
       |      |                                         |
       |      |                                         (10) ...to here
   include/linux/bottom_half.h:33:30: note: in expansion of macro '_THIS_IP=
_'
       |   33 |         __local_bh_enable_ip(_THIS_IP_, SOFTIRQ_DISABLE_OFF=
SET);
       |      |                              ^~~~~~~~~
       |
     'hash_ipport6_add': event 11
       |
--
   In file included from net/netfilter/ipset/ip_set_hash_ipportip.c:256:
   include/linux/jhash.h: In function 'hash_ipportip6_add':
>> net/netfilter/ipset/ip_set_hash_gen.h:894:26: warning: dereference of NU=
LL '*h_187->table.bucket[<unknown>]' [CWE-476] [-Wanalyzer-null-dereference]
     894 |         for (i =3D 0; i < n->pos; i++) {
         |                         ~^~~~~
     'hash_ipportip6_add': event 1
       |
       |net/netfilter/ipset/ip_set_hash_ipportip.c:253:25:
       |  253 | #define MTYPE           hash_ipportip6
       |      |                         ^~~~~~~~~~~~~~
       |      |                         |
       |      |                         (1) entry to 'hash_ipportip6_add'
   include/linux/netfilter/ipset/ip_set.h:526:41: note: in definition of ma=
cro 'IPSET_CONCAT'
       |  526 | #define IPSET_CONCAT(a, b)              a##b
       |      |                                         ^
   net/netfilter/ipset/ip_set_hash_gen.h:267:33: note: in expansion of macr=
o 'IPSET_TOKEN'
       |  267 | #define mtype_add               IPSET_TOKEN(MTYPE, _add)
       |      |                                 ^~~~~~~~~~~
   net/netfilter/ipset/ip_set_hash_gen.h:267:45: note: in expansion of macr=
o 'MTYPE'
       |  267 | #define mtype_add               IPSET_TOKEN(MTYPE, _add)
       |      |                                             ^~~~~
   net/netfilter/ipset/ip_set_hash_gen.h:841:1: note: in expansion of macro=
 'mtype_add'
       |  841 | mtype_add(struct ip_set *set, void *value, const struct ip_=
set_ext *ext,
       |      | ^~~~~~~~~
       |
     'hash_ipportip6_add': event 2
       |
       |  296 |         jhash2(__k, __l, initval) & jhash_mask(htable_bits)=
;    \
       |      |         ^~~~~~~~~~~~~~~~~~~~~~~~~
       |      |         |
       |      |         (2) calling 'jhash2' from 'hash_ipportip6_add'
   net/netfilter/ipset/ip_set_hash_gen.h:856:15: note: in expansion of macr=
o 'HKEY'
       |  856 |         key =3D HKEY(value, h->initval, t->htable_bits);
       |      |               ^~~~
       |
       +--> 'jhash2': events 3-5
              |
              |include/linux/jhash.h:117:19:
              |  117 | static inline u32 jhash2(const u32 *k, u32 length, u=
32 initval)
              |      |                   ^~~~~~
              |      |                   |
              |      |                   (3) entry to 'jhash2'
              |......
              |  125 |         while (length > 3) {
              |      |                ~~~~~~~~~~
              |      |                       |
              |      |                       (4) following 'true' branch (w=
hen 'length > 3')...
              |  126 |                 a +=3D k[0];
              |      |                      ~~~~
              |      |                       |
              |      |                       (5) ...to here
              |
       <------+
       |
     'hash_ipportip6_add': event 6
       |
       |net/netfilter/ipset/ip_set_hash_gen.h:296:9:
       |  296 |         jhash2(__k, __l, initval) & jhash_mask(htable_bits)=
;    \
       |      |         ^~~~~~~~~~~~~~~~~~~~~~~~~
       |      |         |
       |      |         (6) returning to 'hash_ipportip6_add' from 'jhash2'
   net/netfilter/ipset/ip_set_hash_gen.h:856:15: note: in expansion of macr=
o 'HKEY'
       |  856 |         key =3D HKEY(value, h->initval, t->htable_bits);
       |      |               ^~~~
       |
     'hash_ipportip6_add': event 7
       |
       |  861 |         if (elements >=3D maxelem) {
       |      |            ^
       |      |            |
       |      |            (7) following 'true' branch (when 'elements >=3D=
 maxelem')...
       |
     'hash_ipportip6_add': event 8
       |
       |include/linux/netfilter/ipset/ip_set.h:64:37:
       |   64 | #define SET_WITH_TIMEOUT(s)     ((s)->extensions & IPSET_EX=
T_TIMEOUT)
       |      |                                  ~~~^~~~~~~~~~~~
       |      |                                     |
       |      |                                     (8) ...to here
   net/netfilter/ipset/ip_set_hash_gen.h:863:21: note: in expansion of macr=
o 'SET_WITH_TIMEOUT'
       |  863 |                 if (SET_WITH_TIMEOUT(set)) {
       |      |                     ^~~~~~~~~~~~~~~~
       |
     'hash_ipportip6_add': event 9
       |
       |  863 |                 if (SET_WITH_TIMEOUT(set)) {
       |      |                    ^
       |      |                    |
       |      |                    (9) following 'true' branch...
       |
     'hash_ipportip6_add': event 10
       |
       |include/linux/instruction_pointer.h:6:41:
       |    6 | #define _THIS_IP_  ({ __label__ __here; __here: (unsigned l=
ong)&&__here; })
       |      |                                         ^~~~~~
       |      |                                         |
       |      |                                         (10) ...to here
   include/linux/bottom_half.h:33:30: note: in expansion of macro '_THIS_IP=
_'
       |   33 |         __local_bh_enable_ip(_THIS_IP_, SOFTIRQ_DISABLE_OFF=
SET);
       |      |                              ^~~~~~~~~
       |
     'hash_ipportip6_add': event 11
       |
--
   In file included from net/netfilter/ipset/ip_set_hash_ipportnet.c:385:
   net/netfilter/ipset/ip_set_hash_gen.h: In function 'hash_ipportnet6_add':
>> net/netfilter/ipset/ip_set_hash_gen.h:894:26: warning: dereference of NU=
LL '*h_199->table.bucket[<unknown>]' [CWE-476] [-Wanalyzer-null-dereference]
     894 |         for (i =3D 0; i < n->pos; i++) {
         |                         ~^~~~~
     'hash_ipportnet6_add': event 1
       |
       |net/netfilter/ipset/ip_set_hash_ipportnet.c:382:25:
       |  382 | #define MTYPE           hash_ipportnet6
       |      |                         ^~~~~~~~~~~~~~~
       |      |                         |
       |      |                         (1) entry to 'hash_ipportnet6_add'
   include/linux/netfilter/ipset/ip_set.h:526:41: note: in definition of ma=
cro 'IPSET_CONCAT'
       |  526 | #define IPSET_CONCAT(a, b)              a##b
       |      |                                         ^
   net/netfilter/ipset/ip_set_hash_gen.h:267:33: note: in expansion of macr=
o 'IPSET_TOKEN'
       |  267 | #define mtype_add               IPSET_TOKEN(MTYPE, _add)
       |      |                                 ^~~~~~~~~~~
   net/netfilter/ipset/ip_set_hash_gen.h:267:45: note: in expansion of macr=
o 'MTYPE'
       |  267 | #define mtype_add               IPSET_TOKEN(MTYPE, _add)
       |      |                                             ^~~~~
   net/netfilter/ipset/ip_set_hash_gen.h:841:1: note: in expansion of macro=
 'mtype_add'
       |  841 | mtype_add(struct ip_set *set, void *value, const struct ip_=
set_ext *ext,
       |      | ^~~~~~~~~
       |
     'hash_ipportnet6_add': event 2
       |
       |  296 |         jhash2(__k, __l, initval) & jhash_mask(htable_bits)=
;    \
       |      |         ^~~~~~~~~~~~~~~~~~~~~~~~~
       |      |         |
       |      |         (2) calling 'jhash2' from 'hash_ipportnet6_add'
   net/netfilter/ipset/ip_set_hash_gen.h:856:15: note: in expansion of macr=
o 'HKEY'
       |  856 |         key =3D HKEY(value, h->initval, t->htable_bits);
       |      |               ^~~~
       |
       +--> 'jhash2': events 3-5
              |
              |include/linux/jhash.h:117:19:
              |  117 | static inline u32 jhash2(const u32 *k, u32 length, u=
32 initval)
              |      |                   ^~~~~~
              |      |                   |
              |      |                   (3) entry to 'jhash2'
              |......
              |  125 |         while (length > 3) {
              |      |                ~~~~~~~~~~
              |      |                       |
              |      |                       (4) following 'true' branch (w=
hen 'length > 3')...
              |  126 |                 a +=3D k[0];
              |      |                      ~~~~
              |      |                       |
              |      |                       (5) ...to here
              |
       <------+
       |
     'hash_ipportnet6_add': event 6
       |
       |net/netfilter/ipset/ip_set_hash_gen.h:296:9:
       |  296 |         jhash2(__k, __l, initval) & jhash_mask(htable_bits)=
;    \
       |      |         ^~~~~~~~~~~~~~~~~~~~~~~~~
       |      |         |
       |      |         (6) returning to 'hash_ipportnet6_add' from 'jhash2'
   net/netfilter/ipset/ip_set_hash_gen.h:856:15: note: in expansion of macr=
o 'HKEY'
       |  856 |         key =3D HKEY(value, h->initval, t->htable_bits);
       |      |               ^~~~
       |
     'hash_ipportnet6_add': event 7
       |
       |  861 |         if (elements >=3D maxelem) {
       |      |            ^
       |      |            |
       |      |            (7) following 'true' branch (when 'elements >=3D=
 maxelem')...
       |
     'hash_ipportnet6_add': event 8
       |
       |include/linux/netfilter/ipset/ip_set.h:64:37:
       |   64 | #define SET_WITH_TIMEOUT(s)     ((s)->extensions & IPSET_EX=
T_TIMEOUT)
       |      |                                  ~~~^~~~~~~~~~~~
       |      |                                     |
       |      |                                     (8) ...to here
   net/netfilter/ipset/ip_set_hash_gen.h:863:21: note: in expansion of macr=
o 'SET_WITH_TIMEOUT'
       |  863 |                 if (SET_WITH_TIMEOUT(set)) {
       |      |                     ^~~~~~~~~~~~~~~~
       |
     'hash_ipportnet6_add': event 9
       |
       |  863 |                 if (SET_WITH_TIMEOUT(set)) {
       |      |                    ^
       |      |                    |
       |      |                    (9) following 'true' branch...
       |
     'hash_ipportnet6_add': event 10
       |
       |include/linux/instruction_pointer.h:6:41:
       |    6 | #define _THIS_IP_  ({ __label__ __here; __here: (unsigned l=
ong)&&__here; })
       |      |                                         ^~~~~~
       |      |                                         |
       |      |                                         (10) ...to here
   include/linux/bottom_half.h:33:30: note: in expansion of macro '_THIS_IP=
_'
       |   33 |         __local_bh_enable_ip(_THIS_IP_, SOFTIRQ_DISABLE_OFF=
SET);
       |      |                              ^~~~~~~~~
       |
     'hash_ipportnet6_add': event 11
       |
--
   In file included from net/netfilter/ipset/ip_set_hash_netiface.c:378:
   net/netfilter/ipset/ip_set_hash_gen.h: In function 'hash_netiface6_add':
>> net/netfilter/ipset/ip_set_hash_gen.h:894:26: warning: dereference of NU=
LL '*h_202->table.bucket[<unknown>]' [CWE-476] [-Wanalyzer-null-dereference]
     894 |         for (i =3D 0; i < n->pos; i++) {
         |                         ~^~~~~
     'hash_netiface6_add': event 1
       |
       |net/netfilter/ipset/ip_set_hash_netiface.c:374:25:
       |  374 | #define MTYPE           hash_netiface6
       |      |                         ^~~~~~~~~~~~~~
       |      |                         |
       |      |                         (1) entry to 'hash_netiface6_add'
   include/linux/netfilter/ipset/ip_set.h:526:41: note: in definition of ma=
cro 'IPSET_CONCAT'
       |  526 | #define IPSET_CONCAT(a, b)              a##b
       |      |                                         ^
   net/netfilter/ipset/ip_set_hash_gen.h:267:33: note: in expansion of macr=
o 'IPSET_TOKEN'
       |  267 | #define mtype_add               IPSET_TOKEN(MTYPE, _add)
       |      |                                 ^~~~~~~~~~~
   net/netfilter/ipset/ip_set_hash_gen.h:267:45: note: in expansion of macr=
o 'MTYPE'
       |  267 | #define mtype_add               IPSET_TOKEN(MTYPE, _add)
       |      |                                             ^~~~~
   net/netfilter/ipset/ip_set_hash_gen.h:841:1: note: in expansion of macro=
 'mtype_add'
       |  841 | mtype_add(struct ip_set *set, void *value, const struct ip_=
set_ext *ext,
       |      | ^~~~~~~~~
       |
     'hash_netiface6_add': event 2
       |
       |  296 |         jhash2(__k, __l, initval) & jhash_mask(htable_bits)=
;    \
       |      |         ^~~~~~~~~~~~~~~~~~~~~~~~~
       |      |         |
       |      |         (2) calling 'jhash2' from 'hash_netiface6_add'
   net/netfilter/ipset/ip_set_hash_gen.h:856:15: note: in expansion of macr=
o 'HKEY'
       |  856 |         key =3D HKEY(value, h->initval, t->htable_bits);
       |      |               ^~~~
       |
       +--> 'jhash2': events 3-5
              |
              |include/linux/jhash.h:117:19:
              |  117 | static inline u32 jhash2(const u32 *k, u32 length, u=
32 initval)
              |      |                   ^~~~~~
              |      |                   |
              |      |                   (3) entry to 'jhash2'
              |......
              |  125 |         while (length > 3) {
              |      |                ~~~~~~~~~~
              |      |                       |
              |      |                       (4) following 'true' branch (w=
hen 'length > 3')...
              |  126 |                 a +=3D k[0];
              |      |                      ~~~~
              |      |                       |
              |      |                       (5) ...to here
              |
       <------+
       |
     'hash_netiface6_add': event 6
       |
       |net/netfilter/ipset/ip_set_hash_gen.h:296:9:
       |  296 |         jhash2(__k, __l, initval) & jhash_mask(htable_bits)=
;    \
       |      |         ^~~~~~~~~~~~~~~~~~~~~~~~~
       |      |         |
       |      |         (6) returning to 'hash_netiface6_add' from 'jhash2'
   net/netfilter/ipset/ip_set_hash_gen.h:856:15: note: in expansion of macr=
o 'HKEY'
       |  856 |         key =3D HKEY(value, h->initval, t->htable_bits);
       |      |               ^~~~
       |
     'hash_netiface6_add': event 7
       |
       |  861 |         if (elements >=3D maxelem) {
       |      |            ^
       |      |            |
       |      |            (7) following 'true' branch (when 'elements >=3D=
 maxelem')...
       |
     'hash_netiface6_add': event 8
       |
       |include/linux/netfilter/ipset/ip_set.h:64:37:
       |   64 | #define SET_WITH_TIMEOUT(s)     ((s)->extensions & IPSET_EX=
T_TIMEOUT)
       |      |                                  ~~~^~~~~~~~~~~~
       |      |                                     |
       |      |                                     (8) ...to here
   net/netfilter/ipset/ip_set_hash_gen.h:863:21: note: in expansion of macr=
o 'SET_WITH_TIMEOUT'
       |  863 |                 if (SET_WITH_TIMEOUT(set)) {
       |      |                     ^~~~~~~~~~~~~~~~
       |
     'hash_netiface6_add': event 9
       |
       |  863 |                 if (SET_WITH_TIMEOUT(set)) {
       |      |                    ^
       |      |                    |
       |      |                    (9) following 'true' branch...
       |
     'hash_netiface6_add': event 10
       |
       |include/linux/instruction_pointer.h:6:41:
       |    6 | #define _THIS_IP_  ({ __label__ __here; __here: (unsigned l=
ong)&&__here; })
       |      |                                         ^~~~~~
       |      |                                         |
       |      |                                         (10) ...to here
   include/linux/bottom_half.h:33:30: note: in expansion of macro '_THIS_IP=
_'
       |   33 |         __local_bh_enable_ip(_THIS_IP_, SOFTIRQ_DISABLE_OFF=
SET);
       |      |                              ^~~~~~~~~
       |
     'hash_netiface6_add': event 11
       |
--
   In file included from net/netfilter/ipset/ip_set_hash_netnet.c:378:
   net/netfilter/ipset/ip_set_hash_gen.h: In function 'hash_netnet6_add':
>> net/netfilter/ipset/ip_set_hash_gen.h:894:26: warning: dereference of NU=
LL '*h_201->table.bucket[<unknown>]' [CWE-476] [-Wanalyzer-null-dereference]
     894 |         for (i =3D 0; i < n->pos; i++) {
         |                         ~^~~~~
     'hash_netnet6_add': event 1
       |
       |net/netfilter/ipset/ip_set_hash_netnet.c:375:25:
       |  375 | #define MTYPE           hash_netnet6
       |      |                         ^~~~~~~~~~~~
       |      |                         |
       |      |                         (1) entry to 'hash_netnet6_add'
   include/linux/netfilter/ipset/ip_set.h:526:41: note: in definition of ma=
cro 'IPSET_CONCAT'
       |  526 | #define IPSET_CONCAT(a, b)              a##b
       |      |                                         ^
   net/netfilter/ipset/ip_set_hash_gen.h:267:33: note: in expansion of macr=
o 'IPSET_TOKEN'
       |  267 | #define mtype_add               IPSET_TOKEN(MTYPE, _add)
       |      |                                 ^~~~~~~~~~~
   net/netfilter/ipset/ip_set_hash_gen.h:267:45: note: in expansion of macr=
o 'MTYPE'
       |  267 | #define mtype_add               IPSET_TOKEN(MTYPE, _add)
       |      |                                             ^~~~~
   net/netfilter/ipset/ip_set_hash_gen.h:841:1: note: in expansion of macro=
 'mtype_add'
       |  841 | mtype_add(struct ip_set *set, void *value, const struct ip_=
set_ext *ext,
       |      | ^~~~~~~~~
       |
     'hash_netnet6_add': event 2
       |
       |  296 |         jhash2(__k, __l, initval) & jhash_mask(htable_bits)=
;    \
       |      |         ^~~~~~~~~~~~~~~~~~~~~~~~~
       |      |         |
       |      |         (2) calling 'jhash2' from 'hash_netnet6_add'
   net/netfilter/ipset/ip_set_hash_gen.h:856:15: note: in expansion of macr=
o 'HKEY'
       |  856 |         key =3D HKEY(value, h->initval, t->htable_bits);
       |      |               ^~~~
       |
       +--> 'jhash2': events 3-5
              |
              |include/linux/jhash.h:117:19:
              |  117 | static inline u32 jhash2(const u32 *k, u32 length, u=
32 initval)
              |      |                   ^~~~~~
              |      |                   |
              |      |                   (3) entry to 'jhash2'
              |......
              |  125 |         while (length > 3) {
              |      |                ~~~~~~~~~~
              |      |                       |
              |      |                       (4) following 'true' branch (w=
hen 'length > 3')...
              |  126 |                 a +=3D k[0];
              |      |                      ~~~~
              |      |                       |
              |      |                       (5) ...to here
              |
       <------+
       |
     'hash_netnet6_add': event 6
       |
       |net/netfilter/ipset/ip_set_hash_gen.h:296:9:
       |  296 |         jhash2(__k, __l, initval) & jhash_mask(htable_bits)=
;    \
       |      |         ^~~~~~~~~~~~~~~~~~~~~~~~~
       |      |         |
       |      |         (6) returning to 'hash_netnet6_add' from 'jhash2'
   net/netfilter/ipset/ip_set_hash_gen.h:856:15: note: in expansion of macr=
o 'HKEY'
       |  856 |         key =3D HKEY(value, h->initval, t->htable_bits);
       |      |               ^~~~
       |
     'hash_netnet6_add': event 7
       |
       |  861 |         if (elements >=3D maxelem) {
       |      |            ^
       |      |            |
       |      |            (7) following 'true' branch (when 'elements >=3D=
 maxelem')...
       |
     'hash_netnet6_add': event 8
       |
       |include/linux/netfilter/ipset/ip_set.h:64:37:
       |   64 | #define SET_WITH_TIMEOUT(s)     ((s)->extensions & IPSET_EX=
T_TIMEOUT)
       |      |                                  ~~~^~~~~~~~~~~~
       |      |                                     |
       |      |                                     (8) ...to here
   net/netfilter/ipset/ip_set_hash_gen.h:863:21: note: in expansion of macr=
o 'SET_WITH_TIMEOUT'
       |  863 |                 if (SET_WITH_TIMEOUT(set)) {
       |      |                     ^~~~~~~~~~~~~~~~
       |
     'hash_netnet6_add': event 9
       |
       |  863 |                 if (SET_WITH_TIMEOUT(set)) {
       |      |                    ^
       |      |                    |
       |      |                    (9) following 'true' branch...
       |
     'hash_netnet6_add': event 10
       |
       |include/linux/instruction_pointer.h:6:41:
       |    6 | #define _THIS_IP_  ({ __label__ __here; __here: (unsigned l=
ong)&&__here; })
       |      |                                         ^~~~~~
       |      |                                         |
       |      |                                         (10) ...to here
   include/linux/bottom_half.h:33:30: note: in expansion of macro '_THIS_IP=
_'
       |   33 |         __local_bh_enable_ip(_THIS_IP_, SOFTIRQ_DISABLE_OFF=
SET);
       |      |                              ^~~~~~~~~
       |
     'hash_netnet6_add': event 11
       |

vim +894 net/netfilter/ipset/ip_set_hash_gen.h

f66ee0410b1c34 Jozsef Kadlecsik 2020-02-11   836  =

1feab10d7e6ddb Jozsef Kadlecsik 2013-04-08   837  /* Add an element to a ha=
sh and update the internal counters when succeeded,
ca0f6a5cd99e0c Jozsef Kadlecsik 2015-06-13   838   * otherwise report the p=
roper error code.
ca0f6a5cd99e0c Jozsef Kadlecsik 2015-06-13   839   */
1feab10d7e6ddb Jozsef Kadlecsik 2013-04-08   840  static int
1feab10d7e6ddb Jozsef Kadlecsik 2013-04-08   841  mtype_add(struct ip_set *=
set, void *value, const struct ip_set_ext *ext,
1feab10d7e6ddb Jozsef Kadlecsik 2013-04-08   842  	  struct ip_set_ext *mex=
t, u32 flags)
1feab10d7e6ddb Jozsef Kadlecsik 2013-04-08   843  {
1feab10d7e6ddb Jozsef Kadlecsik 2013-04-08   844  	struct htype *h =3D set-=
>data;
1feab10d7e6ddb Jozsef Kadlecsik 2013-04-08   845  	struct htable *t;
1feab10d7e6ddb Jozsef Kadlecsik 2013-04-08   846  	const struct mtype_elem =
*d =3D value;
1feab10d7e6ddb Jozsef Kadlecsik 2013-04-08   847  	struct mtype_elem *data;
18f84d41d34fa3 Jozsef Kadlecsik 2015-06-13   848  	struct hbucket *n, *old =
=3D ERR_PTR(-ENOENT);
f66ee0410b1c34 Jozsef Kadlecsik 2020-02-11   849  	int i, j =3D -1, ret;
1feab10d7e6ddb Jozsef Kadlecsik 2013-04-08   850  	bool flag_exist =3D flag=
s & IPSET_FLAG_EXIST;
18f84d41d34fa3 Jozsef Kadlecsik 2015-06-13   851  	bool deleted =3D false, =
forceadd =3D false, reuse =3D false;
f66ee0410b1c34 Jozsef Kadlecsik 2020-02-11   852  	u32 r, key, multi =3D 0,=
 elements, maxelem;
1feab10d7e6ddb Jozsef Kadlecsik 2013-04-08   853  =

f66ee0410b1c34 Jozsef Kadlecsik 2020-02-11   854  	rcu_read_lock_bh();
f66ee0410b1c34 Jozsef Kadlecsik 2020-02-11   855  	t =3D rcu_dereference_bh=
(h->table);
f66ee0410b1c34 Jozsef Kadlecsik 2020-02-11   856  	key =3D HKEY(value, h->i=
nitval, t->htable_bits);
f66ee0410b1c34 Jozsef Kadlecsik 2020-02-11   857  	r =3D ahash_region(key, =
t->htable_bits);
f66ee0410b1c34 Jozsef Kadlecsik 2020-02-11   858  	atomic_inc(&t->uref);
f66ee0410b1c34 Jozsef Kadlecsik 2020-02-11   859  	elements =3D t->hregion[=
r].elements;
f66ee0410b1c34 Jozsef Kadlecsik 2020-02-11   860  	maxelem =3D t->maxelem;
f66ee0410b1c34 Jozsef Kadlecsik 2020-02-11   861  	if (elements >=3D maxele=
m) {
f66ee0410b1c34 Jozsef Kadlecsik 2020-02-11   862  		u32 e;
f66ee0410b1c34 Jozsef Kadlecsik 2020-02-11   863  		if (SET_WITH_TIMEOUT(se=
t)) {
f66ee0410b1c34 Jozsef Kadlecsik 2020-02-11   864  			rcu_read_unlock_bh();
f66ee0410b1c34 Jozsef Kadlecsik 2020-02-11   865  			mtype_gc_do(set, h, t,=
 r);
f66ee0410b1c34 Jozsef Kadlecsik 2020-02-11   866  			rcu_read_lock_bh();
f66ee0410b1c34 Jozsef Kadlecsik 2020-02-11   867  		}
f66ee0410b1c34 Jozsef Kadlecsik 2020-02-11   868  		maxelem =3D h->maxelem;
f66ee0410b1c34 Jozsef Kadlecsik 2020-02-11   869  		elements =3D 0;
f66ee0410b1c34 Jozsef Kadlecsik 2020-02-11   870  		for (e =3D 0; e < ahash=
_numof_locks(t->htable_bits); e++)
f66ee0410b1c34 Jozsef Kadlecsik 2020-02-11   871  			elements +=3D t->hregi=
on[e].elements;
f66ee0410b1c34 Jozsef Kadlecsik 2020-02-11   872  		if (elements >=3D maxel=
em && SET_WITH_FORCEADD(set))
18f84d41d34fa3 Jozsef Kadlecsik 2015-06-13   873  			forceadd =3D true;
18f84d41d34fa3 Jozsef Kadlecsik 2015-06-13   874  	}
f66ee0410b1c34 Jozsef Kadlecsik 2020-02-11   875  	rcu_read_unlock_bh();
18f84d41d34fa3 Jozsef Kadlecsik 2015-06-13   876  =

f66ee0410b1c34 Jozsef Kadlecsik 2020-02-11   877  	spin_lock_bh(&t->hregion=
[r].lock);
f66ee0410b1c34 Jozsef Kadlecsik 2020-02-11   878  	n =3D rcu_dereference_bh=
(hbucket(t, key));
18f84d41d34fa3 Jozsef Kadlecsik 2015-06-13   879  	if (!n) {
f66ee0410b1c34 Jozsef Kadlecsik 2020-02-11   880  		if (forceadd || element=
s >=3D maxelem)
18f84d41d34fa3 Jozsef Kadlecsik 2015-06-13   881  			goto set_full;
18f84d41d34fa3 Jozsef Kadlecsik 2015-06-13   882  		old =3D NULL;
18f84d41d34fa3 Jozsef Kadlecsik 2015-06-13   883  		n =3D kzalloc(sizeof(*n=
) + AHASH_INIT_SIZE * set->dsize,
18f84d41d34fa3 Jozsef Kadlecsik 2015-06-13   884  			    GFP_ATOMIC);
f66ee0410b1c34 Jozsef Kadlecsik 2020-02-11   885  		if (!n) {
f66ee0410b1c34 Jozsef Kadlecsik 2020-02-11   886  			ret =3D -ENOMEM;
f66ee0410b1c34 Jozsef Kadlecsik 2020-02-11   887  			goto unlock;
f66ee0410b1c34 Jozsef Kadlecsik 2020-02-11   888  		}
18f84d41d34fa3 Jozsef Kadlecsik 2015-06-13   889  		n->size =3D AHASH_INIT_=
SIZE;
f66ee0410b1c34 Jozsef Kadlecsik 2020-02-11   890  		t->hregion[r].ext_size =
+=3D
f66ee0410b1c34 Jozsef Kadlecsik 2020-02-11   891  			ext_size(AHASH_INIT_SI=
ZE, set->dsize);
18f84d41d34fa3 Jozsef Kadlecsik 2015-06-13   892  		goto copy_elem;
18f84d41d34fa3 Jozsef Kadlecsik 2015-06-13   893  	}
1feab10d7e6ddb Jozsef Kadlecsik 2013-04-08  @894  	for (i =3D 0; i < n->pos=
; i++) {
18f84d41d34fa3 Jozsef Kadlecsik 2015-06-13   895  		if (!test_bit(i, n->use=
d)) {
18f84d41d34fa3 Jozsef Kadlecsik 2015-06-13   896  			/* Reuse first deleted=
 entry */
18f84d41d34fa3 Jozsef Kadlecsik 2015-06-13   897  			if (j =3D=3D -1) {
18f84d41d34fa3 Jozsef Kadlecsik 2015-06-13   898  				deleted =3D reuse =3D=
 true;
18f84d41d34fa3 Jozsef Kadlecsik 2015-06-13   899  				j =3D i;
18f84d41d34fa3 Jozsef Kadlecsik 2015-06-13   900  			}
18f84d41d34fa3 Jozsef Kadlecsik 2015-06-13   901  			continue;
18f84d41d34fa3 Jozsef Kadlecsik 2015-06-13   902  		}
ca134ce86451f3 Jozsef Kadlecsik 2013-09-07   903  		data =3D ahash_data(n, =
i, set->dsize);
1feab10d7e6ddb Jozsef Kadlecsik 2013-04-08   904  		if (mtype_data_equal(da=
ta, d, &multi)) {
f66ee0410b1c34 Jozsef Kadlecsik 2020-02-11   905  			if (flag_exist || SET_=
ELEM_EXPIRED(set, data)) {
1feab10d7e6ddb Jozsef Kadlecsik 2013-04-08   906  				/* Just the extension=
s could be overwritten */
1feab10d7e6ddb Jozsef Kadlecsik 2013-04-08   907  				j =3D i;
18f84d41d34fa3 Jozsef Kadlecsik 2015-06-13   908  				goto overwrite_extens=
ions;
1feab10d7e6ddb Jozsef Kadlecsik 2013-04-08   909  			}
f66ee0410b1c34 Jozsef Kadlecsik 2020-02-11   910  			ret =3D -IPSET_ERR_EXI=
ST;
f66ee0410b1c34 Jozsef Kadlecsik 2020-02-11   911  			goto unlock;
1feab10d7e6ddb Jozsef Kadlecsik 2013-04-08   912  		}
1feab10d7e6ddb Jozsef Kadlecsik 2013-04-08   913  		/* Reuse first timed ou=
t entry */
f66ee0410b1c34 Jozsef Kadlecsik 2020-02-11   914  		if (SET_ELEM_EXPIRED(se=
t, data) && j =3D=3D -1) {
1feab10d7e6ddb Jozsef Kadlecsik 2013-04-08   915  			j =3D i;
18f84d41d34fa3 Jozsef Kadlecsik 2015-06-13   916  			reuse =3D true;
1feab10d7e6ddb Jozsef Kadlecsik 2013-04-08   917  		}
86ac79c7bea154 Jozsef Kadlecsik 2014-11-30   918  	}
18f84d41d34fa3 Jozsef Kadlecsik 2015-06-13   919  	if (reuse || forceadd) {
8af1c6fbd92398 Jozsef Kadlecsik 2020-02-22   920  		if (j =3D=3D -1)
8af1c6fbd92398 Jozsef Kadlecsik 2020-02-22   921  			j =3D 0;
ca134ce86451f3 Jozsef Kadlecsik 2013-09-07   922  		data =3D ahash_data(n, =
j, set->dsize);
18f84d41d34fa3 Jozsef Kadlecsik 2015-06-13   923  		if (!deleted) {
1feab10d7e6ddb Jozsef Kadlecsik 2013-04-08   924  #ifdef IP_SET_HASH_WITH_N=
ETS
18f84d41d34fa3 Jozsef Kadlecsik 2015-06-13   925  			for (i =3D 0; i < IPSE=
T_NET_COUNT; i++)
f66ee0410b1c34 Jozsef Kadlecsik 2020-02-11   926  				mtype_del_cidr(set, h,
18f84d41d34fa3 Jozsef Kadlecsik 2015-06-13   927  					NCIDR_PUT(DCIDR_GET(=
data->cidr, i)),
cee8b97b6c13b1 Jozsef Kadlecsik 2016-11-10   928  					i);
1feab10d7e6ddb Jozsef Kadlecsik 2013-04-08   929  #endif
40cd63bf33b21e Jozsef Kadlecsik 2013-09-09   930  			ip_set_ext_destroy(set=
, data);
f66ee0410b1c34 Jozsef Kadlecsik 2020-02-11   931  			t->hregion[r].elements=
--;
18f84d41d34fa3 Jozsef Kadlecsik 2015-06-13   932  		}
18f84d41d34fa3 Jozsef Kadlecsik 2015-06-13   933  		goto copy_data;
18f84d41d34fa3 Jozsef Kadlecsik 2015-06-13   934  	}
f66ee0410b1c34 Jozsef Kadlecsik 2020-02-11   935  	if (elements >=3D maxele=
m)
18f84d41d34fa3 Jozsef Kadlecsik 2015-06-13   936  		goto set_full;
18f84d41d34fa3 Jozsef Kadlecsik 2015-06-13   937  	/* Create a new slot */
18f84d41d34fa3 Jozsef Kadlecsik 2015-06-13   938  	if (n->pos >=3D n->size)=
 {
ccf0a4b7fc6885 Jozsef Kadlecsik 2020-10-29   939  		TUNE_BUCKETSIZE(h, mult=
i);
18f84d41d34fa3 Jozsef Kadlecsik 2015-06-13   940  		if (n->size >=3D AHASH_=
MAX(h)) {
18f84d41d34fa3 Jozsef Kadlecsik 2015-06-13   941  			/* Trigger rehashing */
1feab10d7e6ddb Jozsef Kadlecsik 2013-04-08   942  			mtype_data_next(&h->ne=
xt, d);
f66ee0410b1c34 Jozsef Kadlecsik 2020-02-11   943  			ret =3D -EAGAIN;
f66ee0410b1c34 Jozsef Kadlecsik 2020-02-11   944  			goto resize;
1feab10d7e6ddb Jozsef Kadlecsik 2013-04-08   945  		}
18f84d41d34fa3 Jozsef Kadlecsik 2015-06-13   946  		old =3D n;
18f84d41d34fa3 Jozsef Kadlecsik 2015-06-13   947  		n =3D kzalloc(sizeof(*n=
) +
18f84d41d34fa3 Jozsef Kadlecsik 2015-06-13   948  			    (old->size + AHASH=
_INIT_SIZE) * set->dsize,
18f84d41d34fa3 Jozsef Kadlecsik 2015-06-13   949  			    GFP_ATOMIC);
f66ee0410b1c34 Jozsef Kadlecsik 2020-02-11   950  		if (!n) {
f66ee0410b1c34 Jozsef Kadlecsik 2020-02-11   951  			ret =3D -ENOMEM;
f66ee0410b1c34 Jozsef Kadlecsik 2020-02-11   952  			goto unlock;
f66ee0410b1c34 Jozsef Kadlecsik 2020-02-11   953  		}
18f84d41d34fa3 Jozsef Kadlecsik 2015-06-13   954  		memcpy(n, old, sizeof(s=
truct hbucket) +
18f84d41d34fa3 Jozsef Kadlecsik 2015-06-13   955  		       old->size * set-=
>dsize);
18f84d41d34fa3 Jozsef Kadlecsik 2015-06-13   956  		n->size =3D old->size +=
 AHASH_INIT_SIZE;
f66ee0410b1c34 Jozsef Kadlecsik 2020-02-11   957  		t->hregion[r].ext_size =
+=3D
f66ee0410b1c34 Jozsef Kadlecsik 2020-02-11   958  			ext_size(AHASH_INIT_SI=
ZE, set->dsize);
18f84d41d34fa3 Jozsef Kadlecsik 2015-06-13   959  	}
18f84d41d34fa3 Jozsef Kadlecsik 2015-06-13   960  =

18f84d41d34fa3 Jozsef Kadlecsik 2015-06-13   961  copy_elem:
18f84d41d34fa3 Jozsef Kadlecsik 2015-06-13   962  	j =3D n->pos++;
18f84d41d34fa3 Jozsef Kadlecsik 2015-06-13   963  	data =3D ahash_data(n, j=
, set->dsize);
18f84d41d34fa3 Jozsef Kadlecsik 2015-06-13   964  copy_data:
f66ee0410b1c34 Jozsef Kadlecsik 2020-02-11   965  	t->hregion[r].elements++;
1feab10d7e6ddb Jozsef Kadlecsik 2013-04-08   966  #ifdef IP_SET_HASH_WITH_N=
ETS
ea53ac5b630e81 Oliver Smith     2013-09-20   967  	for (i =3D 0; i < IPSET_=
NET_COUNT; i++)
f66ee0410b1c34 Jozsef Kadlecsik 2020-02-11   968  		mtype_add_cidr(set, h, =
NCIDR_PUT(DCIDR_GET(d->cidr, i)), i);
1feab10d7e6ddb Jozsef Kadlecsik 2013-04-08   969  #endif
1feab10d7e6ddb Jozsef Kadlecsik 2013-04-08   970  	memcpy(data, d, sizeof(s=
truct mtype_elem));
18f84d41d34fa3 Jozsef Kadlecsik 2015-06-13   971  overwrite_extensions:
1feab10d7e6ddb Jozsef Kadlecsik 2013-04-08   972  #ifdef IP_SET_HASH_WITH_N=
ETS
1feab10d7e6ddb Jozsef Kadlecsik 2013-04-08   973  	mtype_data_set_flags(dat=
a, flags);
1feab10d7e6ddb Jozsef Kadlecsik 2013-04-08   974  #endif
00d71b270eedac Jozsef Kadlecsik 2013-04-08   975  	if (SET_WITH_COUNTER(set=
))
ca134ce86451f3 Jozsef Kadlecsik 2013-09-07   976  		ip_set_init_counter(ext=
_counter(data, set), ext);
fda75c6d9e31a9 Oliver Smith     2013-09-22   977  	if (SET_WITH_COMMENT(set=
))
9e41f26a505cca Jozsef Kadlecsik 2016-11-10   978  		ip_set_init_comment(set=
, ext_comment(data, set), ext);
af331419d34e2f Anton Danilov    2014-08-28   979  	if (SET_WITH_SKBINFO(set=
))
af331419d34e2f Anton Danilov    2014-08-28   980  		ip_set_init_skbinfo(ext=
_skbinfo(data, set), ext);
18f84d41d34fa3 Jozsef Kadlecsik 2015-06-13   981  	/* Must come last for th=
e case when timed out entry is reused */
18f84d41d34fa3 Jozsef Kadlecsik 2015-06-13   982  	if (SET_WITH_TIMEOUT(set=
))
18f84d41d34fa3 Jozsef Kadlecsik 2015-06-13   983  		ip_set_timeout_set(ext_=
timeout(data, set), ext->timeout);
18f84d41d34fa3 Jozsef Kadlecsik 2015-06-13   984  	smp_mb__before_atomic();
18f84d41d34fa3 Jozsef Kadlecsik 2015-06-13   985  	set_bit(j, n->used);
18f84d41d34fa3 Jozsef Kadlecsik 2015-06-13   986  	if (old !=3D ERR_PTR(-EN=
OENT)) {
18f84d41d34fa3 Jozsef Kadlecsik 2015-06-13   987  		rcu_assign_pointer(hbuc=
ket(t, key), n);
18f84d41d34fa3 Jozsef Kadlecsik 2015-06-13   988  		if (old)
18f84d41d34fa3 Jozsef Kadlecsik 2015-06-13   989  			kfree_rcu(old, rcu);
18f84d41d34fa3 Jozsef Kadlecsik 2015-06-13   990  	}
f66ee0410b1c34 Jozsef Kadlecsik 2020-02-11   991  	ret =3D 0;
f66ee0410b1c34 Jozsef Kadlecsik 2020-02-11   992  resize:
f66ee0410b1c34 Jozsef Kadlecsik 2020-02-11   993  	spin_unlock_bh(&t->hregi=
on[r].lock);
f66ee0410b1c34 Jozsef Kadlecsik 2020-02-11   994  	if (atomic_read(&t->ref)=
 && ext->target) {
f66ee0410b1c34 Jozsef Kadlecsik 2020-02-11   995  		/* Resize is in process=
 and kernel side add, save values */
f66ee0410b1c34 Jozsef Kadlecsik 2020-02-11   996  		struct mtype_resize_ad =
*x;
f66ee0410b1c34 Jozsef Kadlecsik 2020-02-11   997  =

f66ee0410b1c34 Jozsef Kadlecsik 2020-02-11   998  		x =3D kzalloc(sizeof(st=
ruct mtype_resize_ad), GFP_ATOMIC);
f66ee0410b1c34 Jozsef Kadlecsik 2020-02-11   999  		if (!x)
f66ee0410b1c34 Jozsef Kadlecsik 2020-02-11  1000  			/* Don't bother */
f66ee0410b1c34 Jozsef Kadlecsik 2020-02-11  1001  			goto out;
f66ee0410b1c34 Jozsef Kadlecsik 2020-02-11  1002  		x->ad =3D IPSET_ADD;
f66ee0410b1c34 Jozsef Kadlecsik 2020-02-11  1003  		memcpy(&x->d, value, si=
zeof(struct mtype_elem));
f66ee0410b1c34 Jozsef Kadlecsik 2020-02-11  1004  		memcpy(&x->ext, ext, si=
zeof(struct ip_set_ext));
f66ee0410b1c34 Jozsef Kadlecsik 2020-02-11  1005  		memcpy(&x->mext, mext, =
sizeof(struct ip_set_ext));
f66ee0410b1c34 Jozsef Kadlecsik 2020-02-11  1006  		x->flags =3D flags;
f66ee0410b1c34 Jozsef Kadlecsik 2020-02-11  1007  		spin_lock_bh(&set->lock=
);
f66ee0410b1c34 Jozsef Kadlecsik 2020-02-11  1008  		list_add_tail(&x->list,=
 &h->ad);
f66ee0410b1c34 Jozsef Kadlecsik 2020-02-11  1009  		spin_unlock_bh(&set->lo=
ck);
f66ee0410b1c34 Jozsef Kadlecsik 2020-02-11  1010  	}
f66ee0410b1c34 Jozsef Kadlecsik 2020-02-11  1011  	goto out;
1feab10d7e6ddb Jozsef Kadlecsik 2013-04-08  1012  =

18f84d41d34fa3 Jozsef Kadlecsik 2015-06-13  1013  set_full:
18f84d41d34fa3 Jozsef Kadlecsik 2015-06-13  1014  	if (net_ratelimit())
18f84d41d34fa3 Jozsef Kadlecsik 2015-06-13  1015  		pr_warn("Set %s is full=
, maxelem %u reached\n",
f66ee0410b1c34 Jozsef Kadlecsik 2020-02-11  1016  			set->name, maxelem);
f66ee0410b1c34 Jozsef Kadlecsik 2020-02-11  1017  	ret =3D -IPSET_ERR_HASH_=
FULL;
f66ee0410b1c34 Jozsef Kadlecsik 2020-02-11  1018  unlock:
f66ee0410b1c34 Jozsef Kadlecsik 2020-02-11  1019  	spin_unlock_bh(&t->hregi=
on[r].lock);
f66ee0410b1c34 Jozsef Kadlecsik 2020-02-11  1020  out:
f66ee0410b1c34 Jozsef Kadlecsik 2020-02-11  1021  	if (atomic_dec_and_test(=
&t->uref) && atomic_read(&t->ref)) {
f66ee0410b1c34 Jozsef Kadlecsik 2020-02-11  1022  		pr_debug("Table destroy=
 after resize by add: %p\n", t);
f66ee0410b1c34 Jozsef Kadlecsik 2020-02-11  1023  		mtype_ahash_destroy(set=
, t, false);
f66ee0410b1c34 Jozsef Kadlecsik 2020-02-11  1024  	}
f66ee0410b1c34 Jozsef Kadlecsik 2020-02-11  1025  	return ret;
1feab10d7e6ddb Jozsef Kadlecsik 2013-04-08  1026  }
1feab10d7e6ddb Jozsef Kadlecsik 2013-04-08  1027  =


:::::: The code at line 894 was first introduced by commit
:::::: 1feab10d7e6ddb5e13d6a4bd93a1b877390262ec netfilter: ipset: Unified h=
ash type generation

:::::: TO: Jozsef Kadlecsik <kadlec@blackhole.kfki.hu>
:::::: CC: Pablo Neira Ayuso <pablo@netfilter.org>

-- =

0-DAY CI Kernel Test Service
https://01.org/lkp
--===============4971344279593020732==--

