Content-Type: multipart/mixed; boundary="===============6645457960294988370=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: [allisonhenderson-xfs-work:delayed_attrs_v26_extended 24/30] fs/xfs/xfs_inode.c:3343:3: warning: Value stored to 'error' is never read [clang-analyzer-deadcode.DeadStores]
Date: Sat, 29 Jan 2022 08:59:05 +0800
Message-ID: <202201290820.kIiDeJ9X-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============6645457960294988370==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

CC: llvm(a)lists.linux.dev
CC: kbuild-all(a)lists.01.org
CC: linux-kernel(a)vger.kernel.org
TO: Allison Henderson <allison.henderson@oracle.com>

tree:   https://github.com/allisonhenderson/xfs_work.git delayed_attrs_v26_=
extended
head:   19459f5cfa422b0a6a9cd3898892e43ecb49f8f3
commit: b519cd5b0b0155455c70512f3574660899d3a72f [24/30] xfs: Add parent po=
inters to rename
:::::: branch date: 5 days ago
:::::: commit date: 5 days ago
config: x86_64-randconfig-c007-20220124 (https://download.01.org/0day-ci/ar=
chive/20220129/202201290820.kIiDeJ9X-lkp(a)intel.com/config)
compiler: clang version 14.0.0 (https://github.com/llvm/llvm-project 33b45e=
e44b1f32ffdbc995e6fec806271b4b3ba4)
reproduce (this is a W=3D1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/=
make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://github.com/allisonhenderson/xfs_work/commit/b519cd5b0b015=
5455c70512f3574660899d3a72f
        git remote add allisonhenderson-xfs-work https://github.com/allison=
henderson/xfs_work.git
        git fetch --no-tags allisonhenderson-xfs-work delayed_attrs_v26_ext=
ended
        git checkout b519cd5b0b0155455c70512f3574660899d3a72f
        # save the config file to linux build tree
        COMPILER_INSTALL_PATH=3D$HOME/0day COMPILER=3Dclang make.cross ARCH=
=3Dx86_64 clang-analyzer =


If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>


clang-analyzer warnings: (new ones prefixed by >>)
   rx_timer, =

   port, =

   magic, =

   port_count, =

   adapter_num, =

   port_num, =

   line, =

   timeout, =

   x_char, =

   read_status_mask, =

   ignore_status_mask, =

   gpio_present, =

   pending_bh, =

   isr_overflow, =

   bus_type, =

   irq_level, =

   phys_reg_addr, =

   idle_mode, =

   max_frame_size, =

   rbuf_fill_level, =

   rx_pio, =

   if_mode, =

   base_clock, =

   xsync, =

   xctrl, =

   init_error, =

   tx_count, =

   dcd_chkcount, =

   cts_chkcount, =

   dsr_chkcount, =

   ri_chkcount, =

   rbuf_count, =

   rbuf_current, =

   rbuf_index, =

   rbuf_fill_index, =

   tbuf_count, =

   tbuf_current, =

   tbuf_start, =

   tmp_rbuf_count, =

   netcount, =

   input_signal_events, =

   icount, =

   rbuf_fill_count, =

   bh_requested, =

   bh_running, =

   irq_requested, =

   irq_occurred, =

   reg_addr_requested, =

   rx_enabled, =

   rx_restart, =

   tx_enabled, =

   tx_active, =

   signals, =

   drop_rts_on_tx_done, =

   device_name, =

   consider reordering the fields or adding explicit padding members [clang=
-analyzer-optin.performance.Padding]
   struct slgt_info {
   ~~~~~~~^~~~~~~~~~~
   drivers/tty/synclink_gt.c:212:8: note: Excessive padding in 'struct slgt=
_info' (46 padding bytes, where 6 is optimal). Optimal fields order: if_ptr=
, next_device, pdev, gpio_wait_q, irq_flags, reg_addr, tx_buf, flag_buf, bu=
fs, bufs_dma_addr, rbufs, tbufs, tmp_rbuf, port_array, params, lock, netloc=
k, task, status_event_wait_q, event_wait_q, tx_timer, rx_timer, port, magic=
, port_count, adapter_num, port_num, line, timeout, x_char, read_status_mas=
k, ignore_status_mask, gpio_present, pending_bh, isr_overflow, bus_type, ir=
q_level, phys_reg_addr, idle_mode, max_frame_size, rbuf_fill_level, rx_pio,=
 if_mode, base_clock, xsync, xctrl, init_error, tx_count, dcd_chkcount, cts=
_chkcount, dsr_chkcount, ri_chkcount, rbuf_count, rbuf_current, rbuf_index,=
 rbuf_fill_index, tbuf_count, tbuf_current, tbuf_start, tmp_rbuf_count, net=
count, input_signal_events, icount, rbuf_fill_count, bh_requested, bh_runni=
ng, irq_requested, irq_occurred, reg_addr_requested, rx_enabled, rx_restart=
, tx_enabled, tx_active, signals, drop_rts_on_tx_done, device_name, conside=
r reordering the fields or adding explicit padding members
   struct slgt_info {
   ~~~~~~~^~~~~~~~~~~
   drivers/tty/synclink_gt.c:1190:3: warning: Call to function 'strcat' is =
insecure as it does not provide bounding of the memory buffer. Replace unbo=
unded copy functions with analogous functions that support length arguments=
 such as 'strlcat'. CWE-119 [clang-analyzer-security.insecureAPI.strcpy]
                   strcat(stat_buf, "|RTS");
                   ^~~~~~
   drivers/tty/synclink_gt.c:1190:3: note: Call to function 'strcat' is ins=
ecure as it does not provide bounding of the memory buffer. Replace unbound=
ed copy functions with analogous functions that support length arguments su=
ch as 'strlcat'. CWE-119
                   strcat(stat_buf, "|RTS");
                   ^~~~~~
   drivers/tty/synclink_gt.c:1192:3: warning: Call to function 'strcat' is =
insecure as it does not provide bounding of the memory buffer. Replace unbo=
unded copy functions with analogous functions that support length arguments=
 such as 'strlcat'. CWE-119 [clang-analyzer-security.insecureAPI.strcpy]
                   strcat(stat_buf, "|CTS");
                   ^~~~~~
   drivers/tty/synclink_gt.c:1192:3: note: Call to function 'strcat' is ins=
ecure as it does not provide bounding of the memory buffer. Replace unbound=
ed copy functions with analogous functions that support length arguments su=
ch as 'strlcat'. CWE-119
                   strcat(stat_buf, "|CTS");
                   ^~~~~~
   drivers/tty/synclink_gt.c:1194:3: warning: Call to function 'strcat' is =
insecure as it does not provide bounding of the memory buffer. Replace unbo=
unded copy functions with analogous functions that support length arguments=
 such as 'strlcat'. CWE-119 [clang-analyzer-security.insecureAPI.strcpy]
                   strcat(stat_buf, "|DTR");
                   ^~~~~~
   drivers/tty/synclink_gt.c:1194:3: note: Call to function 'strcat' is ins=
ecure as it does not provide bounding of the memory buffer. Replace unbound=
ed copy functions with analogous functions that support length arguments su=
ch as 'strlcat'. CWE-119
                   strcat(stat_buf, "|DTR");
                   ^~~~~~
   drivers/tty/synclink_gt.c:1196:3: warning: Call to function 'strcat' is =
insecure as it does not provide bounding of the memory buffer. Replace unbo=
unded copy functions with analogous functions that support length arguments=
 such as 'strlcat'. CWE-119 [clang-analyzer-security.insecureAPI.strcpy]
                   strcat(stat_buf, "|DSR");
                   ^~~~~~
   drivers/tty/synclink_gt.c:1196:3: note: Call to function 'strcat' is ins=
ecure as it does not provide bounding of the memory buffer. Replace unbound=
ed copy functions with analogous functions that support length arguments su=
ch as 'strlcat'. CWE-119
                   strcat(stat_buf, "|DSR");
                   ^~~~~~
   drivers/tty/synclink_gt.c:1198:3: warning: Call to function 'strcat' is =
insecure as it does not provide bounding of the memory buffer. Replace unbo=
unded copy functions with analogous functions that support length arguments=
 such as 'strlcat'. CWE-119 [clang-analyzer-security.insecureAPI.strcpy]
                   strcat(stat_buf, "|CD");
                   ^~~~~~
   drivers/tty/synclink_gt.c:1198:3: note: Call to function 'strcat' is ins=
ecure as it does not provide bounding of the memory buffer. Replace unbound=
ed copy functions with analogous functions that support length arguments su=
ch as 'strlcat'. CWE-119
                   strcat(stat_buf, "|CD");
                   ^~~~~~
   drivers/tty/synclink_gt.c:1200:3: warning: Call to function 'strcat' is =
insecure as it does not provide bounding of the memory buffer. Replace unbo=
unded copy functions with analogous functions that support length arguments=
 such as 'strlcat'. CWE-119 [clang-analyzer-security.insecureAPI.strcpy]
                   strcat(stat_buf, "|RI");
                   ^~~~~~
   drivers/tty/synclink_gt.c:1200:3: note: Call to function 'strcat' is ins=
ecure as it does not provide bounding of the memory buffer. Replace unbound=
ed copy functions with analogous functions that support length arguments su=
ch as 'strlcat'. CWE-119
                   strcat(stat_buf, "|RI");
                   ^~~~~~
   Suppressed 1 warnings (1 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   3 warnings generated.
>> fs/xfs/xfs_inode.c:3343:3: warning: Value stored to 'error' is never rea=
d [clang-analyzer-deadcode.DeadStores]
                   error =3D xfs_cross_rename(tp, src_dp, src_name, src_ip,
                   ^       ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   fs/xfs/xfs_inode.c:3343:3: note: Value stored to 'error' is never read
                   error =3D xfs_cross_rename(tp, src_dp, src_name, src_ip,
                   ^       ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   Suppressed 2 warnings (2 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   2 warnings generated.
   Suppressed 2 warnings (2 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   2 warnings generated.
   Suppressed 2 warnings (2 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   2 warnings generated.
   Suppressed 2 warnings (2 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   2 warnings generated.
   Suppressed 2 warnings (2 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   2 warnings generated.
   Suppressed 2 warnings (2 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   2 warnings generated.
   Suppressed 2 warnings (2 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   2 warnings generated.
   drivers/input/rmi4/rmi_f11.c:1129:2: warning: Value stored to 'query_off=
set' is never read [clang-analyzer-deadcode.DeadStores]
           query_offset +=3D rc;
           ^               ~~
   drivers/input/rmi4/rmi_f11.c:1129:2: note: Value stored to 'query_offset=
' is never read
           query_offset +=3D rc;
           ^               ~~
   Suppressed 1 warnings (1 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   4 warnings generated.
   drivers/input/rmi4/rmi_f12.c:133:3: warning: Value stored to 'offset' is=
 never read [clang-analyzer-deadcode.DeadStores]
                   offset +=3D 1;
                   ^         ~
   drivers/input/rmi4/rmi_f12.c:133:3: note: Value stored to 'offset' is ne=
ver read
                   offset +=3D 1;
                   ^         ~
   drivers/input/rmi4/rmi_f12.c:401:2: warning: Value stored to 'query_addr=
' is never read [clang-analyzer-deadcode.DeadStores]
           query_addr +=3D 3;
           ^             ~
   drivers/input/rmi4/rmi_f12.c:401:2: note: Value stored to 'query_addr' i=
s never read
           query_addr +=3D 3;
           ^             ~
   drivers/input/rmi4/rmi_f12.c:520:3: warning: Value stored to 'data_offse=
t' is never read [clang-analyzer-deadcode.DeadStores]
                   data_offset +=3D item->reg_size;
                   ^              ~~~~~~~~~~~~~~
   drivers/input/rmi4/rmi_f12.c:520:3: note: Value stored to 'data_offset' =
is never read
                   data_offset +=3D item->reg_size;
                   ^              ~~~~~~~~~~~~~~
   Suppressed 1 warnings (1 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   1 warning generated.
   Suppressed 1 warnings (1 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   1 warning generated.
   Suppressed 1 warnings (1 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   2 warnings generated.
   drivers/char/ipmi/ipmi_si_intf.c:126:8: warning: Excessive padding in 's=
truct smi_info' (32 padding bytes, where 0 is optimal). =

   Optimal fields order: =

   intf, =

   si_sm, =

   handlers, =

   waiting_msg, =

   curr_msg, =

   oem_data_avail_handler, =

   last_timeout_jiffies, =

   thread, =

   link, =

   si_lock, =

   si_timer, =

   io, =

   si_num, =

   si_state, =

   req_events, =

   need_watch, =

   device_id, =

   stats, =

   msg_flags, =

   has_event_buffer, =

   run_to_completion, =

   timer_can_start, =

   timer_running, =

   interrupt_disabled, =

   supports_event_msg_buff, =

   cannot_disable_irq, =

   irq_enable_broken, =

   in_maintenance_mode, =

   got_attn, =

   dev_group_added, =

   consider reordering the fields or adding explicit padding members [clang=
-analyzer-optin.performance.Padding]
   struct smi_info {
   ~~~~~~~^~~~~~~~~~
   drivers/char/ipmi/ipmi_si_intf.c:126:8: note: Excessive padding in 'stru=
ct smi_info' (32 padding bytes, where 0 is optimal). Optimal fields order: =
intf, si_sm, handlers, waiting_msg, curr_msg, oem_data_avail_handler, last_=
timeout_jiffies, thread, link, si_lock, si_timer, io, si_num, si_state, req=
_events, need_watch, device_id, stats, msg_flags, has_event_buffer, run_to_=
completion, timer_can_start, timer_running, interrupt_disabled, supports_ev=
ent_msg_buff, cannot_disable_irq, irq_enable_broken, in_maintenance_mode, g=
ot_attn, dev_group_added, consider reordering the fields or adding explicit=
 padding members
   struct smi_info {
   ~~~~~~~^~~~~~~~~~

vim +/error +3343 fs/xfs/xfs_inode.c

7dcf5c3e4527cfa Dave Chinner      2015-03-25  3212  =

f6bba2017afb3bd Dave Chinner      2013-08-12  3213  /*
f6bba2017afb3bd Dave Chinner      2013-08-12  3214   * xfs_rename
f6bba2017afb3bd Dave Chinner      2013-08-12  3215   */
f6bba2017afb3bd Dave Chinner      2013-08-12  3216  int
f6bba2017afb3bd Dave Chinner      2013-08-12  3217  xfs_rename(
f736d93d76d3e97 Christoph Hellwig 2021-01-21  3218  	struct user_namespace	=
	*mnt_userns,
7dcf5c3e4527cfa Dave Chinner      2015-03-25  3219  	struct xfs_inode		*src=
_dp,
f6bba2017afb3bd Dave Chinner      2013-08-12  3220  	struct xfs_name			*src=
_name,
7dcf5c3e4527cfa Dave Chinner      2015-03-25  3221  	struct xfs_inode		*src=
_ip,
7dcf5c3e4527cfa Dave Chinner      2015-03-25  3222  	struct xfs_inode		*tar=
get_dp,
f6bba2017afb3bd Dave Chinner      2013-08-12  3223  	struct xfs_name			*tar=
get_name,
7dcf5c3e4527cfa Dave Chinner      2015-03-25  3224  	struct xfs_inode		*tar=
get_ip,
d31a1825450062b Carlos Maiolino   2014-12-24  3225  	unsigned int			flags)
f6bba2017afb3bd Dave Chinner      2013-08-12  3226  {
7dcf5c3e4527cfa Dave Chinner      2015-03-25  3227  	struct xfs_mount		*mp =
=3D src_dp->i_mount;
7dcf5c3e4527cfa Dave Chinner      2015-03-25  3228  	struct xfs_trans		*tp;
7dcf5c3e4527cfa Dave Chinner      2015-03-25  3229  	struct xfs_inode		*wip=
 =3D NULL;		/* whiteout inode */
7dcf5c3e4527cfa Dave Chinner      2015-03-25  3230  	struct xfs_inode		*ino=
des[__XFS_SORT_INODES];
6da1b4b1ab36d80 Darrick J. Wong   2021-01-22  3231  	int				i;
95afcf5c7bca93f Dave Chinner      2015-03-25  3232  	int				num_inodes =3D =
__XFS_SORT_INODES;
2b93681f593577d Dave Chinner      2015-03-25  3233  	bool				new_parent =3D=
 (src_dp !=3D target_dp);
c19b3b05ae440de Dave Chinner      2016-02-09  3234  	bool				src_is_directo=
ry =3D S_ISDIR(VFS_I(src_ip)->i_mode);
f6bba2017afb3bd Dave Chinner      2013-08-12  3235  	int				spaceres;
7dcf5c3e4527cfa Dave Chinner      2015-03-25  3236  	int				error;
b519cd5b0b01554 Allison Henderson 2021-03-24  3237  	struct xfs_parent_name=
_rec	new_rec;
b519cd5b0b01554 Allison Henderson 2021-03-24  3238  	struct xfs_parent_name=
_rec	old_rec;
b519cd5b0b01554 Allison Henderson 2021-03-24  3239  	xfs_dir2_dataptr_t		ne=
w_diroffset;
b519cd5b0b01554 Allison Henderson 2021-03-24  3240  	xfs_dir2_dataptr_t		ol=
d_diroffset;
b519cd5b0b01554 Allison Henderson 2021-03-24  3241  	struct xfs_da_args		ne=
w_args =3D {
b519cd5b0b01554 Allison Henderson 2021-03-24  3242  		.dp		=3D src_ip,
b519cd5b0b01554 Allison Henderson 2021-03-24  3243  		.geo		=3D mp->m_attr_=
geo,
b519cd5b0b01554 Allison Henderson 2021-03-24  3244  		.whichfork	=3D XFS_AT=
TR_FORK,
b519cd5b0b01554 Allison Henderson 2021-03-24  3245  		.attr_filter	=3D XFS_=
ATTR_PARENT,
b519cd5b0b01554 Allison Henderson 2021-03-24  3246  		.op_flags	=3D XFS_DA_=
OP_OKNOENT,
b519cd5b0b01554 Allison Henderson 2021-03-24  3247  		.name		=3D (const uin=
t8_t *)&new_rec,
b519cd5b0b01554 Allison Henderson 2021-03-24  3248  		.namelen	=3D sizeof(n=
ew_rec),
b519cd5b0b01554 Allison Henderson 2021-03-24  3249  		.value		=3D (void *)t=
arget_name->name,
b519cd5b0b01554 Allison Henderson 2021-03-24  3250  		.valuelen	=3D target_=
name->len,
b519cd5b0b01554 Allison Henderson 2021-03-24  3251  	};
b519cd5b0b01554 Allison Henderson 2021-03-24  3252  	struct xfs_da_args		ol=
d_args =3D {
b519cd5b0b01554 Allison Henderson 2021-03-24  3253  		.dp		=3D src_ip,
b519cd5b0b01554 Allison Henderson 2021-03-24  3254  		.geo		=3D mp->m_attr_=
geo,
b519cd5b0b01554 Allison Henderson 2021-03-24  3255  		.whichfork	=3D XFS_AT=
TR_FORK,
b519cd5b0b01554 Allison Henderson 2021-03-24  3256  		.attr_filter	=3D XFS_=
ATTR_PARENT,
b519cd5b0b01554 Allison Henderson 2021-03-24  3257  		.op_flags	=3D XFS_DA_=
OP_OKNOENT,
b519cd5b0b01554 Allison Henderson 2021-03-24  3258  		.name		=3D (const uin=
t8_t *)&old_rec,
b519cd5b0b01554 Allison Henderson 2021-03-24  3259  		.namelen	=3D sizeof(o=
ld_rec),
b519cd5b0b01554 Allison Henderson 2021-03-24  3260  		.value		=3D NULL,
b519cd5b0b01554 Allison Henderson 2021-03-24  3261  		.valuelen	=3D 0,
b519cd5b0b01554 Allison Henderson 2021-03-24  3262  	};
f6bba2017afb3bd Dave Chinner      2013-08-12  3263  =

f6bba2017afb3bd Dave Chinner      2013-08-12  3264  	trace_xfs_rename(src_d=
p, target_dp, src_name, target_name);
f6bba2017afb3bd Dave Chinner      2013-08-12  3265  =

eeacd3217b8fa81 Dave Chinner      2015-03-25  3266  	if ((flags & RENAME_EX=
CHANGE) && !target_ip)
eeacd3217b8fa81 Dave Chinner      2015-03-25  3267  		return -EINVAL;
eeacd3217b8fa81 Dave Chinner      2015-03-25  3268  =

7dcf5c3e4527cfa Dave Chinner      2015-03-25  3269  	/*
7dcf5c3e4527cfa Dave Chinner      2015-03-25  3270  	 * If we are doing a w=
hiteout operation, allocate the whiteout inode
7dcf5c3e4527cfa Dave Chinner      2015-03-25  3271  	 * we will be placing =
at the target and ensure the type is set
7dcf5c3e4527cfa Dave Chinner      2015-03-25  3272  	 * appropriately.
7dcf5c3e4527cfa Dave Chinner      2015-03-25  3273  	 */
7dcf5c3e4527cfa Dave Chinner      2015-03-25  3274  	if (flags & RENAME_WHI=
TEOUT) {
f736d93d76d3e97 Christoph Hellwig 2021-01-21  3275  		error =3D xfs_rename_=
alloc_whiteout(mnt_userns, target_dp, &wip);
7dcf5c3e4527cfa Dave Chinner      2015-03-25  3276  		if (error)
7dcf5c3e4527cfa Dave Chinner      2015-03-25  3277  			return error;
f6bba2017afb3bd Dave Chinner      2013-08-12  3278  =

7dcf5c3e4527cfa Dave Chinner      2015-03-25  3279  		/* setup target diren=
t info as whiteout */
7dcf5c3e4527cfa Dave Chinner      2015-03-25  3280  		src_name->type =3D XF=
S_DIR3_FT_CHRDEV;
7dcf5c3e4527cfa Dave Chinner      2015-03-25  3281  	}
f6bba2017afb3bd Dave Chinner      2013-08-12  3282  =

7dcf5c3e4527cfa Dave Chinner      2015-03-25  3283  	xfs_sort_for_rename(sr=
c_dp, target_dp, src_ip, target_ip, wip,
f6bba2017afb3bd Dave Chinner      2013-08-12  3284  				inodes, &num_inodes=
);
b519cd5b0b01554 Allison Henderson 2021-03-24  3285  	if (xfs_has_larp(mp)) {
b519cd5b0b01554 Allison Henderson 2021-03-24  3286  		error =3D xfs_attr_us=
e_log_assist(mp);
b519cd5b0b01554 Allison Henderson 2021-03-24  3287  		if (error)
b519cd5b0b01554 Allison Henderson 2021-03-24  3288  			goto out_release_wip;
b519cd5b0b01554 Allison Henderson 2021-03-24  3289  	}
f6bba2017afb3bd Dave Chinner      2013-08-12  3290  =

f6bba2017afb3bd Dave Chinner      2013-08-12  3291  	spaceres =3D XFS_RENAM=
E_SPACE_RES(mp, target_name->len);
253f4911f297b83 Christoph Hellwig 2016-04-06  3292  	error =3D xfs_trans_al=
loc(mp, &M_RES(mp)->tr_rename, spaceres, 0, 0, &tp);
2451337dd043901 Dave Chinner      2014-06-25  3293  	if (error =3D=3D -ENOS=
PC) {
f6bba2017afb3bd Dave Chinner      2013-08-12  3294  		spaceres =3D 0;
253f4911f297b83 Christoph Hellwig 2016-04-06  3295  		error =3D xfs_trans_a=
lloc(mp, &M_RES(mp)->tr_rename, 0, 0, 0,
253f4911f297b83 Christoph Hellwig 2016-04-06  3296  				&tp);
f6bba2017afb3bd Dave Chinner      2013-08-12  3297  	}
445883e8133975f Dave Chinner      2015-03-25  3298  	if (error)
b519cd5b0b01554 Allison Henderson 2021-03-24  3299  		goto drop_incompat;
f6bba2017afb3bd Dave Chinner      2013-08-12  3300  =

f6bba2017afb3bd Dave Chinner      2013-08-12  3301  	/*
f6bba2017afb3bd Dave Chinner      2013-08-12  3302  	 * Attach the dquots t=
o the inodes
f6bba2017afb3bd Dave Chinner      2013-08-12  3303  	 */
f6bba2017afb3bd Dave Chinner      2013-08-12  3304  	error =3D xfs_qm_vop_r=
ename_dqattach(inodes);
445883e8133975f Dave Chinner      2015-03-25  3305  	if (error)
445883e8133975f Dave Chinner      2015-03-25  3306  		goto out_trans_cancel;
f6bba2017afb3bd Dave Chinner      2013-08-12  3307  =

f6bba2017afb3bd Dave Chinner      2013-08-12  3308  	/*
f6bba2017afb3bd Dave Chinner      2013-08-12  3309  	 * Lock all the partic=
ipating inodes. Depending upon whether
f6bba2017afb3bd Dave Chinner      2013-08-12  3310  	 * the target_name exi=
sts in the target directory, and
f6bba2017afb3bd Dave Chinner      2013-08-12  3311  	 * whether the target =
directory is the same as the source
f6bba2017afb3bd Dave Chinner      2013-08-12  3312  	 * directory, we can l=
ock from 2 to 4 inodes.
f6bba2017afb3bd Dave Chinner      2013-08-12  3313  	 */
f6bba2017afb3bd Dave Chinner      2013-08-12  3314  	xfs_lock_inodes(inodes=
, num_inodes, XFS_ILOCK_EXCL);
f6bba2017afb3bd Dave Chinner      2013-08-12  3315  =

f6bba2017afb3bd Dave Chinner      2013-08-12  3316  	/*
f6bba2017afb3bd Dave Chinner      2013-08-12  3317  	 * Join all the inodes=
 to the transaction. From this point on,
f6bba2017afb3bd Dave Chinner      2013-08-12  3318  	 * we can rely on eith=
er trans_commit or trans_cancel to unlock
f6bba2017afb3bd Dave Chinner      2013-08-12  3319  	 * them.
f6bba2017afb3bd Dave Chinner      2013-08-12  3320  	 */
b519cd5b0b01554 Allison Henderson 2021-03-24  3321  	xfs_trans_ijoin(tp, sr=
c_dp, 0);
f6bba2017afb3bd Dave Chinner      2013-08-12  3322  	if (new_parent)
b519cd5b0b01554 Allison Henderson 2021-03-24  3323  		xfs_trans_ijoin(tp, t=
arget_dp, 0);
b519cd5b0b01554 Allison Henderson 2021-03-24  3324  	xfs_trans_ijoin(tp, sr=
c_ip, 0);
f6bba2017afb3bd Dave Chinner      2013-08-12  3325  	if (target_ip)
b519cd5b0b01554 Allison Henderson 2021-03-24  3326  		xfs_trans_ijoin(tp, t=
arget_ip, 0);
7dcf5c3e4527cfa Dave Chinner      2015-03-25  3327  	if (wip)
b519cd5b0b01554 Allison Henderson 2021-03-24  3328  		xfs_trans_ijoin(tp, w=
ip, 0);
f6bba2017afb3bd Dave Chinner      2013-08-12  3329  =

f6bba2017afb3bd Dave Chinner      2013-08-12  3330  	/*
f6bba2017afb3bd Dave Chinner      2013-08-12  3331  	 * If we are using pro=
ject inheritance, we only allow renames
f6bba2017afb3bd Dave Chinner      2013-08-12  3332  	 * into our tree when =
the project IDs are the same; else the
f6bba2017afb3bd Dave Chinner      2013-08-12  3333  	 * tree quota mechanis=
m would be circumvented.
f6bba2017afb3bd Dave Chinner      2013-08-12  3334  	 */
db07349da2f5647 Christoph Hellwig 2021-03-29  3335  	if (unlikely((target_d=
p->i_diflags & XFS_DIFLAG_PROJINHERIT) &&
ceaf603c7024d3c Christoph Hellwig 2021-03-29  3336  		     target_dp->i_pro=
jid !=3D src_ip->i_projid)) {
2451337dd043901 Dave Chinner      2014-06-25  3337  		error =3D -EXDEV;
b519cd5b0b01554 Allison Henderson 2021-03-24  3338  		goto out_unlock;
f6bba2017afb3bd Dave Chinner      2013-08-12  3339  	}
f6bba2017afb3bd Dave Chinner      2013-08-12  3340  =

eeacd3217b8fa81 Dave Chinner      2015-03-25  3341  	/* RENAME_EXCHANGE is =
unique from here on. */
b519cd5b0b01554 Allison Henderson 2021-03-24  3342  	if (flags & RENAME_EXC=
HANGE) {
b519cd5b0b01554 Allison Henderson 2021-03-24 @3343  		error =3D xfs_cross_r=
ename(tp, src_dp, src_name, src_ip,
d31a1825450062b Carlos Maiolino   2014-12-24  3344  					target_dp, target_=
name, target_ip,
f16dea54b789aad Brian Foster      2018-07-11  3345  					spaceres);
b519cd5b0b01554 Allison Henderson 2021-03-24  3346  		goto out_pptr;
b519cd5b0b01554 Allison Henderson 2021-03-24  3347  	}
f6bba2017afb3bd Dave Chinner      2013-08-12  3348  	/*
bc56ad8c74b8588 kaixuxia          2019-09-03  3349  	 * Check for expected =
errors before we dirty the transaction
bc56ad8c74b8588 kaixuxia          2019-09-03  3350  	 * so we can return an=
 error without a transaction abort.
02092a2f034fdea Chandan Babu R    2021-01-22  3351  	 *
02092a2f034fdea Chandan Babu R    2021-01-22  3352  	 * Extent count overfl=
ow check:
02092a2f034fdea Chandan Babu R    2021-01-22  3353  	 *
02092a2f034fdea Chandan Babu R    2021-01-22  3354  	 * From the perspectiv=
e of src_dp, a rename operation is essentially a
02092a2f034fdea Chandan Babu R    2021-01-22  3355  	 * directory entry rem=
ove operation. Hence the only place where we check
02092a2f034fdea Chandan Babu R    2021-01-22  3356  	 * for extent count ov=
erflow for src_dp is in
02092a2f034fdea Chandan Babu R    2021-01-22  3357  	 * xfs_bmap_del_extent=
_real(). xfs_bmap_del_extent_real() returns
02092a2f034fdea Chandan Babu R    2021-01-22  3358  	 * -ENOSPC when it det=
ects a possible extent count overflow and in
02092a2f034fdea Chandan Babu R    2021-01-22  3359  	 * response, the highe=
r layers of directory handling code do the
02092a2f034fdea Chandan Babu R    2021-01-22  3360  	 * following:
02092a2f034fdea Chandan Babu R    2021-01-22  3361  	 * 1. Data/Free blocks=
: XFS lets these blocks linger until a
02092a2f034fdea Chandan Babu R    2021-01-22  3362  	 *    future remove op=
eration removes them.
02092a2f034fdea Chandan Babu R    2021-01-22  3363  	 * 2. Dabtree blocks: =
XFS swaps the blocks with the last block in the
02092a2f034fdea Chandan Babu R    2021-01-22  3364  	 *    Leaf space and u=
nmaps the last block.
02092a2f034fdea Chandan Babu R    2021-01-22  3365  	 *
02092a2f034fdea Chandan Babu R    2021-01-22  3366  	 * For target_dp, ther=
e are two cases depending on whether the
02092a2f034fdea Chandan Babu R    2021-01-22  3367  	 * destination directo=
ry entry exists or not.
02092a2f034fdea Chandan Babu R    2021-01-22  3368  	 *
02092a2f034fdea Chandan Babu R    2021-01-22  3369  	 * When destination di=
rectory entry does not exist (i.e. target_ip =3D=3D
02092a2f034fdea Chandan Babu R    2021-01-22  3370  	 * NULL), extent count=
 overflow check is performed only when transaction
02092a2f034fdea Chandan Babu R    2021-01-22  3371  	 * has a non-zero size=
d space reservation associated with it.  With a
02092a2f034fdea Chandan Babu R    2021-01-22  3372  	 * zero-sized space re=
servation, XFS allows a rename operation to
02092a2f034fdea Chandan Babu R    2021-01-22  3373  	 * continue only when =
the directory has sufficient free space in its
02092a2f034fdea Chandan Babu R    2021-01-22  3374  	 * data/leaf/free spac=
e blocks to hold the new entry.
02092a2f034fdea Chandan Babu R    2021-01-22  3375  	 *
02092a2f034fdea Chandan Babu R    2021-01-22  3376  	 * When destination di=
rectory entry exists (i.e. target_ip !=3D NULL), all
02092a2f034fdea Chandan Babu R    2021-01-22  3377  	 * we need to do is ch=
ange the inode number associated with the already
02092a2f034fdea Chandan Babu R    2021-01-22  3378  	 * existing entry. Hen=
ce there is no need to perform an extent count
02092a2f034fdea Chandan Babu R    2021-01-22  3379  	 * overflow check.
f6bba2017afb3bd Dave Chinner      2013-08-12  3380  	 */
f6bba2017afb3bd Dave Chinner      2013-08-12  3381  	if (target_ip =3D=3D N=
ULL) {
f6bba2017afb3bd Dave Chinner      2013-08-12  3382  		/*
f6bba2017afb3bd Dave Chinner      2013-08-12  3383  		 * If there's no spac=
e reservation, check the entry will
f6bba2017afb3bd Dave Chinner      2013-08-12  3384  		 * fit before actuall=
y inserting it.
f6bba2017afb3bd Dave Chinner      2013-08-12  3385  		 */
94f3cad555d6604 Eric Sandeen      2014-09-09  3386  		if (!spaceres) {
94f3cad555d6604 Eric Sandeen      2014-09-09  3387  			error =3D xfs_dir_ca=
nenter(tp, target_dp, target_name);
f6bba2017afb3bd Dave Chinner      2013-08-12  3388  			if (error)
b519cd5b0b01554 Allison Henderson 2021-03-24  3389  				goto out_unlock;
02092a2f034fdea Chandan Babu R    2021-01-22  3390  		} else {
02092a2f034fdea Chandan Babu R    2021-01-22  3391  			error =3D xfs_iext_c=
ount_may_overflow(target_dp,
02092a2f034fdea Chandan Babu R    2021-01-22  3392  					XFS_DATA_FORK,
02092a2f034fdea Chandan Babu R    2021-01-22  3393  					XFS_IEXT_DIR_MANIP=
_CNT(mp));
02092a2f034fdea Chandan Babu R    2021-01-22  3394  			if (error)
02092a2f034fdea Chandan Babu R    2021-01-22  3395  				goto out_trans_canc=
el;
94f3cad555d6604 Eric Sandeen      2014-09-09  3396  		}
bc56ad8c74b8588 kaixuxia          2019-09-03  3397  	} else {
bc56ad8c74b8588 kaixuxia          2019-09-03  3398  		/*
bc56ad8c74b8588 kaixuxia          2019-09-03  3399  		 * If target exists a=
nd it's a directory, check that whether
bc56ad8c74b8588 kaixuxia          2019-09-03  3400  		 * it can be destroye=
d.
bc56ad8c74b8588 kaixuxia          2019-09-03  3401  		 */
bc56ad8c74b8588 kaixuxia          2019-09-03  3402  		if (S_ISDIR(VFS_I(tar=
get_ip)->i_mode) &&
bc56ad8c74b8588 kaixuxia          2019-09-03  3403  		    (!xfs_dir_isempty=
(target_ip) ||
bc56ad8c74b8588 kaixuxia          2019-09-03  3404  		     (VFS_I(target_ip=
)->i_nlink > 2))) {
bc56ad8c74b8588 kaixuxia          2019-09-03  3405  			error =3D -EEXIST;
bc56ad8c74b8588 kaixuxia          2019-09-03  3406  			goto out_trans_cance=
l;
bc56ad8c74b8588 kaixuxia          2019-09-03  3407  		}
bc56ad8c74b8588 kaixuxia          2019-09-03  3408  	}
bc56ad8c74b8588 kaixuxia          2019-09-03  3409  =

6da1b4b1ab36d80 Darrick J. Wong   2021-01-22  3410  	/*
6da1b4b1ab36d80 Darrick J. Wong   2021-01-22  3411  	 * Lock the AGI buffer=
s we need to handle bumping the nlink of the
6da1b4b1ab36d80 Darrick J. Wong   2021-01-22  3412  	 * whiteout inode off =
the unlinked list and to handle dropping the
6da1b4b1ab36d80 Darrick J. Wong   2021-01-22  3413  	 * nlink of the target=
 inode.  Per locking order rules, do this in
6da1b4b1ab36d80 Darrick J. Wong   2021-01-22  3414  	 * increasing AG order=
 and before directory block allocation tries to
6da1b4b1ab36d80 Darrick J. Wong   2021-01-22  3415  	 * grab AGFs because w=
e grab AGIs before AGFs.
6da1b4b1ab36d80 Darrick J. Wong   2021-01-22  3416  	 *
6da1b4b1ab36d80 Darrick J. Wong   2021-01-22  3417  	 * The (vfs) caller mu=
st ensure that if src is a directory then
6da1b4b1ab36d80 Darrick J. Wong   2021-01-22  3418  	 * target_ip is either=
 null or an empty directory.
6da1b4b1ab36d80 Darrick J. Wong   2021-01-22  3419  	 */
6da1b4b1ab36d80 Darrick J. Wong   2021-01-22  3420  	for (i =3D 0; i < num_=
inodes && inodes[i] !=3D NULL; i++) {
6da1b4b1ab36d80 Darrick J. Wong   2021-01-22  3421  		if (inodes[i] =3D=3D =
wip ||
6da1b4b1ab36d80 Darrick J. Wong   2021-01-22  3422  		    (inodes[i] =3D=3D=
 target_ip &&
6da1b4b1ab36d80 Darrick J. Wong   2021-01-22  3423  		     (VFS_I(target_ip=
)->i_nlink =3D=3D 1 || src_is_directory))) {
6da1b4b1ab36d80 Darrick J. Wong   2021-01-22  3424  			struct xfs_buf	*bp;
6da1b4b1ab36d80 Darrick J. Wong   2021-01-22  3425  			xfs_agnumber_t	agno;
6da1b4b1ab36d80 Darrick J. Wong   2021-01-22  3426  =

6da1b4b1ab36d80 Darrick J. Wong   2021-01-22  3427  			agno =3D XFS_INO_TO_=
AGNO(mp, inodes[i]->i_ino);
6da1b4b1ab36d80 Darrick J. Wong   2021-01-22  3428  			error =3D xfs_read_a=
gi(mp, tp, agno, &bp);
6da1b4b1ab36d80 Darrick J. Wong   2021-01-22  3429  			if (error)
6da1b4b1ab36d80 Darrick J. Wong   2021-01-22  3430  				goto out_trans_canc=
el;
6da1b4b1ab36d80 Darrick J. Wong   2021-01-22  3431  		}
6da1b4b1ab36d80 Darrick J. Wong   2021-01-22  3432  	}
6da1b4b1ab36d80 Darrick J. Wong   2021-01-22  3433  =

bc56ad8c74b8588 kaixuxia          2019-09-03  3434  	/*
bc56ad8c74b8588 kaixuxia          2019-09-03  3435  	 * Directory entry cre=
ation below may acquire the AGF. Remove
bc56ad8c74b8588 kaixuxia          2019-09-03  3436  	 * the whiteout from t=
he unlinked list first to preserve correct
bc56ad8c74b8588 kaixuxia          2019-09-03  3437  	 * AGI/AGF locking ord=
er. This dirties the transaction so failures
bc56ad8c74b8588 kaixuxia          2019-09-03  3438  	 * after this point wi=
ll abort and log recovery will clean up the
bc56ad8c74b8588 kaixuxia          2019-09-03  3439  	 * mess.
bc56ad8c74b8588 kaixuxia          2019-09-03  3440  	 *
bc56ad8c74b8588 kaixuxia          2019-09-03  3441  	 * For whiteouts, we n=
eed to bump the link count on the whiteout
bc56ad8c74b8588 kaixuxia          2019-09-03  3442  	 * inode. After this p=
oint, we have a real link, clear the tmpfile
bc56ad8c74b8588 kaixuxia          2019-09-03  3443  	 * state flag from the=
 inode so it doesn't accidentally get misused
bc56ad8c74b8588 kaixuxia          2019-09-03  3444  	 * in future.
bc56ad8c74b8588 kaixuxia          2019-09-03  3445  	 */
bc56ad8c74b8588 kaixuxia          2019-09-03  3446  	if (wip) {
f40aadb2bb64fe0 Dave Chinner      2021-06-02  3447  		struct xfs_perag	*pag;
f40aadb2bb64fe0 Dave Chinner      2021-06-02  3448  =

bc56ad8c74b8588 kaixuxia          2019-09-03  3449  		ASSERT(VFS_I(wip)->i_=
nlink =3D=3D 0);
f40aadb2bb64fe0 Dave Chinner      2021-06-02  3450  =

f40aadb2bb64fe0 Dave Chinner      2021-06-02  3451  		pag =3D xfs_perag_get=
(mp, XFS_INO_TO_AGNO(mp, wip->i_ino));
f40aadb2bb64fe0 Dave Chinner      2021-06-02  3452  		error =3D xfs_iunlink=
_remove(tp, pag, wip);
f40aadb2bb64fe0 Dave Chinner      2021-06-02  3453  		xfs_perag_put(pag);
bc56ad8c74b8588 kaixuxia          2019-09-03  3454  		if (error)
bc56ad8c74b8588 kaixuxia          2019-09-03  3455  			goto out_trans_cance=
l;
bc56ad8c74b8588 kaixuxia          2019-09-03  3456  =

bc56ad8c74b8588 kaixuxia          2019-09-03  3457  		xfs_bumplink(tp, wip);
bc56ad8c74b8588 kaixuxia          2019-09-03  3458  		VFS_I(wip)->i_state &=
=3D ~I_LINKABLE;
bc56ad8c74b8588 kaixuxia          2019-09-03  3459  	}
bc56ad8c74b8588 kaixuxia          2019-09-03  3460  =

bc56ad8c74b8588 kaixuxia          2019-09-03  3461  	/*
bc56ad8c74b8588 kaixuxia          2019-09-03  3462  	 * Set up the target.
bc56ad8c74b8588 kaixuxia          2019-09-03  3463  	 */
bc56ad8c74b8588 kaixuxia          2019-09-03  3464  	if (target_ip =3D=3D N=
ULL) {
f6bba2017afb3bd Dave Chinner      2013-08-12  3465  		/*
f6bba2017afb3bd Dave Chinner      2013-08-12  3466  		 * If target does not=
 exist and the rename crosses
f6bba2017afb3bd Dave Chinner      2013-08-12  3467  		 * directories, adjus=
t the target directory link count
f6bba2017afb3bd Dave Chinner      2013-08-12  3468  		 * to account for the=
 ".." reference from the new entry.
f6bba2017afb3bd Dave Chinner      2013-08-12  3469  		 */
f6bba2017afb3bd Dave Chinner      2013-08-12  3470  		error =3D xfs_dir_cre=
atename(tp, target_dp, target_name,
b519cd5b0b01554 Allison Henderson 2021-03-24  3471  					   src_ip->i_ino, =
spaceres, &new_diroffset);
f6bba2017afb3bd Dave Chinner      2013-08-12  3472  		if (error)
c8eac49ef798a7d Brian Foster      2018-07-24  3473  			goto out_trans_cance=
l;
f6bba2017afb3bd Dave Chinner      2013-08-12  3474  =

f6bba2017afb3bd Dave Chinner      2013-08-12  3475  		xfs_trans_ichgtime(tp=
, target_dp,
f6bba2017afb3bd Dave Chinner      2013-08-12  3476  					XFS_ICHGTIME_MOD |=
 XFS_ICHGTIME_CHG);
f6bba2017afb3bd Dave Chinner      2013-08-12  3477  =

f6bba2017afb3bd Dave Chinner      2013-08-12  3478  		if (new_parent && src=
_is_directory) {
910832697cf8553 Eric Sandeen      2019-05-01  3479  			xfs_bumplink(tp, tar=
get_dp);
f6bba2017afb3bd Dave Chinner      2013-08-12  3480  		}
f6bba2017afb3bd Dave Chinner      2013-08-12  3481  	} else { /* target_ip =
!=3D NULL */
f6bba2017afb3bd Dave Chinner      2013-08-12  3482  		/*
f6bba2017afb3bd Dave Chinner      2013-08-12  3483  		 * Link the source in=
ode under the target name.
f6bba2017afb3bd Dave Chinner      2013-08-12  3484  		 * If the source inod=
e is a directory and we are moving
f6bba2017afb3bd Dave Chinner      2013-08-12  3485  		 * it across director=
ies, its ".." entry will be
f6bba2017afb3bd Dave Chinner      2013-08-12  3486  		 * inconsistent until=
 we replace that down below.
f6bba2017afb3bd Dave Chinner      2013-08-12  3487  		 *
f6bba2017afb3bd Dave Chinner      2013-08-12  3488  		 * In case there is a=
lready an entry with the same
f6bba2017afb3bd Dave Chinner      2013-08-12  3489  		 * name at the destin=
ation directory, remove it first.
f6bba2017afb3bd Dave Chinner      2013-08-12  3490  		 */
f6bba2017afb3bd Dave Chinner      2013-08-12  3491  		error =3D xfs_dir_rep=
lace(tp, target_dp, target_name,
b519cd5b0b01554 Allison Henderson 2021-03-24  3492  					src_ip->i_ino, spa=
ceres, &new_diroffset);
f6bba2017afb3bd Dave Chinner      2013-08-12  3493  		if (error)
c8eac49ef798a7d Brian Foster      2018-07-24  3494  			goto out_trans_cance=
l;
f6bba2017afb3bd Dave Chinner      2013-08-12  3495  =

f6bba2017afb3bd Dave Chinner      2013-08-12  3496  		xfs_trans_ichgtime(tp=
, target_dp,
f6bba2017afb3bd Dave Chinner      2013-08-12  3497  					XFS_ICHGTIME_MOD |=
 XFS_ICHGTIME_CHG);
f6bba2017afb3bd Dave Chinner      2013-08-12  3498  =

f6bba2017afb3bd Dave Chinner      2013-08-12  3499  		/*
f6bba2017afb3bd Dave Chinner      2013-08-12  3500  		 * Decrement the link=
 count on the target since the target
f6bba2017afb3bd Dave Chinner      2013-08-12  3501  		 * dir no longer poin=
ts to it.
f6bba2017afb3bd Dave Chinner      2013-08-12  3502  		 */
f6bba2017afb3bd Dave Chinner      2013-08-12  3503  		error =3D xfs_droplin=
k(tp, target_ip);
f6bba2017afb3bd Dave Chinner      2013-08-12  3504  		if (error)
c8eac49ef798a7d Brian Foster      2018-07-24  3505  			goto out_trans_cance=
l;
f6bba2017afb3bd Dave Chinner      2013-08-12  3506  =

f6bba2017afb3bd Dave Chinner      2013-08-12  3507  		if (src_is_directory)=
 {
f6bba2017afb3bd Dave Chinner      2013-08-12  3508  			/*
f6bba2017afb3bd Dave Chinner      2013-08-12  3509  			 * Drop the link fro=
m the old "." entry.
f6bba2017afb3bd Dave Chinner      2013-08-12  3510  			 */
f6bba2017afb3bd Dave Chinner      2013-08-12  3511  			error =3D xfs_dropli=
nk(tp, target_ip);
f6bba2017afb3bd Dave Chinner      2013-08-12  3512  			if (error)
c8eac49ef798a7d Brian Foster      2018-07-24  3513  				goto out_trans_canc=
el;
f6bba2017afb3bd Dave Chinner      2013-08-12  3514  		}
f6bba2017afb3bd Dave Chinner      2013-08-12  3515  	} /* target_ip !=3D NU=
LL */
f6bba2017afb3bd Dave Chinner      2013-08-12  3516  =

f6bba2017afb3bd Dave Chinner      2013-08-12  3517  	/*
f6bba2017afb3bd Dave Chinner      2013-08-12  3518  	 * Remove the source.
f6bba2017afb3bd Dave Chinner      2013-08-12  3519  	 */
f6bba2017afb3bd Dave Chinner      2013-08-12  3520  	if (new_parent && src_=
is_directory) {
f6bba2017afb3bd Dave Chinner      2013-08-12  3521  		/*
f6bba2017afb3bd Dave Chinner      2013-08-12  3522  		 * Rewrite the ".." e=
ntry to point to the new
f6bba2017afb3bd Dave Chinner      2013-08-12  3523  		 * directory.
f6bba2017afb3bd Dave Chinner      2013-08-12  3524  		 */
f6bba2017afb3bd Dave Chinner      2013-08-12  3525  		error =3D xfs_dir_rep=
lace(tp, src_ip, &xfs_name_dotdot,
b519cd5b0b01554 Allison Henderson 2021-03-24  3526  					target_dp->i_ino, =
spaceres, &new_diroffset);
2451337dd043901 Dave Chinner      2014-06-25  3527  		ASSERT(error !=3D -EE=
XIST);
f6bba2017afb3bd Dave Chinner      2013-08-12  3528  		if (error)
c8eac49ef798a7d Brian Foster      2018-07-24  3529  			goto out_trans_cance=
l;
f6bba2017afb3bd Dave Chinner      2013-08-12  3530  	}
f6bba2017afb3bd Dave Chinner      2013-08-12  3531  =

f6bba2017afb3bd Dave Chinner      2013-08-12  3532  	/*
f6bba2017afb3bd Dave Chinner      2013-08-12  3533  	 * We always want to h=
it the ctime on the source inode.
f6bba2017afb3bd Dave Chinner      2013-08-12  3534  	 *
f6bba2017afb3bd Dave Chinner      2013-08-12  3535  	 * This isn't strictly=
 required by the standards since the source
f6bba2017afb3bd Dave Chinner      2013-08-12  3536  	 * inode isn't really =
being changed, but old unix file systems did
f6bba2017afb3bd Dave Chinner      2013-08-12  3537  	 * it and some increme=
ntal backup programs won't work without it.
f6bba2017afb3bd Dave Chinner      2013-08-12  3538  	 */
f6bba2017afb3bd Dave Chinner      2013-08-12  3539  	xfs_trans_ichgtime(tp,=
 src_ip, XFS_ICHGTIME_CHG);
f6bba2017afb3bd Dave Chinner      2013-08-12  3540  	xfs_trans_log_inode(tp=
, src_ip, XFS_ILOG_CORE);
f6bba2017afb3bd Dave Chinner      2013-08-12  3541  =

f6bba2017afb3bd Dave Chinner      2013-08-12  3542  	/*
f6bba2017afb3bd Dave Chinner      2013-08-12  3543  	 * Adjust the link cou=
nt on src_dp.  This is necessary when
f6bba2017afb3bd Dave Chinner      2013-08-12  3544  	 * renaming a director=
y, either within one parent when
f6bba2017afb3bd Dave Chinner      2013-08-12  3545  	 * the target existed,=
 or across two parent directories.
f6bba2017afb3bd Dave Chinner      2013-08-12  3546  	 */
f6bba2017afb3bd Dave Chinner      2013-08-12  3547  	if (src_is_directory &=
& (new_parent || target_ip !=3D NULL)) {
f6bba2017afb3bd Dave Chinner      2013-08-12  3548  =

f6bba2017afb3bd Dave Chinner      2013-08-12  3549  		/*
f6bba2017afb3bd Dave Chinner      2013-08-12  3550  		 * Decrement link cou=
nt on src_directory since the
f6bba2017afb3bd Dave Chinner      2013-08-12  3551  		 * entry that's moved=
 no longer points to it.
f6bba2017afb3bd Dave Chinner      2013-08-12  3552  		 */
f6bba2017afb3bd Dave Chinner      2013-08-12  3553  		error =3D xfs_droplin=
k(tp, src_dp);
f6bba2017afb3bd Dave Chinner      2013-08-12  3554  		if (error)
c8eac49ef798a7d Brian Foster      2018-07-24  3555  			goto out_trans_cance=
l;
f6bba2017afb3bd Dave Chinner      2013-08-12  3556  	}
f6bba2017afb3bd Dave Chinner      2013-08-12  3557  =

7dcf5c3e4527cfa Dave Chinner      2015-03-25  3558  	/*
7dcf5c3e4527cfa Dave Chinner      2015-03-25  3559  	 * For whiteouts, we o=
nly need to update the source dirent with the
7dcf5c3e4527cfa Dave Chinner      2015-03-25  3560  	 * inode number of the=
 whiteout inode rather than removing it
7dcf5c3e4527cfa Dave Chinner      2015-03-25  3561  	 * altogether.
7dcf5c3e4527cfa Dave Chinner      2015-03-25  3562  	 */
7dcf5c3e4527cfa Dave Chinner      2015-03-25  3563  	if (wip) {
7dcf5c3e4527cfa Dave Chinner      2015-03-25  3564  		error =3D xfs_dir_rep=
lace(tp, src_dp, src_name, wip->i_ino,
b519cd5b0b01554 Allison Henderson 2021-03-24  3565  					spaceres, &old_dir=
offset);
02092a2f034fdea Chandan Babu R    2021-01-22  3566  	} else {
02092a2f034fdea Chandan Babu R    2021-01-22  3567  		/*
02092a2f034fdea Chandan Babu R    2021-01-22  3568  		 * NOTE: We don't nee=
d to check for extent count overflow here
02092a2f034fdea Chandan Babu R    2021-01-22  3569  		 * because the dir re=
move name code will leave the dir block in
02092a2f034fdea Chandan Babu R    2021-01-22  3570  		 * place if the exten=
t count would overflow.
02092a2f034fdea Chandan Babu R    2021-01-22  3571  		 */
f6bba2017afb3bd Dave Chinner      2013-08-12  3572  		error =3D xfs_dir_rem=
ovename(tp, src_dp, src_name, src_ip->i_ino,
b519cd5b0b01554 Allison Henderson 2021-03-24  3573  					   spaceres, &old_=
diroffset);
02092a2f034fdea Chandan Babu R    2021-01-22  3574  	}
02092a2f034fdea Chandan Babu R    2021-01-22  3575  =

f6bba2017afb3bd Dave Chinner      2013-08-12  3576  	if (error)
c8eac49ef798a7d Brian Foster      2018-07-24  3577  		goto out_trans_cancel;
f6bba2017afb3bd Dave Chinner      2013-08-12  3578  =

b519cd5b0b01554 Allison Henderson 2021-03-24  3579  out_pptr:
b519cd5b0b01554 Allison Henderson 2021-03-24  3580  	if (xfs_sb_version_has=
parent(&mp->m_sb)) {
b519cd5b0b01554 Allison Henderson 2021-03-24  3581  		new_args.trans	=3D tp;
b519cd5b0b01554 Allison Henderson 2021-03-24  3582  		xfs_init_parent_name_=
rec(&new_rec, target_dp, new_diroffset);
b519cd5b0b01554 Allison Henderson 2021-03-24  3583  		new_args.hashval =3D =
xfs_da_hashname(new_args.name,
b519cd5b0b01554 Allison Henderson 2021-03-24  3584  						   new_args.namel=
en);
b519cd5b0b01554 Allison Henderson 2021-03-24  3585  		error =3D  xfs_attr_s=
et_deferred(&new_args);
b519cd5b0b01554 Allison Henderson 2021-03-24  3586  		if (error)
b519cd5b0b01554 Allison Henderson 2021-03-24  3587  			goto out_trans_cance=
l;
b519cd5b0b01554 Allison Henderson 2021-03-24  3588  =

b519cd5b0b01554 Allison Henderson 2021-03-24  3589  		old_args.trans	=3D tp;
b519cd5b0b01554 Allison Henderson 2021-03-24  3590  		xfs_init_parent_name_=
rec(&old_rec, src_dp, old_diroffset);
b519cd5b0b01554 Allison Henderson 2021-03-24  3591  		old_args.hashval =3D =
xfs_da_hashname(old_args.name,
b519cd5b0b01554 Allison Henderson 2021-03-24  3592  						   old_args.namel=
en);
b519cd5b0b01554 Allison Henderson 2021-03-24  3593  		error =3D xfs_attr_re=
move_deferred(&old_args);
b519cd5b0b01554 Allison Henderson 2021-03-24  3594  		if (error)
b519cd5b0b01554 Allison Henderson 2021-03-24  3595  			goto out_trans_cance=
l;
b519cd5b0b01554 Allison Henderson 2021-03-24  3596  	}
b519cd5b0b01554 Allison Henderson 2021-03-24  3597  =

f6bba2017afb3bd Dave Chinner      2013-08-12  3598  	xfs_trans_ichgtime(tp,=
 src_dp, XFS_ICHGTIME_MOD | XFS_ICHGTIME_CHG);
f6bba2017afb3bd Dave Chinner      2013-08-12  3599  	xfs_trans_log_inode(tp=
, src_dp, XFS_ILOG_CORE);
f6bba2017afb3bd Dave Chinner      2013-08-12  3600  	if (new_parent)
f6bba2017afb3bd Dave Chinner      2013-08-12  3601  		xfs_trans_log_inode(t=
p, target_dp, XFS_ILOG_CORE);
f6bba2017afb3bd Dave Chinner      2013-08-12  3602  =

c9cfdb381172174 Brian Foster      2018-07-11  3603  	error =3D xfs_finish_r=
ename(tp);
b519cd5b0b01554 Allison Henderson 2021-03-24  3604  =

b519cd5b0b01554 Allison Henderson 2021-03-24  3605  out_unlock:
7dcf5c3e4527cfa Dave Chinner      2015-03-25  3606  	if (wip)
44a8736bd20a08e Darrick J. Wong   2018-07-25  3607  		xfs_irele(wip);
b519cd5b0b01554 Allison Henderson 2021-03-24  3608  	if (wip)
b519cd5b0b01554 Allison Henderson 2021-03-24  3609  		xfs_iunlock(wip, XFS_=
ILOCK_EXCL);
b519cd5b0b01554 Allison Henderson 2021-03-24  3610  	if (target_ip)
b519cd5b0b01554 Allison Henderson 2021-03-24  3611  		xfs_iunlock(target_ip=
, XFS_ILOCK_EXCL);
b519cd5b0b01554 Allison Henderson 2021-03-24  3612  	xfs_iunlock(src_ip, XF=
S_ILOCK_EXCL);
b519cd5b0b01554 Allison Henderson 2021-03-24  3613  	if (new_parent)
b519cd5b0b01554 Allison Henderson 2021-03-24  3614  		xfs_iunlock(target_dp=
, XFS_ILOCK_EXCL);
b519cd5b0b01554 Allison Henderson 2021-03-24  3615  	xfs_iunlock(src_dp, XF=
S_ILOCK_EXCL);
b519cd5b0b01554 Allison Henderson 2021-03-24  3616  =

7dcf5c3e4527cfa Dave Chinner      2015-03-25  3617  	return error;
f6bba2017afb3bd Dave Chinner      2013-08-12  3618  =

445883e8133975f Dave Chinner      2015-03-25  3619  out_trans_cancel:
4906e21545814e4 Christoph Hellwig 2015-06-04  3620  	xfs_trans_cancel(tp);
b519cd5b0b01554 Allison Henderson 2021-03-24  3621  drop_incompat:
b519cd5b0b01554 Allison Henderson 2021-03-24  3622  	if (xfs_has_larp(mp))
b519cd5b0b01554 Allison Henderson 2021-03-24  3623  		xlog_drop_incompat_fe=
at(mp->m_log);
253f4911f297b83 Christoph Hellwig 2016-04-06  3624  out_release_wip:
7dcf5c3e4527cfa Dave Chinner      2015-03-25  3625  	if (wip)
44a8736bd20a08e Darrick J. Wong   2018-07-25  3626  		xfs_irele(wip);
f6bba2017afb3bd Dave Chinner      2013-08-12  3627  	return error;
f6bba2017afb3bd Dave Chinner      2013-08-12  3628  }
f6bba2017afb3bd Dave Chinner      2013-08-12  3629  =


---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all(a)lists.01.org
--===============6645457960294988370==--

