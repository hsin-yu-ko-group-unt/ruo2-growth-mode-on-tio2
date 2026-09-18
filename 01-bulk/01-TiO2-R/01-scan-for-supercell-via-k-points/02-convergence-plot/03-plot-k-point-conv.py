#!/usr/bin/env python
import numpy as np
import matplotlib as mpl
import matplotlib.pyplot as plt

def krg_defaults(**kwargs):
    ## keyword defaults
    SMALL_SIZE  = kwargs.get('SMALL_SIZE',  18)
    MEDIUM_SIZE = kwargs.get('MEDIUM_SIZE', 24)
    BIGGER_SIZE = kwargs.get('BIGGER_SIZE', 30)
    ###################
    if (kwargs.get('no_tex', False)):
        plt.rcParams.update({
            "text.usetex": False,
            "mathtext.fontset": "cm",      # Computer Modern, same look as LaTeX
            # other good options: "stix", "stixsans", "dejavusans"
            })
    else:
        try:
            plt.rc('text', usetex=True)
            plt.rc('text.latex', preamble=r"\usepackage{amsmath} \usepackage{mhchem} \usepackage{bm} \usepackage{braket}")
        except:
            print("Warning: cannot find latex in the system.")
    font = {'family' : 'Computer Modern',
                       'weight' : 'bold',
                       'size'   :  MEDIUM_SIZE}
    plt.rc('font',   **font)
    plt.rc('axes',   titlesize=SMALL_SIZE)   # fontsize of the axes title
    plt.rc('axes',   labelsize=MEDIUM_SIZE)  # fontsize of the x and y labels
    plt.rc('xtick',  labelsize=SMALL_SIZE)   # fontsize of the tick labels
    plt.rc('ytick',  labelsize=SMALL_SIZE)   # fontsize of the tick labels
    plt.rc('legend', fontsize=SMALL_SIZE)    # legend fontsize
    plt.rc('figure', titlesize=BIGGER_SIZE)  # fontsize of the figure title

def set_backend(**kwargs):
    # input no_display sets to AGG mode
    if (kwargs.get('no_display', False)):
        mpl.use('Agg')

def krg_fig_setup(**kwargs):
    krg_defaults(**kwargs)
    set_backend(**kwargs)
    fig = plt.figure(figsize=kwargs.get('figsize', (6,5)))
    ax = fig.gca()
    ax.grid(linestyle=kwargs.get('linestyle', "dotted"),
            linewidth=kwargs.get('linewidth', 1))
    return fig

def krg_fig_finalize(fig,savefig=True,**kwargs):
    ax = fig.gca()
    ax.set_xlabel(kwargs.get('xlabel',r"$x$ (unit)"))
    ax.set_ylabel(kwargs.get('ylabel',r"$y$ (unit)"))
    ax.set_xlim(kwargs.get('xlim', None))
    ax.set_ylim(kwargs.get('ylim', None))
    fig.set_tight_layout(True)
    if (savefig):
        fig.savefig(fname=kwargs.get('fname', "fig.png"),
                    transparent=kwargs.get('transparent', True),
                    dpi=kwargs.get('dpi', 300))
    if (not kwargs.get('no_display', False)):
        plt.show()

def main(no_tex=False):
    ry2mev= 13.6056995*1000
    fig = krg_fig_setup(no_tex=no_tex)
    dat = np.loadtxt('nks_etot_ry.dat')
    nk1 = dat[:,0]
    nk2 = dat[:,1]
    nk3 = dat[:,2]
    etot = dat[:,3]
    etot -= np.min(etot)
    detot_ev = etot * ry2mev
    plt.plot(nk1/2,detot_ev,'b-')
    krg_fig_finalize(fig=fig,xlabel=r"$n_{k_1}/2 = n_{k_2}/2 = n_{k_3}/3$ (\AA{}$^{-1}$)", ylabel=r"$\Delta E_{tot}$ (meV)",savefig=False)

main()
