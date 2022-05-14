Content-Type: multipart/mixed; boundary="===============0532676138142029817=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: drivers/base/memory.c:1057:32: warning: Parameter 'excluded' can be declared with const [constParameter]
Date: Sat, 14 May 2022 12:30:26 +0800
Message-ID: <202205141215.FnGYrwHN-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============0532676138142029817==
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
head:   ec7f49619d8ee13e108740c82f942cd401b989e9
commit: 3fcebf90209a7f52d384ad7701425aa91be309ab mm/memory_hotplug: improve=
d dynamic memory group aware "auto-movable" online policy
date:   8 months ago
:::::: branch date: 5 hours ago
:::::: commit date: 8 months ago
compiler: s390-linux-gcc (GCC) 11.3.0
reproduce (cppcheck warning):
        # apt-get install cppcheck
        git checkout 3fcebf90209a7f52d384ad7701425aa91be309ab
        cppcheck --quiet --enable=3Dstyle,performance,portability --templat=
e=3Dgcc FILE

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>


cppcheck possible warnings: (new ones prefixed by >>, may not real problems)

>> drivers/base/memory.c:1057:32: warning: Parameter 'excluded' can be decl=
ared with const [constParameter]
             struct memory_group *excluded, void *arg)
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
--===============0532676138142029817==--

