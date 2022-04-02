Content-Type: multipart/mixed; boundary="===============9047258714200781967=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: drivers/base/memory.c:1057:32: warning: Parameter 'excluded' can be declared with const [constParameter]
Date: Sun, 03 Apr 2022 05:17:25 +0800
Message-ID: <202204030532.SMZyX0Om-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============9047258714200781967==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

CC: kbuild-all(a)lists.01.org
BCC: lkp(a)intel.com
CC: linux-kernel(a)vger.kernel.org
TO: David Hildenbrand <david@redhat.com>
CC: Andrew Morton <akpm@linux-foundation.org>
CC: Linux Memory Management List <linux-mm@kvack.org>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git =
master
head:   6f34f8c3d6178527d4c02aa3a53c370cc70cb91e
commit: 3fcebf90209a7f52d384ad7701425aa91be309ab mm/memory_hotplug: improve=
d dynamic memory group aware "auto-movable" online policy
date:   7 months ago
:::::: branch date: 3 hours ago
:::::: commit date: 7 months ago
compiler: s390-linux-gcc (GCC) 11.2.0

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>


cppcheck possible warnings: (new ones prefixed by >>, may not real problems)

>> drivers/base/memory.c:1057:32: warning: Parameter 'excluded' can be decl=
ared with const [constParameter]
             struct memory_group *excluded, void *arg)
                                  ^
--
>> drivers/bus/mhi/core/pm.c:748:4: warning: Uninitialized variable: itr->s=
tate [uninitvar]
      TO_DEV_STATE_TRANS_STR(itr->state));
      ^

vim +/excluded +1057 drivers/base/memory.c

3fcebf90209a7f David Hildenbrand 2021-09-07  1050  =

3fcebf90209a7f David Hildenbrand 2021-09-07  1051  /*
3fcebf90209a7f David Hildenbrand 2021-09-07  1052   * This is an internal h=
elper only to be used in core memory hotplug code to
3fcebf90209a7f David Hildenbrand 2021-09-07  1053   * walk all dynamic memo=
ry groups excluding a given memory group, either
3fcebf90209a7f David Hildenbrand 2021-09-07  1054   * belonging to a specif=
ic node, or belonging to any node.
3fcebf90209a7f David Hildenbrand 2021-09-07  1055   */
3fcebf90209a7f David Hildenbrand 2021-09-07  1056  int walk_dynamic_memory_=
groups(int nid, walk_memory_groups_func_t func,
3fcebf90209a7f David Hildenbrand 2021-09-07 @1057  			       struct memory_=
group *excluded, void *arg)

-- =

0-DAY CI Kernel Test Service
https://01.org/lkp
--===============9047258714200781967==--

