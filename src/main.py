import streamlit as st
import numpy as np
from scipy import stats
import matplotlib.pyplot as plt


def main():
    distribution_type = st.sidebar.selectbox(
        'Distribution type',
        ['Continuous distribution', 'Discrete distribution'],
        index=0,
    )
    if distribution_type == 'Continuous distribution':
        distribution = st.sidebar.radio(
            'Distributions', ['Normal distribution', 'Exponential distribution']
        )
    elif distribution_type == 'Discrete distribution':
        distribution = st.sidebar.radio('Distributions', ['Poisson distribution'])
    else:
        assert False

    if distribution == 'Normal distribution':
        st.write('# Normal distribution')

        col_parameters, col_plot = st.beta_columns(2)
        with col_parameters:
            plot_range = st.slider('Range', -10.0, 10.0, [-3.0, 3.0], 0.1)
            mu = st.slider('Mean', -10.0, 10.0, 0.0, 0.1)
            sigma = st.slider('Standard deviation', 0.1, 10.0, 1.0, 0.1)
        with col_plot:
            x = np.linspace(*plot_range, 100)
            y = stats.norm.pdf(x, loc=mu, scale=sigma)

            fig, ax = plt.subplots()
            ax.plot(x, y)
            st.pyplot(fig)
            plt.close()
    else:
        assert False


if __name__ == "__main__":
    main()
