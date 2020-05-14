Content-Type: multipart/mixed; boundary="===============8315561749921007512=="
MIME-Version: 1.0
From: kbuild test robot <lkp@intel.com>
Subject: [vireshk-pm:opp/linux-next 4/9] drivers/opp/of.c:662 _read_opp_key() error: double free of 'peak_bw'
Date: Thu, 14 May 2020 09:59:00 +0800
Message-ID: <202005140953.oVmSR7jY%lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============8315561749921007512==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

CC: kbuild-all(a)lists.01.org
TO: Georgi Djakov <georgi.djakov@linaro.org>
CC: Viresh Kumar <viresh.kumar@linaro.org>
CC: Matthias Kaehlcke <mka@chromium.org>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/vireshk/pm.git opp/=
linux-next
head:   b9fd171ae7781c5eb2ecc5f3a59cb41b33c05be0
commit: 6b6c64a05ad880d425db18c52b7ff79d4be148a6 [4/9] OPP: Add support for=
 parsing interconnect bandwidth
:::::: branch date: 16 hours ago
:::::: commit date: 19 hours ago

If you fix the issue, kindly add following tag as appropriate
Reported-by: kbuild test robot <lkp@intel.com>
Reported-by: Dan Carpenter <dan.carpenter@oracle.com>

New smatch warnings:
drivers/opp/of.c:662 _read_opp_key() error: double free of 'peak_bw'

Old smatch warnings:
drivers/opp/of.c:779 _opp_add_static_v2() warn: passing zero to 'ERR_PTR'

# https://git.kernel.org/pub/scm/linux/kernel/git/vireshk/pm.git/commit/?id=
=3D6b6c64a05ad880d425db18c52b7ff79d4be148a6
git remote add vireshk-pm https://git.kernel.org/pub/scm/linux/kernel/git/v=
ireshk/pm.git
git remote update vireshk-pm
git checkout 6b6c64a05ad880d425db18c52b7ff79d4be148a6
vim +/peak_bw +662 drivers/opp/of.c

f47b72a15a9679 drivers/base/power/opp/of.c Viresh Kumar    2016-05-05  579  =

6c591eec67cbb4 drivers/opp/of.c            Saravana Kannan 2020-05-12  580 =
 static int _read_opp_key(struct dev_pm_opp *new_opp, struct device_node *n=
p,
6c591eec67cbb4 drivers/opp/of.c            Saravana Kannan 2020-05-12  581 =
 			 bool *rate_not_available)
6c591eec67cbb4 drivers/opp/of.c            Saravana Kannan 2020-05-12  582 =
 {
6b6c64a05ad880 drivers/opp/of.c            Georgi Djakov   2020-05-12  583 =
 	struct property *peak, *avg;
6b6c64a05ad880 drivers/opp/of.c            Georgi Djakov   2020-05-12  584 =
 	u32 *peak_bw, *avg_bw;
6c591eec67cbb4 drivers/opp/of.c            Saravana Kannan 2020-05-12  585 =
 	u64 rate;
6b6c64a05ad880 drivers/opp/of.c            Georgi Djakov   2020-05-12  586 =
 	int ret, i, count;
6b6c64a05ad880 drivers/opp/of.c            Georgi Djakov   2020-05-12  587 =
 	bool found =3D false;
6c591eec67cbb4 drivers/opp/of.c            Saravana Kannan 2020-05-12  588  =

6c591eec67cbb4 drivers/opp/of.c            Saravana Kannan 2020-05-12  589 =
 	ret =3D of_property_read_u64(np, "opp-hz", &rate);
6c591eec67cbb4 drivers/opp/of.c            Saravana Kannan 2020-05-12  590 =
 	if (!ret) {
6c591eec67cbb4 drivers/opp/of.c            Saravana Kannan 2020-05-12  591 =
 		/*
6c591eec67cbb4 drivers/opp/of.c            Saravana Kannan 2020-05-12  592 =
 		 * Rate is defined as an unsigned long in clk API, and so
6c591eec67cbb4 drivers/opp/of.c            Saravana Kannan 2020-05-12  593 =
 		 * casting explicitly to its type. Must be fixed once rate is 64
6c591eec67cbb4 drivers/opp/of.c            Saravana Kannan 2020-05-12  594 =
 		 * bit guaranteed in clk API.
6c591eec67cbb4 drivers/opp/of.c            Saravana Kannan 2020-05-12  595 =
 		 */
6c591eec67cbb4 drivers/opp/of.c            Saravana Kannan 2020-05-12  596 =
 		new_opp->rate =3D (unsigned long)rate;
6b6c64a05ad880 drivers/opp/of.c            Georgi Djakov   2020-05-12  597 =
 		found =3D true;
6c591eec67cbb4 drivers/opp/of.c            Saravana Kannan 2020-05-12  598 =
 	}
6c591eec67cbb4 drivers/opp/of.c            Saravana Kannan 2020-05-12  599 =
 	*rate_not_available =3D !!ret;
6c591eec67cbb4 drivers/opp/of.c            Saravana Kannan 2020-05-12  600  =

6b6c64a05ad880 drivers/opp/of.c            Georgi Djakov   2020-05-12  601 =
 	peak =3D of_find_property(np, "opp-peak-kBps", NULL);
6b6c64a05ad880 drivers/opp/of.c            Georgi Djakov   2020-05-12  602 =
 	if (peak) {
6b6c64a05ad880 drivers/opp/of.c            Georgi Djakov   2020-05-12  603 =
 		/*
6b6c64a05ad880 drivers/opp/of.c            Georgi Djakov   2020-05-12  604 =
 		 * Bandwidth consists of peak and average (optional) values:
6b6c64a05ad880 drivers/opp/of.c            Georgi Djakov   2020-05-12  605 =
 		 * opp-peak-kBps =3D <path1_value path2_value>;
6b6c64a05ad880 drivers/opp/of.c            Georgi Djakov   2020-05-12  606 =
 		 * opp-avg-kBps =3D <path1_value path2_value>;
6b6c64a05ad880 drivers/opp/of.c            Georgi Djakov   2020-05-12  607 =
 		 */
6b6c64a05ad880 drivers/opp/of.c            Georgi Djakov   2020-05-12  608 =
 		count =3D peak->length / sizeof(u32);
6b6c64a05ad880 drivers/opp/of.c            Georgi Djakov   2020-05-12  609 =
 		peak_bw =3D kmalloc_array(count, sizeof(*peak_bw), GFP_KERNEL);
6b6c64a05ad880 drivers/opp/of.c            Georgi Djakov   2020-05-12  610 =
 		if (!peak_bw)
6b6c64a05ad880 drivers/opp/of.c            Georgi Djakov   2020-05-12  611 =
 			return -ENOMEM;
6b6c64a05ad880 drivers/opp/of.c            Georgi Djakov   2020-05-12  612  =

6b6c64a05ad880 drivers/opp/of.c            Georgi Djakov   2020-05-12  613 =
 		ret =3D of_property_read_u32_array(np, "opp-peak-kBps", peak_bw,
6b6c64a05ad880 drivers/opp/of.c            Georgi Djakov   2020-05-12  614 =
 						 count);
6b6c64a05ad880 drivers/opp/of.c            Georgi Djakov   2020-05-12  615 =
 		if (ret) {
6b6c64a05ad880 drivers/opp/of.c            Georgi Djakov   2020-05-12  616 =
 			pr_err("%s: Error parsing opp-peak-kBps: %d\n",
6b6c64a05ad880 drivers/opp/of.c            Georgi Djakov   2020-05-12  617 =
 			       __func__, ret);
6b6c64a05ad880 drivers/opp/of.c            Georgi Djakov   2020-05-12  618 =
 			goto free_peak_bw;
6b6c64a05ad880 drivers/opp/of.c            Georgi Djakov   2020-05-12  619 =
 		}
6b6c64a05ad880 drivers/opp/of.c            Georgi Djakov   2020-05-12  620  =

6b6c64a05ad880 drivers/opp/of.c            Georgi Djakov   2020-05-12  621 =
 		for (i =3D 0; i < count; i++)
6b6c64a05ad880 drivers/opp/of.c            Georgi Djakov   2020-05-12  622 =
 			new_opp->bandwidth[i].peak =3D kBps_to_icc(peak_bw[i]);
6b6c64a05ad880 drivers/opp/of.c            Georgi Djakov   2020-05-12  623  =

6b6c64a05ad880 drivers/opp/of.c            Georgi Djakov   2020-05-12  624 =
 		found =3D true;
6b6c64a05ad880 drivers/opp/of.c            Georgi Djakov   2020-05-12  625 =
 		kfree(peak_bw);
6b6c64a05ad880 drivers/opp/of.c            Georgi Djakov   2020-05-12  626 =
 	}
6b6c64a05ad880 drivers/opp/of.c            Georgi Djakov   2020-05-12  627  =

6b6c64a05ad880 drivers/opp/of.c            Georgi Djakov   2020-05-12  628 =
 	avg =3D of_find_property(np, "opp-avg-kBps", NULL);
6b6c64a05ad880 drivers/opp/of.c            Georgi Djakov   2020-05-12  629 =
 	if (peak && avg) {
6b6c64a05ad880 drivers/opp/of.c            Georgi Djakov   2020-05-12  630 =
 		count =3D avg->length / sizeof(u32);
6b6c64a05ad880 drivers/opp/of.c            Georgi Djakov   2020-05-12  631 =
 		avg_bw =3D kmalloc_array(count, sizeof(*avg_bw), GFP_KERNEL);
6b6c64a05ad880 drivers/opp/of.c            Georgi Djakov   2020-05-12  632 =
 		if (!avg_bw) {
6b6c64a05ad880 drivers/opp/of.c            Georgi Djakov   2020-05-12  633 =
 			ret =3D -ENOMEM;
6b6c64a05ad880 drivers/opp/of.c            Georgi Djakov   2020-05-12  634 =
 			goto free_peak_bw;
6b6c64a05ad880 drivers/opp/of.c            Georgi Djakov   2020-05-12  635 =
 		}
6b6c64a05ad880 drivers/opp/of.c            Georgi Djakov   2020-05-12  636  =

6b6c64a05ad880 drivers/opp/of.c            Georgi Djakov   2020-05-12  637 =
 		ret =3D of_property_read_u32_array(np, "opp-avg-kBps", avg_bw,
6b6c64a05ad880 drivers/opp/of.c            Georgi Djakov   2020-05-12  638 =
 						 count);
6b6c64a05ad880 drivers/opp/of.c            Georgi Djakov   2020-05-12  639 =
 		if (ret) {
6b6c64a05ad880 drivers/opp/of.c            Georgi Djakov   2020-05-12  640 =
 			pr_err("%s: Error parsing opp-avg-kBps: %d\n",
6b6c64a05ad880 drivers/opp/of.c            Georgi Djakov   2020-05-12  641 =
 			       __func__, ret);
6b6c64a05ad880 drivers/opp/of.c            Georgi Djakov   2020-05-12  642 =
 			goto free_avg_bw;
6b6c64a05ad880 drivers/opp/of.c            Georgi Djakov   2020-05-12  643 =
 		}
6b6c64a05ad880 drivers/opp/of.c            Georgi Djakov   2020-05-12  644  =

6b6c64a05ad880 drivers/opp/of.c            Georgi Djakov   2020-05-12  645 =
 		for (i =3D 0; i < count; i++)
6b6c64a05ad880 drivers/opp/of.c            Georgi Djakov   2020-05-12  646 =
 			new_opp->bandwidth[i].avg =3D kBps_to_icc(avg_bw[i]);
6b6c64a05ad880 drivers/opp/of.c            Georgi Djakov   2020-05-12  647  =

6b6c64a05ad880 drivers/opp/of.c            Georgi Djakov   2020-05-12  648 =
 		kfree(avg_bw);
6b6c64a05ad880 drivers/opp/of.c            Georgi Djakov   2020-05-12  649 =
 	}
6b6c64a05ad880 drivers/opp/of.c            Georgi Djakov   2020-05-12  650  =

6b6c64a05ad880 drivers/opp/of.c            Georgi Djakov   2020-05-12  651 =
 	if (!of_property_read_u32(np, "opp-level", &new_opp->level))
6b6c64a05ad880 drivers/opp/of.c            Georgi Djakov   2020-05-12  652 =
 		found =3D true;
6b6c64a05ad880 drivers/opp/of.c            Georgi Djakov   2020-05-12  653  =

6b6c64a05ad880 drivers/opp/of.c            Georgi Djakov   2020-05-12  654 =
 	if (found)
6b6c64a05ad880 drivers/opp/of.c            Georgi Djakov   2020-05-12  655 =
 		return 0;
6b6c64a05ad880 drivers/opp/of.c            Georgi Djakov   2020-05-12  656  =

6b6c64a05ad880 drivers/opp/of.c            Georgi Djakov   2020-05-12  657 =
 	return ret;
6b6c64a05ad880 drivers/opp/of.c            Georgi Djakov   2020-05-12  658  =

6b6c64a05ad880 drivers/opp/of.c            Georgi Djakov   2020-05-12  659 =
 free_avg_bw:
6b6c64a05ad880 drivers/opp/of.c            Georgi Djakov   2020-05-12  660 =
 	kfree(avg_bw);
6b6c64a05ad880 drivers/opp/of.c            Georgi Djakov   2020-05-12  661 =
 free_peak_bw:
6b6c64a05ad880 drivers/opp/of.c            Georgi Djakov   2020-05-12 @662 =
 	kfree(peak_bw);
6c591eec67cbb4 drivers/opp/of.c            Saravana Kannan 2020-05-12  663  =

6c591eec67cbb4 drivers/opp/of.c            Saravana Kannan 2020-05-12  664 =
 	return ret;
6c591eec67cbb4 drivers/opp/of.c            Saravana Kannan 2020-05-12  665 =
 }
6c591eec67cbb4 drivers/opp/of.c            Saravana Kannan 2020-05-12  666  =


---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all(a)lists.01.org
--===============8315561749921007512==--

