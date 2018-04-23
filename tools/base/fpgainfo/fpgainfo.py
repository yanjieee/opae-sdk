#!/usr/bin/env python
# Copyright(c) 2017, Intel Corporation
##
# Redistribution  and  use  in source  and  binary  forms,  with  or  without
# modification, are permitted provided that the following conditions are met:
##
# * Redistributions of  source code  must retain the  above copyright notice,
# this list of conditions and the following disclaimer.
# * Redistributions in binary form must reproduce the above copyright notice,
# this list of conditions and the following disclaimer in the documentation
# and/or other materials provided with the distribution.
# * Neither the name  of Intel Corporation  nor the names of its contributors
# may be used to  endorse or promote  products derived  from this  software
# without specific prior written permission.
##
# THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS "AS IS"
# AND ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING,  BUT NOT LIMITED TO,  THE
# IMPLIED WARRANTIES OF  MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE
# ARE DISCLAIMED.  IN NO EVENT  SHALL THE COPYRIGHT OWNER  OR CONTRIBUTORS BE
# LIABLE  FOR  ANY  DIRECT,  INDIRECT,  INCIDENTAL,  SPECIAL,  EXEMPLARY,  OR
# CONSEQUENTIAL  DAMAGES  (INCLUDING,  BUT  NOT LIMITED  TO,  PROCUREMENT  OF
# SUBSTITUTE GOODS OR SERVICES;  LOSS OF USE,  DATA, OR PROFITS;  OR BUSINESS
# INTERRUPTION)  HOWEVER CAUSED  AND ON ANY THEORY  OF LIABILITY,  WHETHER IN
# CONTRACT,  STRICT LIABILITY,  OR TORT  (INCLUDING NEGLIGENCE  OR OTHERWISE)
# ARISING IN ANY WAY OUT OF THE USE OF THIS SOFTWARE,  EVEN IF ADVISED OF THE
# POSSIBILITY OF SUCH DAMAGE.
import argparse
import codecs
import fpga_common
import fpgaerr
import fpgapwr
import fpgatemp
import fpga_fmeinfo
import fpga_portinfo
import logging
import sys


def main():
    parser = argparse.ArgumentParser()
    subparsers = parser.add_subparsers(title='fpga commands')

    fpga_common.fpga_command.register_command(subparsers,
                                              fpgaerr.errors_command)

    fpga_common.fpga_command.register_command(subparsers,
                                              fpgapwr.power_command)

    fpga_common.fpga_command.register_command(subparsers,
                                              fpgatemp.temp_command)

    fpga_common.fpga_command.register_command(subparsers,
                                              fpga_fmeinfo.fme_command)

    fpga_common.fpga_command.register_command(subparsers,
                                              fpga_portinfo.port_command)

    args = parser.parse_args()

    logfile = "/tmp/fpgainfo.log"
    formatstr = '%(asctime)s [%(levelname)s] %(message)s'
    try:
        logging.basicConfig(filename=logfile, format=formatstr)
    except IOError:
        logging.basicConfig(stream=sys.stderr, format=formatstr)
        logging.warning("Could not open log file: {}."
                        "Logging to stderr".format(logfile))

    # wrap stdout with the StreamWriter that does unicode
    sys.stdout = codecs.getwriter('UTF-8')(sys.stdout)
    args.func(args)


if __name__ == "__main__":
    main()
