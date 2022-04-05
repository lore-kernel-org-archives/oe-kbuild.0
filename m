Content-Type: multipart/mixed; boundary="===============1212965460945672146=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: [linux-next:master 1332/1999] drivers/thunderbolt/ctl.c:165:22: warning: Uninitialized variables: iter.kref, iter.ctl, iter.request, iter.request_size, iter.request_type, iter.response, iter.response_size, iter.response_type, iter.npackets, iter.match, iter.copy, iter.callback, iter.c...
Date: Wed, 06 Apr 2022 00:29:23 +0800
Message-ID: <202204060044.SCy5DFmz-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============1212965460945672146==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

CC: kbuild-all(a)lists.01.org
BCC: lkp(a)intel.com
CC: Linux Memory Management List <linux-mm@kvack.org>
TO: Jakob Koschel <jakobkoschel@gmail.com>
CC: Mika Westerberg <mika.westerberg@linux.intel.com>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git=
 master
head:   3ccc916812598a88b427859679ffd1641e67d4a2
commit: 03941ed91c7231e4973fb50de6c349974405df4e [1332/1999] thunderbolt: R=
eplace usage of found with dedicated list iterator variable
:::::: branch date: 11 hours ago
:::::: commit date: 31 hours ago
compiler: sparc-linux-gcc (GCC) 11.2.0

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>


cppcheck warnings: (new ones prefixed by >>)
>> drivers/thunderbolt/debugfs.c:674:18: warning: Local variable 'debugfs_d=
ir' shadows outer variable [shadowVariable]
     struct dentry *debugfs_dir;
                    ^
   drivers/thunderbolt/debugfs.c:665:17: note: Shadowed declaration
    struct dentry *debugfs_dir;
                   ^
   drivers/thunderbolt/debugfs.c:674:18: note: Shadow variable
     struct dentry *debugfs_dir;
                    ^

cppcheck possible warnings: (new ones prefixed by >>, may not real problems)

>> drivers/thunderbolt/tb.h:604:6: warning: Null pointer dereference: sw [c=
tunullpointer]
    if (sw->is_unplugged)
        ^
   drivers/thunderbolt/debugfs.c:377:10: note: Calling function cap_show, 2=
nd argument is null
    cap_show(s, NULL, port, cap, header.basic.cap, vsec_id, length);
            ^
   drivers/thunderbolt/debugfs.c:291:10: note: Calling function tb_sw_read,=
 1st argument is null
      ret =3D tb_sw_read(sw, data, TB_CFG_SWITCH, cap + offset, dwords);
            ^
   drivers/thunderbolt/tb.h:604:6: note: Dereferencing argument sw that is =
null
    if (sw->is_unplugged)
        ^
--
>> drivers/thunderbolt/ctl.c:165:22: warning: Uninitialized variables: iter=
.kref, iter.ctl, iter.request, iter.request_size, iter.request_type, iter.r=
esponse, iter.response_size, iter.response_type, iter.npackets, iter.match,=
 iter.copy, iter.callback, iter.callback_data, iter.flags, iter.work, iter.=
result, iter.list [uninitvar]
     tb_cfg_request_get(iter);
                        ^
--
>> drivers/tty/tty_buffer.c:133:2: warning: There is an unknown macro here =
somewhere. Configuration is required. If llist_for_each_entry_safe is a mac=
ro then please configure it. [unknownMacro]
    llist_for_each_entry_safe(p, next, llist, free)
    ^
--
>> drivers/tty/vt/selection.c:90:32: warning: Parameter 'vc' can be declare=
d with const [constParameter]
   bool vc_is_sel(struct vc_data *vc)
                                  ^
--
>> drivers/tty/tty_io.c:545:61: warning: Parameter 'tty' can be declared wi=
th const [constParameter]
   static struct file *tty_release_redirect(struct tty_struct *tty)
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
--===============1212965460945672146==--

