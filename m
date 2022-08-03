Content-Type: multipart/mixed; boundary="===============5710172337758380011=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: drivers/thunderbolt/ctl.c:165:22: warning: Uninitialized variables: iter.kref, iter.ctl, iter.request, iter.request_size, iter.request_type, iter.response, iter.response_size, iter.response_type, iter.npackets, iter.match, iter.copy, iter.callback, iter.c...
Date: Wed, 03 Aug 2022 17:18:20 +0800
Message-ID: <202208031703.OQVTqNpN-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============5710172337758380011==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

:::::: =

:::::: Manual check reason: "low confidence static check warning: drivers/t=
hunderbolt/ctl.c:165:22: warning: Uninitialized variables: iter.kref, iter.=
ctl, iter.request, iter.request_size, iter.request_type, iter.response, ite=
r.response_size, iter.response_type, iter.npackets, iter.match, iter.copy, =
iter.callback, iter.callback_data, iter.flags, iter.work, iter.result, iter=
.list [uninitvar]"
:::::: =


CC: kbuild-all(a)lists.01.org
BCC: lkp(a)intel.com
CC: linux-kernel(a)vger.kernel.org
TO: Jakob Koschel <jakobkoschel@gmail.com>
CC: Mika Westerberg <mika.westerberg@linux.intel.com>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git =
master
head:   e2b542100719a93f8cdf6d90185410d38a57a4c1
commit: 03941ed91c7231e4973fb50de6c349974405df4e thunderbolt: Replace usage=
 of found with dedicated list iterator variable
date:   4 months ago
:::::: branch date: 6 hours ago
:::::: commit date: 4 months ago
compiler: powerpc-linux-gcc (GCC) 12.1.0
reproduce (cppcheck warning):
        # apt-get install cppcheck
        git checkout 03941ed91c7231e4973fb50de6c349974405df4e
        cppcheck --quiet --enable=3Dstyle,performance,portability --templat=
e=3Dgcc FILE

If you fix the issue, kindly add following tag where applicable
Reported-by: kernel test robot <lkp@intel.com>


cppcheck possible warnings: (new ones prefixed by >>, may not real problems)

>> drivers/thunderbolt/ctl.c:165:22: warning: Uninitialized variables: iter=
.kref, iter.ctl, iter.request, iter.request_size, iter.request_type, iter.r=
esponse, iter.response_size, iter.response_type, iter.npackets, iter.match,=
 iter.copy, iter.callback, iter.callback_data, iter.flags, iter.work, iter.=
result, iter.list [uninitvar]
     tb_cfg_request_get(iter);
                        ^

vim +165 drivers/thunderbolt/ctl.c

d7f781bfdbf4eb Mika Westerberg 2017-06-06  157  =

d7f781bfdbf4eb Mika Westerberg 2017-06-06  158  static struct tb_cfg_reques=
t *
d7f781bfdbf4eb Mika Westerberg 2017-06-06  159  tb_cfg_request_find(struct =
tb_ctl *ctl, struct ctl_pkg *pkg)
d7f781bfdbf4eb Mika Westerberg 2017-06-06  160  {
03941ed91c7231 Jakob Koschel   2022-03-24  161  	struct tb_cfg_request *req=
 =3D NULL, *iter;
d7f781bfdbf4eb Mika Westerberg 2017-06-06  162  =

d7f781bfdbf4eb Mika Westerberg 2017-06-06  163  	mutex_lock(&pkg->ctl->requ=
est_queue_lock);
03941ed91c7231 Jakob Koschel   2022-03-24  164  	list_for_each_entry(iter, =
&pkg->ctl->request_queue, list) {
03941ed91c7231 Jakob Koschel   2022-03-24 @165  		tb_cfg_request_get(iter);
03941ed91c7231 Jakob Koschel   2022-03-24  166  		if (iter->match(iter, pkg=
)) {
03941ed91c7231 Jakob Koschel   2022-03-24  167  			req =3D iter;
d7f781bfdbf4eb Mika Westerberg 2017-06-06  168  			break;
d7f781bfdbf4eb Mika Westerberg 2017-06-06  169  		}
03941ed91c7231 Jakob Koschel   2022-03-24  170  		tb_cfg_request_put(iter);
d7f781bfdbf4eb Mika Westerberg 2017-06-06  171  	}
d7f781bfdbf4eb Mika Westerberg 2017-06-06  172  	mutex_unlock(&pkg->ctl->re=
quest_queue_lock);
d7f781bfdbf4eb Mika Westerberg 2017-06-06  173  =

03941ed91c7231 Jakob Koschel   2022-03-24  174  	return req;
d7f781bfdbf4eb Mika Westerberg 2017-06-06  175  }
d7f781bfdbf4eb Mika Westerberg 2017-06-06  176  =


-- =

0-DAY CI Kernel Test Service
https://01.org/lkp
--===============5710172337758380011==--

