Content-Type: multipart/mixed; boundary="===============0709647786719658189=="
MIME-Version: 1.0
From: Dan Carpenter <dan.carpenter@oracle.com>
Subject: [mchinth:sep_socwatch_linux_5_5 28/29] drivers/platform/x86/socwatch/sw_driver.c:1058 sw_get_cta_aggregators_i() warn: maybe return -EFAULT instead of the bytes remaining?
Date: Fri, 03 Jan 2020 10:25:29 +0300
Message-ID: <20200103072529.GC3889@kadam>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============0709647786719658189==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

tree:   https://github.com/mchinth/linux sep_socwatch_linux_5_5
head:   2700ee532223884d15fda737936627a209f07e6d
commit: f5143b5fa69b72d17dae5c27ee25edcbd389d05f [28/29] platform/x86: Upda=
te SoCWatch driver for 5.4 pull

If you fix the issue, kindly add following tag
Reported-by: kbuild test robot <lkp@intel.com>
Reported-by: Dan Carpenter <dan.carpenter@oracle.com>

New smatch warnings:
drivers/platform/x86/socwatch/sw_driver.c:1058 sw_get_cta_aggregators_i() w=
arn: maybe return -EFAULT instead of the bytes remaining?

Old smatch warnings:
drivers/platform/x86/socwatch/sw_driver.c:698 sw_set_driver_infos_i() warn:=
 variable dereferenced before check 'local_msg' (see line 695)
drivers/platform/x86/socwatch/sw_driver.c:998 sw_get_available_name_id_mapp=
ings_i() warn: maybe return -EFAULT instead of the bytes remaining?
drivers/platform/x86/socwatch/sw_driver.c:1048 sw_get_topology_changes_i() =
warn: maybe return -EFAULT instead of the bytes remaining?

# https://github.com/mchinth/linux/commit/f5143b5fa69b72d17dae5c27ee25edcbd=
389d05f
git remote add mchinth https://github.com/mchinth/linux
git remote update mchinth
git checkout f5143b5fa69b72d17dae5c27ee25edcbd389d05f
vim +1058 drivers/platform/x86/socwatch/sw_driver.c

  1034          dst =3D (struct sw_driver_topology_change *)&local_msg
  1035                        ->topology_entries[0];
  1036          SW_LIST_FOR_EACH_ENTRY(tnode, head, list)
  1037          {
  1038                  struct sw_driver_topology_change *change =3D &tnode=
->change;
  1039  =

  1040                  memcpy(&dst[dst_idx++], change, sizeof(*change));
  1041          }
  1042          retVal =3D copy_to_user(remote_msg, local_msg, buffer_len);
                ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

  1043          if (retVal)
  1044                  pw_pr_error(
  1045                          "ERROR: couldn't copy topology changes to u=
ser space!\n");
  1046  =

  1047          vfree(buffer);
  1048          return retVal;
  1049  }
  1050  =

  1051  static long
  1052  sw_get_cta_aggregators_i(struct _sw_aggregator_msg __user *remote_m=
sg,
  1053                            size_t local_len)
  1054  {
  1055          const struct _sw_aggregator_msg *_msg =3D sw_get_cta_aggreg=
ators();
  1056          long retval =3D copy_to_user(remote_msg, _msg, sizeof(*_msg=
));
                     ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
This gets passed back to the user as an ioctl return.

  1057  =

  1058          return retval;
  1059  }


---
0-DAY kernel test infrastructure                 Open Source Technology Cen=
ter
https://lists.01.org/hyperkitty/list/kbuild-all(a)lists.01.org Intel Corpor=
ation
--===============0709647786719658189==--

